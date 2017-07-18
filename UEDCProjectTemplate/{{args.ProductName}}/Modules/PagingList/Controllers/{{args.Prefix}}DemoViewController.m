//
//  {{args.Prefix}}DemoViewController.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/3/24.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}DemoViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}DemoTableViewCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "{{args.Prefix}}ProductlistRequest.h"
#import "{{args.Prefix}}Product.h"
#import "{{args.Prefix}}Productlist.h"

@interface {{args.Prefix}}DemoViewController () <HTRouteTargetProtocol,
                                            HTContainerViewControllerProtocol,
                                            HTNavigationBackPanGestureProtocol>

@end

@implementation {{args.Prefix}}DemoViewController

@synthesize containerController;


#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://demoproductlist";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark --- Life Cycle ---

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品列表";
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    // 若要修改tableview／refreshview／loadmoreview的frame，在这里修改
}

#pragma mark --- Override BaseTableViewController Methods ---

/**
 初始化HTTableViewDataSourceDelegate配置，tableview注册cell。 （refreshView/loadmoreView/statusView均已由基类完成）
 */
- (void)loadSubviews{
    [super loadSubviews];
    
    // HTTableViewDataSourceDelegate 的详细使用请参考模板说明文档
    self.dataSource =
    [HTTableViewDataSourceDelegate dataSourceWithModel:self.listDatas
                                           cellTypeMap:@{NSStringFromClass([{{args.Prefix}}Product class]): NSStringFromClass([{{args.Prefix}}DemoTableViewCell class])}
                                     tableViewDelegate:self
                                     cellConfiguration:^({{args.Prefix}}DemoTableViewCell *cell, id model, NSIndexPath *indexPath) {
                                         cell.fd_enforceFrameLayout = YES;
                                         cell.model = model;
                                     }];
    [self.tableView registerClass:[{{args.Prefix}}DemoTableViewCell class] forCellReuseIdentifier:NSStringFromClass([{{args.Prefix}}DemoTableViewCell class])];
    self.tableView.delegate = self.dataSource;
    self.tableView.dataSource = self.dataSource;
}

- (HTBaseRequest *)configRequest{
    {{args.Prefix}}ProductlistRequest * request = [[{{args.Prefix}}ProductlistRequest  alloc] init];
    request.page = self.page;
    request.pageSize = self.pageSize;
    [self cancelRequestWhenControllerDealloc:request];
    return request;
}

- (void)onSuccessResponseWithData:(RKMappingResult *)mappingResult
                    withOperation:(RKObjectRequestOperation *)opration{
    {{args.Prefix}}Productlist * data = [mappingResult.dictionary valueForKey:@"data"];
    [self.listDatas addObjectsFromArray:data.productlist];
    self.hasMore = data.hasMore;
}

#pragma mark --- UITableViewDelegate ---

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // HTUniversalRouter 的使用，这里只是给出一个示例，并没有真正实现下一级页面。关于 HTUniversalRouter 的详细使用请参考模板说明文档
    HTControllerRouteParam *param = [[HTControllerRouteParam alloc] init];
    param.url = @"{{args.Prefix}}://pagingList/detail";
    param.launchMode = HTControllerLaunchModePushNavigation;
    param.fromViewController = [APPDELEGATE() rootNavigationController];
    param.delegate = self;
    param.params = self.listDatas[indexPath.row];
    [[HTControllerRouter sharedRouter] route:param];
}
@end
