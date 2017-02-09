//
//  {{args.Prefix}}MineSettingController.m
//  TestNei
//
//  Created by {{args.Author}} on 21/10/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}MineSettingController.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}MineSettingCellDescribeData.h"
#import "{{args.Prefix}}MineSettingSwitchCell.h"
#import "{{args.Prefix}}MineSettingCommonCell.h"
#import "{{args.Prefix}}MineSettingLogoutCell.h"
#import "UITableView+MCRegisterCellClass.h"
#import "{{args.Prefix}}UserDataManager.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}MineSettingFeedbackController.h"
#import "UIView+{{args.Prefix}}Toast.h"

@interface {{args.Prefix}}MineSettingController () <UITableViewDelegate,
                                        UITableViewDataSource,
                                        UIAlertViewDelegate,
                                        UIActionSheetDelegate,
                                        HTRouteTargetProtocol,
                                        HTContainerViewControllerProtocol,
                                        HTNavigationBackPanGestureProtocol,
                                        {{args.Prefix}}MineSettingLogoutDelegate,
                                        {{args.Prefix}}MineSettingSwitchDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<{{args.Prefix}}MineSettingCellDescribeData *> *> *cellDescribeDatas;

@end

@implementation {{args.Prefix}}MineSettingController
@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.CategoryPrefix}}://mine/setting";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
    self.delegate = param.delegate;
}


#pragma mark - Life cycle.

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadSubviews];
    [self loadCellDescribeDatas];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    self.title = @"设置";
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    _tableView.frame = self.view.bounds;
}


#pragma mark - Load views.

- (void)loadSubviews {
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];

    // register cell class, use UITableView+MCRegisterCellClass
    [_tableView registerCellClasses:@[[{{args.Prefix}}MineSettingSwitchCell class],
                                      [{{args.Prefix}}MineSettingCommonCell class],
                                      [{{args.Prefix}}MineSettingLogoutCell class]]];
}


#pragma mark - Load datas.

- (void)loadCellDescribeDatas {
    @{{args.Prefix}}Weak(self);
    // 修改用户名
    {{args.Prefix}}MineSettingCellDescribeData *userNameCellData = [[{{args.Prefix}}MineSettingCellDescribeData alloc] init];
    userNameCellData.title = @"修改用户名";
    if ([{{args.Prefix}}UserDataManager sharedInstance].alreadyLogin) {
        userNameCellData.rightTitle = [{{args.Prefix}}UserDataManager sharedInstance].userName;
    } else {
        userNameCellData.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    userNameCellData.cellClass = [{{args.Prefix}}MineSettingCommonCell class];
    userNameCellData.selectCellBlock = ^(MCTableBaseCell *cell, MCTableBaseDescribeData *describeData) {
        if ([{{args.Prefix}}UserDataManager sharedInstance].alreadyLogin) {
            UIAlertView *alertView;
            alertView = [[UIAlertView alloc] initWithTitle:@"请输入新昵称"
                                                   message:nil
                                                  delegate:self
                                         cancelButtonTitle:@"取消"
                                         otherButtonTitles:@"确定", nil];
            alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
            [alertView show];
        } else {
            [weakSelf.view {{args.CategoryPrefix}}_showToastWithMessage:@"请先进行登录"];
        }
   };

    // 反馈
    {{args.Prefix}}MineSettingCellDescribeData *feedbackCellData = [[{{args.Prefix}}MineSettingCellDescribeData alloc] init];
    feedbackCellData.cellClass = [{{args.Prefix}}MineSettingCommonCell class];
    feedbackCellData.title = @"意见反馈";
    feedbackCellData.selectCellBlock = ^(MCTableBaseCell *cell, MCTableBaseDescribeData *describeData) {
        {{args.Prefix}}MineSettingFeedbackController *feedback = [[{{args.Prefix}}MineSettingFeedbackController alloc] init];
        [weakSelf.navigationController pushViewController:feedback animated:YES];
    };

    // 保留原始图片
    {{args.Prefix}}MineSettingCellDescribeData *saveOriginCellData = [[{{args.Prefix}}MineSettingCellDescribeData alloc] init];
    saveOriginCellData.cellClass = [{{args.Prefix}}MineSettingSwitchCell class];
    saveOriginCellData.title = @"保存原始图片";
    saveOriginCellData.switchOn = [{{args.Prefix}}UserDataManager sharedInstance].saveOriginalPicture;
    saveOriginCellData.switchDelegate = self;

    // 清除缓存
    {{args.Prefix}}MineSettingCellDescribeData *clearCacheCellData = [[{{args.Prefix}}MineSettingCellDescribeData alloc] init];
    clearCacheCellData.cellClass = [{{args.Prefix}}MineSettingCommonCell class];
    clearCacheCellData.title = @"清除缓存";
    clearCacheCellData.rightTitle = [NSString stringWithFormat:@"%.2fM", [{{args.Prefix}}UserDataManager sharedInstance].cacheSize / 1024];
    clearCacheCellData.selectCellBlock = ^(MCTableBaseCell *cell, MCTableBaseDescribeData *describeData) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                                 delegate:self
                                                        cancelButtonTitle:@"取消"
                                                   destructiveButtonTitle:@"确认清除"
                                                        otherButtonTitles:nil, nil];
        actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
        actionSheet.tag = {{args.Prefix}}MineSettingActionTypeClearCache;
        [actionSheet showInView:self.view];
    };

    // 退出登录
    {{args.Prefix}}MineSettingCellDescribeData *logoutCellData = [[{{args.Prefix}}MineSettingCellDescribeData alloc] init];
    logoutCellData.cellClass = [{{args.Prefix}}MineSettingLogoutCell class];
    logoutCellData.logoutDelegate = self;

    NSMutableArray *firstSection = [[NSMutableArray alloc] initWithObjects:userNameCellData, feedbackCellData, saveOriginCellData, clearCacheCellData, nil];
    if ([{{args.Prefix}}UserDataManager sharedInstance].alreadyLogin) {
        [firstSection addObject:logoutCellData];
    }
    _cellDescribeDatas = [[NSMutableArray alloc] init];
    [_cellDescribeDatas addObject:firstSection];
}


