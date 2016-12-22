//
//  {{args.Prefix}}PagingListController.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 12/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}PagingListController.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}PagingListSizes.h"
#import "{{args.Prefix}}UniversalRouter.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "{{args.Prefix}}UserDataManager.h"
#import "RKMappingResult+{{args.Prefix}}NetworkResultMapping.h"
#import "NSObject+{{args.Prefix}}BaseRequest.h"
#import "UIView+{{args.Prefix}}Loading.h"
#import "{{args.Prefix}}LoadingSizes.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}NoMoreDataFooterView.h"
#import "{{args.Prefix}}RefreshView.h"
#import "UITableView+MCRegisterCellClass.h"
#import "{{args.Prefix}}LoadmoreView.h"
#import "HTTableViewDataSourceDelegate.h"
#import "NSArray+DataSource.h"
#import "UIView+{{args.Prefix}}Toast.h"
#import "{{args.Prefix}}PagingListCell.h"
#import "{{args.Prefix}}PagingListCellViewModel.h"
#import "NSObject+{{args.Prefix}}BaseRequest.h"

@interface {{args.Prefix}}PagingListController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HTTableViewDataSourceDelegate<UITableViewDataSource, UITableViewDelegate> *dataSource;
@property (nonatomic, strong) {{args.Prefix}}RefreshView *refreshView;
@property (nonatomic, strong) {{args.Prefix}}LoadmoreView  *loadmoreView;
@property (nonatomic, strong) {{args.Prefix}}NoMoreDataFooterView *footerView;
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, assign) NSInteger pageSize;

@property (nonatomic, strong) NSMutableArray<NSNumber *> *pagingListDatas;

@end

@implementation {{args.Prefix}}PagingListController

#pragma mark - Life cycle.

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    
    // 设置导航栏的文字
    self.title = @"分页加载列表";
    [self loadSubviews];
    
    _pagingListDatas = [[NSMutableArray alloc] init];
    [self loadListDatas];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    _tableView.frame = self.view.bounds;
    _refreshView.size = CGSizeMake(_tableView.width, [{{args.Prefix}}LoadingSizes refreshViewHeight]);
    _loadmoreView.size = CGSizeMake(_tableView.width, [{{args.Prefix}}LoadingSizes loadmoreViewHeight]);
}


#pragma mark - Load views.

-(void)loadSubviews {
    @{{args.Prefix}}Weak(self);
    // HTTableViewDataSourceDelegate 的详细使用请参考模板说明文档
    _dataSource = [HTTableViewDataSourceDelegate dataSourceWithModel:nil cellTypeMap:@{NSStringFromClass([NSNumber class]): NSStringFromClass([{{args.Prefix}}PagingListCell class])} tableViewDelegate:self cellConfiguration:^({{args.Prefix}}PagingListCell *cell, id model, NSIndexPath *indexPath) {
        cell.fd_enforceFrameLayout = YES;
        cell.viewModel = [[{{args.Prefix}}PagingListCellViewModel alloc] initWithIndexNumber:model];
    }];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = [{{args.Prefix}}ThemeColors themeBackgroundColor];
    [self.view addSubview:_tableView];
    _tableView.delegate = _dataSource;
    _tableView.dataSource = _dataSource;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerCellClasses:@[[{{args.Prefix}}PagingListCell class]]];
    
    // 提示没有更多数据了
    _footerView = [[{{args.Prefix}}NoMoreDataFooterView alloc] initWithFrame:CGRectMake(0, 0, [{{args.Prefix}}ThemeSizes screenWidth], [{{args.Prefix}}LoadingSizes loadmoreViewHeight])];
    
    // 下拉刷新
    _refreshView = [[{{args.Prefix}}RefreshView alloc] initWithScrollView:_tableView direction:HTRefreshDirectionTop followScrollView:YES];
    [_refreshView addRefreshingHandler:^(HTRefreshView *view) {
        [weakSelf refreshListDatas];
    }];
    
    // tableView 底部的加载更多。note：如需深入了解下拉刷新和加载更多的使用方法，请参考模板说明文档
    _loadmoreView = [[{{args.Prefix}}LoadmoreView alloc] initWithScrollView:_tableView direction:HTRefreshDirectionBottom followScrollView:YES];
    _loadmoreView.triggerLoadMoreMode = HTTriggerLoadMoreModeAutoTrigger;
    [_tableView ht_setOriginalContentInset:UIEdgeInsetsMake([{{args.Prefix}}ThemeSizes navigationHeight], 0, [{{args.Prefix}}ThemeSizes tabHeight], 0)];
    _loadmoreView.hiddenRefresh = YES;
    _loadmoreView.refreshEnabled = NO;
    [_loadmoreView addRefreshingHandler:^(HTRefreshView *view) {
        [weakSelf loadmoreListDatas];
    }];   
}


