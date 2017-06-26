//
//  ___VARIABLE_Prefix:identifier___MineController.m
//  ___VARIABLE_Prefix:identifier___
//
//  Created by Baitianyu on 17/05/2017.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "___VARIABLE_Prefix:identifier___MineController.h"
#import "___VARIABLE_Prefix:identifier___BaseViewController+___VARIABLE_Prefix:identifier___CustomNavigationBar.h"
#import "___VARIABLE_Prefix:identifier___MineCellDescribeData.h"
#import "___VARIABLE_Prefix:identifier___MineOperationCell.h"
#import "___VARIABLE_Prefix:identifier___MineHeaderInfoCell.h"
#import "___VARIABLE_Prefix:identifier___MineSegmentCell.h"
#import "UITableView+MCRegisterCellClass.h"
#import "HTControllerRouter.h"
#import "AppDelegate.h"
#import "___VARIABLE_Prefix:identifier___UserDataManager.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "UIView+___VARIABLE_Prefix:identifier___Line.h"

static const CGFloat kLineLeftMargin = 50;

@interface ___VARIABLE_Prefix:identifier___MineController () <HTRouteTargetProtocol,
                                  HTContainerViewControllerProtocol,
                                  HTNavigationBackPanGestureProtocol,
                                  UINavigationControllerDelegate,
                                  UITableViewDelegate,
                                  UITableViewDataSource,
                                  ___VARIABLE_Prefix:identifier___MineSegmentCellDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<NSArray<___VARIABLE_Prefix:identifier___MineCellDescribeData *> *> *cellDescribeDatas;

@end

@implementation ___VARIABLE_Prefix:identifier___MineController
@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"___VARIABLE_Prefix:identifier___://mine";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark - Life cycle.

- (void)viewDidLoad {
    [super viewDidLoad];

    // 加载 view 和 data，开发者只需要修改两个方法内部的实现
    [self loadSubviews];
    [self loadCellDescribeDatas];

    // 配置导航栏
    [self ___VARIABLE_CategoryPrefix:identifier____applyTransparentNavigationBarDarkStatus];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    _tableView.frame = self.view.bounds;
}


#pragma mark - Load views.

- (void)loadSubviews {
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];

    // register cell class, use UITableView+MCRegisterCellClass
    [_tableView registerCellClasses:@[[___VARIABLE_Prefix:identifier___MineHeaderInfoCell class],
                                      [___VARIABLE_Prefix:identifier___MineOperationCell class],
                                      [___VARIABLE_Prefix:identifier___MineSegmentCell class]]];
}


#pragma mark - Load datas.