#pragma mark - UITableViewDataSource.

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _cellDescribeDatas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cellDescribeDatas[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    {{args.Prefix}}MineSettingCellDescribeData *data = _cellDescribeDatas[indexPath.section][indexPath.row];
    UITableViewCell *cell = [_tableView dequeueReusableCellWithClassType:data.cellClass];
    data.customCellBlock((MCTableBaseCell *)cell, data);
    return cell;
}


#pragma mark - UITableViewDelegate.

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    {{args.Prefix}}MineSettingCellDescribeData *data = _cellDescribeDatas[indexPath.section][indexPath.row];
    UITableViewCell *cell = [_tableView dequeueReusableCellWithClassType:data.cellClass];
    data.customCellBlock((MCTableBaseCell *)cell, data);
    return [data cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    {{args.Prefix}}MineSettingCellDescribeData *data = _cellDescribeDatas[indexPath.section][indexPath.row];
    if (data.selectCellBlock) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        data.selectCellBlock((MCTableBaseCell *)cell, data);
    }
}


#pragma mark - {{args.Prefix}}MineSettingLogoutDelegate.

- (void)logout:({{args.Prefix}}MineSettingLogoutCell *)cell {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:@"确认退出"
                                                    otherButtonTitles:nil, nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    actionSheet.tag = {{args.Prefix}}MineSettingActionTypeLogout;
    [actionSheet showInView:self.view];
}


#pragma mark - {{args.Prefix}}MineSettingSwitchDelegate.

- (void)switchChanged:(BOOL)switchOn {
    [{{args.Prefix}}UserDataManager sharedInstance].saveOriginalPicture = switchOn;
}


#pragma mark - UIAlertViewDelegate.

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != 0) {
        if ([{{args.Prefix}}UserDataManager sharedInstance].alreadyLogin && [alertView textFieldAtIndex:0].text.length > 0) {
            [{{args.Prefix}}UserDataManager sharedInstance].userName = [alertView textFieldAtIndex:0].text;
            [self refreshInfo];
            [_delegate refreshUser:self];
        }
    }
}


#pragma mark - UIActionSheetDelegate.

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        switch (actionSheet.tag) {
            case {{args.Prefix}}MineSettingActionTypeLogout:
                //TODO: 退出登录的逻辑
                [{{args.Prefix}}UserDataManager sharedInstance].alreadyLogin = NO;
                [self refreshInfo];
                [_delegate refreshUser:self];
                break;
            case {{args.Prefix}}MineSettingActionTypeClearCache:
                [[{{args.Prefix}}UserDataManager sharedInstance] clearCache];
                [self refreshInfo];
                break;
            default:
                break;
        }
    }
}


#pragma mark - Actions.

- (void)refreshInfo {
    [self loadCellDescribeDatas];
    [_tableView reloadData];
}

@end