#pragma mark - Load datas.

// 下面几个方法基本包含了通常页面的所有数据加载逻辑，进入页面的初始加载、下拉刷新、上滑页面加载更多数据。
- (void)loadListDatas {
    _pageNum = [{{args.Prefix}}ThemeSizes initialPageNumber];
    _pageSize = [{{args.Prefix}}ThemeSizes loadmorePageSize];
    [self.view {{args.CategoryPrefix}}_showLoading];
    [self clearRequests];
    
    @{{args.Prefix}}Weak(self);
    // 下面可以做网络请求获取列表的数据，这里给出一个示例。
    [self baseFlowRequestWithBlock:^HTBaseRequest *{
        // 这里根据产品页面实际请求进行新建 request
//        {{args.Prefix}}TestRequest *request = [[{{args.Prefix}}TestRequest alloc] init];
//        request.ak = [{{args.Prefix}}UserDataManager sharedInstance].token;
//        request.page = weakSelf.pageNum;
//        request.size = weakSelf.pageSize;
//        return request;
        return nil;
    } success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        [weakSelf.pagingListDatas removeAllObjects];
        NSMutableArray *newDatas = mappingResult.dataInfo;
        for (int i = 0; i < newDatas.count; i++) {
            [weakSelf.pagingListDatas addObject:newDatas[i]];
        }
        [weakSelf.view {{args.CategoryPrefix}}_hideLoading];
        weakSelf.pageNum++;
        weakSelf.dataSource.model = weakSelf.pagingListDatas;
        [weakSelf.tableView reloadData];
        [weakSelf processRefreshWithNewDataNumber:newDatas.count];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        [weakSelf.view {{args.CategoryPrefix}}_showLoadingError:^{
            [weakSelf loadListDatas];
        }];
    }];
    
    // 上面给出了实际写业务代码时的示例。下面是本工程为了展示页面，创建的 20 条模拟数据，并执行了 request 成功的逻辑。注意下面的代码只是示例用，实际应用开发的代码中请填写上面的代码，将下面的这些代码删除。
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSThread sleepForTimeInterval:2];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.pagingListDatas removeAllObjects];
            for (int i = 0; i < 20; i++) {
                [weakSelf.pagingListDatas addObject:@(i)];
            }
            [self.view {{args.CategoryPrefix}}_hideLoading];
            weakSelf.pageNum++;
            weakSelf.dataSource.model = weakSelf.pagingListDatas;
            [weakSelf.tableView reloadData];
            [self processRefreshWithNewDataNumber:20];
        });
    });
}

- (void)processRefreshWithNewDataNumber:(NSInteger)newDataNumber {
    BOOL hasMore = newDataNumber >= _pageSize;
    if (!hasMore) {
        if (_tableView.contentSize.height > _tableView.bounds.size.height) {
            _tableView.tableFooterView = _footerView;
        } else {
            _tableView.tableFooterView = nil;
        }
        [_loadmoreView setRefreshEnabled:NO];
        [_loadmoreView setHiddenRefresh:YES];
    } else {
        [_loadmoreView setRefreshEnabled:YES];
        [_loadmoreView setHiddenRefresh:NO];
        _tableView.tableFooterView = nil;
    }
    
    if (!_pagingListDatas || _pagingListDatas.count == 0) {
        [self.view {{args.CategoryPrefix}}_hideLoadingError];
        [self.view {{args.CategoryPrefix}}_showLoadingEmpty:nil];
    } else {
        [self.view {{args.CategoryPrefix}}_hideLoadingEmpty];
    }
}

