//
//  {{args.Prefix}}BaseTableViewController.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/3/24.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}BaseViewController.h"
#import "{{args.Prefix}}NoMoreDataFooterView.h"
#import "{{args.Prefix}}RefreshView.h"
#import "UITableView+MCRegisterCellClass.h"
#import "UIView+{{args.Prefix}}Loading.h"
#import "{{args.Prefix}}LoadmoreView.h"
#import "HTTableViewDataSourceDelegate.h"
#import "NSArray+DataSource.h"
#import "UIView+{{args.Prefix}}Toast.h"
#import "NSObject+{{args.Prefix}}BaseRequest.h"

@interface {{args.Prefix}}BaseTableViewController : {{args.Prefix}}BaseViewController <UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HTTableViewDataSourceDelegate<UITableViewDataSource, UITableViewDelegate> *dataSource; 
@property (nonatomic, strong) {{args.Prefix}}RefreshView *refreshView;
@property (nonatomic, strong) {{args.Prefix}}LoadmoreView *loadmoreView;
@property (nonatomic, strong) {{args.Prefix}}NoMoreDataFooterView *footerView;
@property (nonatomic, strong) NSMutableArray<HTTableViewDataSourceDataModelProtocol> *listDatas; // 页面持有的数据，为HTTableViewDataSourceDataModel
@property (nonatomic, assign) BOOL hasMore;   //接口是否还有更多数据的判断
@property (nonatomic, assign) NSUInteger page;   //列表类型request的通用请求参数，表示需要请求第几页的数据
@property (nonatomic, assign) NSUInteger pageSize;  //列表类型request的通用请求参数，表示每一页需要请求多少条数据

#pragma mark --- 必须要被子类实现的方法 ---

/**
 初始化设置tableview／refreshView/loadmoreView/statusView控件，已由基类完成
 子类需要初始化HTTableViewDataSourceDelegate配置，已经tableview注册cell。
 若还有其它subview，也在这里初始化
 */
- (void)loadSubviews;

/**
 配置页面的Request，之后页面将会根据该request进行数据的请求

 @return HTBaseRequest
 */
- (HTBaseRequest *)configRequest;

/**
 request请求成功返回数据之后的处理

 @param mappingResult RKMappingResult，获取数据的方式可参考{{args.Prefix}}DemoListViewController
 @param opration RKObjectRequestOperation
 */
- (void)onSuccessResponseWithData:(RKMappingResult *)mappingResult
                    withOperation:(RKObjectRequestOperation *)opration;

#pragma mark --- 基类已经实现，子类若需自定义，可重写的方法 ---

/**
 是否具体下拉刷新控件，默认为YES
 
 @return YES or NO
 */
- (BOOL)hasRefreshView;

/**
 是否具有上拉加载更多控件，默认为YES
 
 @return YES or NO
 */
- (BOOL)hasLoadMoreView;

/**
 基准的请求返回处理流程，可供firstLoadData，refreshData，loadMoreData调用

 @param success 额外自定义的成功回调处理
 @param failure 额外自定义的失败会掉处理
 */
- (void)loadDataWithSuccess:(void (^)(void))success
                    failure:(void (^)(NSError *error))failure;

/**
 页面第一次加载数据的具体流程实现
 */
- (void)firstLoadData;

/**
 刷新listData的具体实现，下拉refreshView后将会触发
 */
- (void)refreshData;

/**
 加载更多listData的具体实现，上拉LoadMoreView后将会触发
 */
- (void)loadMoreData;

/**
 根据数据源的状态调整页面显示状态：空白页，错误页，是否可以刷新，加载更多等

 @param hasMoreDatas 是否还有更多数据
 */
- (void)adjustViewStatus:(BOOL)hasMoreDatas;


@end
