//
//  ___VARIABLE_Prefix:identifier___SettingController.m
//  ___VARIABLE_Prefix:identifier___
//
//  Created by Baitianyu on 25/05/2017.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "___VARIABLE_Prefix:identifier___SettingController.h"
#import "___VARIABLE_Prefix:identifier___BaseViewController+___VARIABLE_Prefix:identifier___CustomNavigationBar.h"
#import "___VARIABLE_Prefix:identifier___SettingCellDescribeData.h"
#import "___VARIABLE_Prefix:identifier___SettingSwitchCell.h"
#import "___VARIABLE_Prefix:identifier___SettingCommonCell.h"
#import "UITableView+MCRegisterCellClass.h"
#import "___VARIABLE_Prefix:identifier___UserDataManager.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "UIView+___VARIABLE_Prefix:identifier___Toast.h"
#import "UIView+___VARIABLE_Prefix:identifier___Line.h"

@interface ___VARIABLE_Prefix:identifier___SettingController () <UITableViewDelegate,
                                     UITableViewDataSource,
                                     UIAlertViewDelegate,
                                     UIActionSheetDelegate,
                                     HTRouteTargetProtocol,
                                     HTContainerViewControllerProtocol,
                                     HTNavigationBackPanGestureProtocol,
                                     ___VARIABLE_Prefix:identifier___SettingSwitchDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<NSArray<___VARIABLE_Prefix:identifier___SettingCellDescribeData *> *> *cellDescribeDatas;

@end

@implementation ___VARIABLE_Prefix:identifier___SettingController
@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"___VARIABLE_Prefix:identifier___://setting";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
    
}


#pragma mark - Life cycle.

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadSubviews];
    [self loadCellDescribeDatas];
    [self ___VARIABLE_CategoryPrefix:identifier____applyDefaultNavigationBarStyle];
    [self ___VARIABLE_CategoryPrefix:identifier____addNavigationLeftBackItem];
    [self ___VARIABLE_CategoryPrefix:identifier____addNavigationRightItemWithTitle:@"编辑"];
    self.title = @"设置页面布局";
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
    [_tableView registerCellClasses:@[[___VARIABLE_Prefix:identifier___SettingSwitchCell class],
                                      [___VARIABLE_Prefix:identifier___SettingCommonCell class]]];
}


#pragma mark - Load datas.

- (void)loadCellDescribeDatas {
    __weak MCTableBaseDescribeData *weakData;
    // 标题1
    ___VARIABLE_Prefix:identifier___SettingCellDescribeData *titleOneCellData = [[___VARIABLE_Prefix:identifier___SettingCellDescribeData alloc] init];
    titleOneCellData.iconName = @"setting_default_icon";
    titleOneCellData.title = @"标题1";
    titleOneCellData.cellClass = [___VARIABLE_Prefix:identifier___SettingCommonCell class];
    weakData = titleOneCellData;
    titleOneCellData.customCellBlock = ^(MCTableBaseCell *cell, MCTableBaseDescribeData *describeData) {
        [weakData defaultCustomCellBlock](cell, describeData);
        [cell ___VARIABLE_CategoryPrefix:identifier____addHorizontalBottomLineWithLeftMargin:0 rightMargin:0];
    };

    ___VARIABLE_Prefix:identifier___SettingCellDescribeData *titleTwoCellData = [[___VARIABLE_Prefix:identifier___SettingCellDescribeData alloc] init];
    titleTwoCellData.iconName = @"setting_default_icon";
    titleTwoCellData.title = @"标题2";
    titleTwoCellData.cellClass = [___VARIABLE_Prefix:identifier___SettingCommonCell class];
    weakData = titleTwoCellData;
    
    ___VARIABLE_Prefix:identifier___SettingCellDescribeData *titleThreeCellData = [[___VARIABLE_Prefix:identifier___SettingCellDescribeData alloc] init];
    titleThreeCellData.iconName = @"setting_default_icon";
    titleThreeCellData.title = @"标题3";
    titleThreeCellData.switchOn = YES;
    titleThreeCellData.cellClass = [___VARIABLE_Prefix:identifier___SettingSwitchCell class];
    titleThreeCellData.switchDelegate = self;
    weakData = titleThreeCellData;
    titleThreeCellData.customCellBlock = ^(MCTableBaseCell *cell, MCTableBaseDescribeData *describeData) {
        [weakData defaultCustomCellBlock](cell, describeData);
        [cell ___VARIABLE_CategoryPrefix:identifier____addHorizontalBottomLineWithLeftMargin:0 rightMargin:0];
    };
    
    ___VARIABLE_Prefix:identifier___SettingCellDescribeData *titleFourCellData = [[___VARIABLE_Prefix:identifier___SettingCellDescribeData alloc] init];
    titleFourCellData.title = @"标题4";
    titleFourCellData.iconName = @"setting_default_icon";
    titleFourCellData.rightTitle = @"选择";
    titleFourCellData.cellClass = [___VARIABLE_Prefix:identifier___SettingCommonCell class];
    weakData = titleFourCellData;

    ___VARIABLE_Prefix:identifier___SettingCellDescribeData *subTitleCellData = [[___VARIABLE_Prefix:identifier___SettingCellDescribeData alloc] init];
    subTitleCellData.cellClass = [___VARIABLE_Prefix:identifier___SettingCommonCell class];
    subTitleCellData.title = @"主标题";
    subTitleCellData.subTitle = @"副标题";
    subTitleCellData.iconName = @"setting_default_icon";
    
    _cellDescribeDatas = @[@[titleOneCellData, titleTwoCellData],
                           @[titleThreeCellData, titleFourCellData],
                           @[subTitleCellData]];
}


#pragma mark - UITableViewDataSource.

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _cellDescribeDatas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cellDescribeDatas[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ___VARIABLE_Prefix:identifier___SettingCellDescribeData *data = _cellDescribeDatas[indexPath.section][indexPath.row];
    UITableViewCell *cell = [_tableView dequeueReusableCellWithClassType:data.cellClass];
    data.customCellBlock((MCTableBaseCell *)cell, data);
    return cell;
}


#pragma mark - UITableViewDelegate.

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
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
    ___VARIABLE_Prefix:identifier___SettingCellDescribeData *data = _cellDescribeDatas[indexPath.section][indexPath.row];
    UITableViewCell *cell = [_tableView dequeueReusableCellWithClassType:data.cellClass];
    data.customCellBlock((MCTableBaseCell *)cell, data);
    return [data cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ___VARIABLE_Prefix:identifier___SettingCellDescribeData *data = _cellDescribeDatas[indexPath.section][indexPath.row];
    if (data.selectCellBlock) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        data.selectCellBlock((MCTableBaseCell *)cell, data);
    }
}


#pragma mark - ___VARIABLE_Prefix:identifier___MineSettingSwitchDelegate.

- (void)switchChanged:(BOOL)switchOn {
    NSLog(@"Switch changed to: %@", @(switchOn));
}

@end