- (void)refreshListDatas {
    [_loadmoreView endRefresh:YES];
    [self clearRequests];
    
    NSInteger lastPageNumber = _pageNum;
    _pageNum = [{{args.Prefix}}ThemeSizes initialPageNumber];
    @{{args.Prefix}}Weak(self);
    [self baseFlowRequestWithBlock:^HTBaseRequest *{
//        // 这里根据产品页面实际请求进行新建 request
//        {{args.Prefix}}TestRequest *request = [[{{args.Prefix}}TestRequest alloc] init];
//        request.ak = [{{args.Prefix}}UserDataManager sharedInstance].token;
//        request.page = weakSelf.pageNum;
//        request.size = weakSelf.pageSize;
//        return request;
        return nil;
    } success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        [weakSelf.pagingListDatas removeAllObjects];
        NSMutableArray *newDatas = mappingResult.dataInfo;
        for (int i = 0; i < newDatas.count; i++) {
            [weakSelf.pagingListDatas addObject:newDatas[i]];
        }
        [weakSelf.view {{args.CategoryPrefix}}_hideLoading];
        [weakSelf.refreshView endRefresh:YES];
        weakSelf.pageNum++;
        weakSelf.dataSource.model = weakSelf.pagingListDatas;
        [weakSelf.tableView reloadData];
        [weakSelf processRefreshWithNewDataNumber:newDatas.count];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        [weakSelf.refreshView endRefresh:YES];
        // 下面只是弹窗提示刷新失败，如需要具体原因可查看 error 或者通过 operation.mappingResult 解析服务器返回的 code。
        [weakSelf.view {{args.CategoryPrefix}}_showToastWithMessage:@"刷新失败，请重试"];
        weakSelf.pageNum = lastPageNumber;
    }];
    
    // 上面给出了实际写业务代码时的示例。下面是本工程为了展示页面，创建模拟数据，并执行了 request 成功的逻辑。注意下面的代码只是示例用，实际应用开发的代码中请填写上面的代码，将下面的这些代码删除。
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSThread sleepForTimeInterval:2];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.pagingListDatas removeAllObjects];
            for (int i = 0; i < 20; i++) {
                [weakSelf.pagingListDatas addObject:@(i)];
            }
            [self.view {{args.CategoryPrefix}}_hideLoading];
            [weakSelf.refreshView endRefresh:YES];
            weakSelf.pageNum++;
            weakSelf.dataSource.model = weakSelf.pagingListDatas;
            [weakSelf.tableView reloadData];
            [self processRefreshWithNewDataNumber:20];
        });
    });
}

- (void)loadmoreListDatas {
    [_refreshView endRefresh:YES];
    [self clearRequests];
    
    @{{args.Prefix}}Weak(self);
    [self baseFlowRequestWithBlock:^HTBaseRequest *{
//        // 这里根据产品页面实际请求进行新建 request
//        {{args.Prefix}}TestRequest *request = [[{{args.Prefix}}TestRequest alloc] init];
//        request.ak = [{{args.Prefix}}UserDataManager sharedInstance].token;
//        request.page = weakSelf.pageNum;
//        request.size = weakSelf.pageSize;
//        return request;
        return nil;
    } success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        NSMutableArray *newDatas = mappingResult.dataInfo;
        for (int i = 0; i < newDatas.count; i++) {
            [weakSelf.pagingListDatas addObject:newDatas[i]];
        }
        [weakSelf.view {{args.CategoryPrefix}}_hideLoading];
        [weakSelf.loadmoreView endRefresh:YES];
        weakSelf.pageNum++;
        weakSelf.dataSource.model = weakSelf.pagingListDatas;
        [weakSelf.tableView reloadData];
        [weakSelf processRefreshWithNewDataNumber:newDatas.count];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        [weakSelf.loadmoreView endRefresh:YES];
        [weakSelf.view {{args.CategoryPrefix}}_showToastWithMessage:@"加载失败，请重试"];
    }];
    
    // 上面给出了实际写业务代码时的示例。下面是本工程为了展示页面，创建模拟数据，并执行了 request 成功的逻辑。注意下面的代码只是示例用，实际应用开发的代码中请填写上面的代码，将下面的这些代码删除。
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSThread sleepForTimeInterval:2];
        dispatch_async(dispatch_get_main_queue(), ^{
            NSInteger newDataCount = 15;
            if (weakSelf.pagingListDatas.count > 100) {
                newDataCount = 5;
            }
            
            NSInteger baseCount = weakSelf.pagingListDatas.count;
            for (int i = 0; i < newDataCount; i++) {
                [weakSelf.pagingListDatas addObject:@(i + baseCount)];
            }
            
            [weakSelf.view {{args.CategoryPrefix}}_hideLoading];
            [weakSelf.loadmoreView endRefresh:YES];
            weakSelf.pageNum++;
            weakSelf.dataSource.model = weakSelf.pagingListDatas;
            [weakSelf.tableView reloadData];
            [weakSelf processRefreshWithNewDataNumber:newDataCount];
        });
    });
}


#pragma mark - UITableViewDelegate.

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // HTUniversalRouter 的使用，这里只是给出一个示例，并没有真正实现下一级页面。关于 HTUniversalRouter 的详细使用请参考模板说明文档
    HTControllerRouteParam *param = [[HTControllerRouteParam alloc] init];
    param.url = @"{{args.CategoryPrefix}}://pagingList/detail";
    param.launchMode = HTControllerLaunchModePushNavigation;
    param.fromViewController = [APPDELEGATE() rootNavigationController];
    param.delegate = self;
    param.params = _pagingListDatas[indexPath.row];
    [[HTControllerRouter sharedRouter] route:param];
}

@end
