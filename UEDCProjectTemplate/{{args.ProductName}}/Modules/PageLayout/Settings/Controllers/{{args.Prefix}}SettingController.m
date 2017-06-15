//
//  {{args.Prefix}}SettingController.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 25/05/2017.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}SettingController.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}SettingCellDescribeData.h"
#import "{{args.Prefix}}SettingSwitchCell.h"
#import "{{args.Prefix}}SettingCommonCell.h"
#import "UITableView+MCRegisterCellClass.h"
#import "{{args.Prefix}}UserDataManager.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "UIView+{{args.Prefix}}Toast.h"
#import "UIView+{{args.Prefix}}Line.h"

@interface {{args.Prefix}}SettingController () <UITableViewDelegate,
                                     UITableViewDataSource,
                                     UIAlertViewDelegate,
                                     UIActionSheetDelegate,
                                     HTRouteTargetProtocol,
                                     HTContainerViewControllerProtocol,
                                     HTNavigationBackPanGestureProtocol,
                                     {{args.Prefix}}SettingSwitchDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<NSArray<{{args.Prefix}}SettingCellDescribeData *> *> *cellDescribeDatas;

@end

@implementation {{args.Prefix}}SettingController
@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://setting";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
    
}


#pragma mark - Life cycle.

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadSubviews];
    [self loadCellDescribeDatas];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    [self {{args.CategoryPrefix}}_addNavigationRightItemWithTitle:@"编辑"];
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
    [_tableView registerCellClasses:@[[{{args.Prefix}}SettingSwitchCell class],
                                      [{{args.Prefix}}SettingCommonCell class]]];
}


#pragma mark - Load datas.

- (void)loadCellDescribeDatas {
    __weak MCTableBaseDescribeData *weakData;
    // 标题1
    {{args.Prefix}}SettingCellDescribeData *titleOneCellData = [[{{args.Prefix}}SettingCellDescribeData alloc] init];
    titleOneCellData.iconName = @"setting_default_icon";
    titleOneCellData.title = @"标题1";
    titleOneCellData.cellClass = [{{args.Prefix}}SettingCommonCell class];
    weakData = titleOneCellData;
    titleOneCellData.customCellBlock = ^(MCTableBaseCell *cell, MCTableBaseDescribeData *describeData) {
        [weakData defaultCustomCellBlock](cell, describeData);
        [cell {{args.CategoryPrefix}}_addHorizontalBottomLineWithLeftMargin:0 rightMargin:0];
    };

    {{args.Prefix}}SettingCellDescribeData *titleTwoCellData = [[{{args.Prefix}}SettingCellDescribeData alloc] init];
    titleTwoCellData.iconName = @"setting_default_icon";
    titleTwoCellData.title = @"标题2";
    titleTwoCellData.cellClass = [{{args.Prefix}}SettingCommonCell class];
    weakData = titleTwoCellData;
    
    {{args.Prefix}}SettingCellDescribeData *titleThreeCellData = [[{{args.Prefix}}SettingCellDescribeData alloc] init];
    titleThreeCellData.iconName = @"setting_default_icon";
    titleThreeCellData.title = @"标题3";
    titleThreeCellData.switchOn = YES;
    titleThreeCellData.cellClass = [{{args.Prefix}}SettingSwitchCell class];
    titleThreeCellData.switchDelegate = self;
    weakData = titleThreeCellData;
    titleThreeCellData.customCellBlock = ^(MCTableBaseCell *cell, MCTableBaseDescribeData *describeData) {
        [weakData defaultCustomCellBlock](cell, describeData);
        [cell {{args.CategoryPrefix}}_addHorizontalBottomLineWithLeftMargin:0 rightMargin:0];
    };
    
    {{args.Prefix}}SettingCellDescribeData *titleFourCellData = [[{{args.Prefix}}SettingCellDescribeData alloc] init];
    titleFourCellData.title = @"标题4";
    titleFourCellData.iconName = @"setting_default_icon";
    titleFourCellData.rightTitle = @"选择";
    titleFourCellData.cellClass = [{{args.Prefix}}SettingCommonCell class];
    weakData = titleFourCellData;

    {{args.Prefix}}SettingCellDescribeData *subTitleCellData = [[{{args.Prefix}}SettingCellDescribeData alloc] init];
    subTitleCellData.cellClass = [{{args.Prefix}}SettingCommonCell class];
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
    {{args.Prefix}}SettingCellDescribeData *data = _cellDescribeDatas[indexPath.section][indexPath.row];
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
    {{args.Prefix}}SettingCellDescribeData *data = _cellDescribeDatas[indexPath.section][indexPath.row];
    UITableViewCell *cell = [_tableView dequeueReusableCellWithClassType:data.cellClass];
    data.customCellBlock((MCTableBaseCell *)cell, data);
    return [data cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    {{args.Prefix}}SettingCellDescribeData *data = _cellDescribeDatas[indexPath.section][indexPath.row];
    if (data.selectCellBlock) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        data.selectCellBlock((MCTableBaseCell *)cell, data);
    }
}


#pragma mark - {{args.Prefix}}MineSettingSwitchDelegate.

- (void)switchChanged:(BOOL)switchOn {
    NSLog(@"Switch changed to: %@", @(switchOn));
}

@end
