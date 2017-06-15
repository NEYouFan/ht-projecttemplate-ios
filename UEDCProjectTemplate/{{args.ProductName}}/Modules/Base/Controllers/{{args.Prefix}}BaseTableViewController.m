//
//  {{args.Prefix}}BaseTableViewController.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/3/24.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}BaseTableViewController.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "UIView+Frame.h"
#import "UITableView+MCRegisterCellClass.h"
#import "HTTableViewDataSourceDelegate.h"

@interface {{args.Prefix}}BaseTableViewController ()

@end

@implementation {{args.Prefix}}BaseTableViewController

#pragma mark --- Life Cycle ---

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    _listDatas = [[NSMutableArray alloc] init];
    [self loadSubviews];
    [self firstLoadData];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    _tableView.frame = self.view.bounds;
    _refreshView.size = CGSizeMake(_tableView.width, kRefreshViewHeight);
    _loadmoreView.size = CGSizeMake(_tableView.width, kLoadmoreViewHeight);
}

#pragma mark --- 必须要被子类实现的方法 ---

/**
 初始化设置tableview／refreshView/loadmoreView/statusView控件，已由基类完成
 子类需要初始化HTTableViewDataSourceDelegate配置，已经tableview注册cell。
 若还有其它subview，也在这里初始化
 */
- (void)loadSubviews{
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
    [self.view addSubview:_tableView];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 提示没有更多数据了
    _footerView = [[{{args.Prefix}}NoMoreDataFooterView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kLoadmoreViewHeight)];
    
    // 下拉刷新
    @{{args.Prefix}}Weak(self);
    _refreshView = [[{{args.Prefix}}RefreshView alloc] initWithScrollView:_tableView direction:HTRefreshDirectionTop followScrollView:YES];
    [_refreshView addRefreshingHandler:^(HTRefreshView *view) {
        if ([weakSelf respondsToSelector:@selector(refreshData)]) {
            [weakSelf refreshData];
        }
    }];
    
    // tableView 底部的加载更多。note：如需深入了解下拉刷新和加载更多的使用方法，请参考模板说明文档
    _loadmoreView = [[{{args.Prefix}}LoadmoreView alloc] initWithScrollView:_tableView direction:HTRefreshDirectionBottom followScrollView:YES];
    _loadmoreView.triggerLoadMoreMode = HTTriggerLoadMoreModeAutoTrigger;
    [_tableView ht_setOriginalContentInset:UIEdgeInsetsMake(kNavigationHeight, 0, kTabHeight, 0)];
    _loadmoreView.hiddenRefresh = YES;
    _loadmoreView.refreshEnabled = NO;
    [_loadmoreView addRefreshingHandler:^(HTRefreshView *view) {
        if ([weakSelf respondsToSelector:@selector(loadMoreData)]) {
            [weakSelf loadMoreData];
        }
    }];
}

/**
 配置页面的Request，之后页面将会根据该request进行数据的请求
 
 @return HTBaseRequest
 */
- (HTBaseRequest *)configRequest{
    NSAssert(NO, @"configRequest 必须由具体的子类来实现");
    return nil;
}

/**
 request请求成功返回数据之后的处理
 
 @param mappingResult RKMappingResult，获取数据的方式可参考{{args.Prefix}}DemoListViewController
 @param opration RKObjectRequestOperation
 */
- (void)onSuccessResponseWithData:(RKMappingResult *)mappingResult
                    withOperation:(RKObjectRequestOperation *)opration{
    NSAssert(NO, @"onSuccessResponseWithData: withOperation: 必须由具体的子类来实现");
}

#pragma mark --- 基类已经实现，子类若需自定义，可重写的方法 ---

/**
 是否具体下拉刷新控件，默认为YES
 
 @return YES or NO
 */
- (BOOL)hasRefreshView{
    return YES;
}

/**
 是否具有上拉加载更多控件，默认为YES
 
 @return YES or NO
 */
- (BOOL)hasLoadMoreView{
    return YES;
}