- (void)loadCellDescribeDatas {
    // 开发者根据各自应用的个人页面的UI，自定义 describedata，并添加到 _cellDescribeDatas.
    // 该方法中下述代码可能对开发无用，这里只是为了提供一个示例，可删除。
    ___VARIABLE_Prefix:identifier___MineCellDescribeData *headerInfoCellData = [[___VARIABLE_Prefix:identifier___MineCellDescribeData alloc] init];
    headerInfoCellData.cellClass = [___VARIABLE_Prefix:identifier___MineHeaderInfoCell class];
    headerInfoCellData.headerIconName = @"mine_default_header";
    headerInfoCellData.userName = @"我是用户名";
    headerInfoCellData.userDesc = @"我是边边角角的介绍";
    __weak MCTableBaseDescribeData *weakData = headerInfoCellData;
    headerInfoCellData.customCellBlock = ^(MCTableBaseCell *cell, MCTableBaseDescribeData *describeData) {
        [weakData defaultCustomCellBlock](cell, describeData);
        [cell ___VARIABLE_CategoryPrefix:identifier____addHorizontalBottomLineWithLeftMargin:0 rightMargin:0];
    };

    ___VARIABLE_Prefix:identifier___MineCellDescribeData *segmentCellData = [[___VARIABLE_Prefix:identifier___MineCellDescribeData alloc] init];
    segmentCellData.cellClass = [___VARIABLE_Prefix:identifier___MineSegmentCell class];
    segmentCellData.segmentIconNames = @[@"mine_segment_icon", @"mine_segment_icon", @"mine_segment_icon"];
    segmentCellData.delegate = self;
    
    ___VARIABLE_Prefix:identifier___MineCellDescribeData *functionOneCellData = [[___VARIABLE_Prefix:identifier___MineCellDescribeData alloc] init];
    functionOneCellData.cellClass = [___VARIABLE_Prefix:identifier___MineOperationCell class];
    functionOneCellData.iconName = @"mine_function_icon";
    functionOneCellData.title = @"功能一";
    weakData = functionOneCellData;
    functionOneCellData.customCellBlock = ^(MCTableBaseCell *cell, MCTableBaseDescribeData *describeData) {
        [weakData defaultCustomCellBlock](cell, describeData);
        [cell ___VARIABLE_CategoryPrefix:identifier____addHorizontalBottomLineWithLeftMargin:kLineLeftMargin rightMargin:0];
    };
    
    ___VARIABLE_Prefix:identifier___MineCellDescribeData *functionTwoCellData = [[___VARIABLE_Prefix:identifier___MineCellDescribeData alloc] init];
    functionTwoCellData.cellClass = [___VARIABLE_Prefix:identifier___MineOperationCell class];
    functionTwoCellData.iconName = @"mine_function_icon";
    functionTwoCellData.title = @"功能二";
    functionTwoCellData.selectCellBlock = ^(MCTableBaseCell *cell, MCTableBaseDescribeData *describeData) {
        // 开发者在此处添加自己的 cell 选中时的逻辑，通常是 push 一个二级页面，block 内注意循环引用
        // 可以使用 pushNextControllerWithUrl：方法
    };
    
    ___VARIABLE_Prefix:identifier___MineCellDescribeData *functionThreeCellData = [[___VARIABLE_Prefix:identifier___MineCellDescribeData alloc] init];
    functionThreeCellData.cellClass = [___VARIABLE_Prefix:identifier___MineOperationCell class];
    functionThreeCellData.iconName = @"mine_function_icon";
    functionThreeCellData.title = @"功能三";
    weakData = functionThreeCellData;
    functionThreeCellData.customCellBlock = ^(MCTableBaseCell *cell, MCTableBaseDescribeData *describeData) {
        [weakData defaultCustomCellBlock](cell, describeData);
        [cell ___VARIABLE_CategoryPrefix:identifier____addHorizontalBottomLineWithLeftMargin:kLineLeftMargin rightMargin:0];
    };
    
    ___VARIABLE_Prefix:identifier___MineCellDescribeData *functionFourCellData = [[___VARIABLE_Prefix:identifier___MineCellDescribeData alloc] init];
    functionFourCellData.cellClass = [___VARIABLE_Prefix:identifier___MineOperationCell class];
    functionFourCellData.iconName = @"mine_function_icon";
    functionFourCellData.title = @"功能四";
    weakData = functionFourCellData;
    functionFourCellData.customCellBlock = ^(MCTableBaseCell *cell, MCTableBaseDescribeData *describeData) {
        [weakData defaultCustomCellBlock](cell, describeData);
        [cell ___VARIABLE_CategoryPrefix:identifier____addHorizontalBottomLineWithLeftMargin:kLineLeftMargin rightMargin:0];
    };
    
    ___VARIABLE_Prefix:identifier___MineCellDescribeData *functionFiveCellData = [[___VARIABLE_Prefix:identifier___MineCellDescribeData alloc] init];
    functionFiveCellData.cellClass = [___VARIABLE_Prefix:identifier___MineOperationCell class];
    functionFiveCellData.iconName = @"mine_function_icon";
    functionFiveCellData.title = @"功能五";
    functionFiveCellData.selectCellBlock = ^(MCTableBaseCell *cell, MCTableBaseDescribeData *describeData) {
        // 开发者在此处添加自己的 cell 选中时的逻辑，通常是 push 一个二级页面，block 内注意循环引用
        // 可以使用 pushNextControllerWithUrl：方法
    };

    _cellDescribeDatas = @[@[headerInfoCellData, segmentCellData],
                           @[functionOneCellData, functionTwoCellData],
                           @[functionThreeCellData, functionFourCellData, functionFiveCellData]];
}


// UITableViewDataSource 和 UITableViewDelegate 的内容除需要修改 DescribeData 类型外，其余可直接 copy.
#pragma mark - UITableViewDataSource.

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _cellDescribeDatas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cellDescribeDatas[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ___VARIABLE_Prefix:identifier___MineCellDescribeData *data = _cellDescribeDatas[indexPath.section][indexPath.row];
    UITableViewCell *cell = [_tableView dequeueReusableCellWithClassType:data.cellClass];
    data.customCellBlock((MCTableBaseCell *)cell, data);
    return cell;
}


#pragma mark - UITableViewDelegate.

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section != 0) {
        return 15;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *header = [[UIView alloc] init];
    header.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ___VARIABLE_Prefix:identifier___MineCellDescribeData *data = _cellDescribeDatas[indexPath.section][indexPath.row];
    UITableViewCell *cell = [_tableView dequeueReusableCellWithClassType:data.cellClass];
    data.customCellBlock((MCTableBaseCell *)cell, data);
    return [data cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ___VARIABLE_Prefix:identifier___MineCellDescribeData *data = _cellDescribeDatas[indexPath.section][indexPath.row];
    if (data.selectCellBlock) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        data.selectCellBlock((MCTableBaseCell *)cell, data);
    }
}


#pragma mark - ___VARIABLE_Prefix:identifier___MineSegmentCellDelegate.

- (void)firstSegmentClicked:(___VARIABLE_Prefix:identifier___MineSegmentCell *)cell {
    NSLog(@"first segment clicked");
}

- (void)secondSegmentClicked:(___VARIABLE_Prefix:identifier___MineSegmentCell *)cell {
    NSLog(@"second segment clicked");
}

- (void)thirdSegmentClicked:(___VARIABLE_Prefix:identifier___MineSegmentCell *)cell {
    NSLog(@"third segment clicked");
}


#pragma mark - Actions.

/// 进入下一级页面，开发者可直接调用该方法，并传入相应页面的 url 即可
- (void)pushNextControllerWithUrl:(NSString *)controllerUrl {
    HTControllerRouteParam *param = [[HTControllerRouteParam alloc] init];
    param.url = controllerUrl;
    param.launchMode = HTControllerLaunchModePushNavigation;
    param.fromViewController = [APPDELEGATE() rootNavigationController];
    param.delegate = self;

    [[HTControllerRouter sharedRouter] route:param];
}

@end