/**
 基准的请求返回处理流程，可供firstLoadData，refreshData，loadMoreData调用
 
 @param success 额外自定义的成功回调处理
 @param failure 额外自定义的失败会掉处理
 */
- (void)loadDataWithSuccess:(void (^)(void))success
                    failure:(void (^)(NSError *error))failure {
    @{{args.Prefix}}Weak(self);
    [self baseFlowRequestWithBlock:^HTBaseRequest *{
        return [weakSelf configRequest];
    } success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        [weakSelf.view {{args.CategoryPrefix}}_hideLoading];
        if (success) {
            success();
        }
        _page ++;
        [weakSelf onSuccessResponseWithData:mappingResult
                              withOperation:operation];
        [weakSelf adjustViewStatus:weakSelf.hasMore];
        [weakSelf.tableView reloadData];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

/**
 页面第一次加载数据的具体流程实现
 */
- (void)firstLoadData{
    _page = kInitialPageNumber;
    _pageSize = kLoadmorePageSize;
    [self.view {{args.CategoryPrefix}}_showLoading];
    [self clearRequests];
    @{{args.Prefix}}Weak(self);
    [self loadDataWithSuccess:nil
                      failure:^(NSError *error) {
                          [weakSelf.view {{args.CategoryPrefix}}_showLoadingError:^{
                              [weakSelf firstLoadData];
                          }];
                      }];
}

/**
 刷新listData的具体实现，下拉refreshView后将会触发
 */
- (void)refreshData{
    [self.loadmoreView endRefresh:YES];
    [self clearRequests];
    @{{args.Prefix}}Weak(self);
    NSInteger lastPage = _page;
    _page = kInitialPageNumber;
    [self loadDataWithSuccess:^{
        [weakSelf.listDatas removeAllObjects];
        [weakSelf.refreshView endRefresh:YES];
    } failure:^(NSError *error) {
        [weakSelf.view {{args.CategoryPrefix}}_showToastWithMessage:@"刷新失败，请重试"];
        weakSelf.page = lastPage;
    }];
}

/**
 加载更多listData的具体实现，上拉LoadMoreView后将会触发
 */
- (void)loadMoreData{
    [self.refreshView endRefresh:YES];
    [self clearRequests];
    @{{args.Prefix}}Weak(self);
    [self loadDataWithSuccess:^{
        [weakSelf.loadmoreView endRefresh:YES];
    }failure:^(NSError *error) {
        [weakSelf.loadmoreView endRefresh:YES];
        [weakSelf.view {{args.CategoryPrefix}}_showToastWithMessage:@"加载失败，请重试"];
    }];
}

/**
 根据数据源的状态调整页面显示状态：空白页，错误页，是否可以刷新，加载更多等
 
 @param hasMoreDatas 是否还有更多数据
 */
- (void)adjustViewStatus:(BOOL)hasMoreDatas {
    if (!hasMoreDatas) {
        _tableView.tableFooterView = _footerView;
        [_loadmoreView setRefreshEnabled:NO];
        [_loadmoreView setHiddenRefresh:YES];
    } else {
        [_loadmoreView setRefreshEnabled:YES];
        [_loadmoreView setHiddenRefresh:NO];
        [_loadmoreView endRefresh:YES];
        _tableView.tableFooterView = nil;
    }
    
    if (!_listDatas || _listDatas.count == 0) {
        [self.view {{args.CategoryPrefix}}_hideLoadingError];
        [self.view {{args.CategoryPrefix}}_showLoadingEmpty:nil];
    } else {
        [self.view {{args.CategoryPrefix}}_hideLoadingEmpty];
    }
}

#pragma mark --- Setters & Getters ---

- ({{args.Prefix}}RefreshView *)refreshView{
    if ([self hasRefreshView]) {
        return _refreshView;
    }
    return nil;
}

- ({{args.Prefix}}LoadmoreView *)loadmoreView{
    if ([self hasLoadMoreView]) {
        return _loadmoreView;
    }
    return nil;
}

@end
