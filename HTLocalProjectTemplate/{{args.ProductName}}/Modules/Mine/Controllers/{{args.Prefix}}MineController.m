//
//  {{args.Prefix}}MineController.m
//  TestNei
//
//  Created by {{args.Author}} on 18/10/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}MineController.h"
#import "{{args.Prefix}}MineCellDescribeData.h"
#import "{{args.Prefix}}MineOperationCell.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}MineHeaderInfoCell.h"
#import "UITableView+MCRegisterCellClass.h"
#import "HTControllerRouter.h"
#import "AppDelegate.h"
#import "{{args.Prefix}}UserDataManager.h"
#import "{{args.Prefix}}MineSettingController.h"
#import "{{args.Prefix}}LoginController.h"

@interface {{args.Prefix}}MineController () <UITableViewDelegate,
                                UITableViewDataSource,
                                {{args.Prefix}}MineHeaderInfoCellDelegate,
                                {{args.Prefix}}MineSettingControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<NSArray<{{args.Prefix}}MineCellDescribeData *> *> *cellDescribeDatas;
@property (nonatomic, strong) UIButton *settingButton;

@end

@implementation {{args.Prefix}}MineController

#pragma mark - Life cycle.

- (void)viewDidLoad {
    [super viewDidLoad];

    // 加载 view 和 data，开发者只需要修改两个方法内部的实现
    [self loadSubviews];
    [self loadCellDescribeDatas];

    // 配置导航栏
    [self {{args.CategoryPrefix}}_applyTransparentNavigationBarWhiteStatus];

    // 配置个人页面右上角的设置按钮
    _settingButton = [self {{args.CategoryPrefix}}_addNavigationRightSettingItem];
    [_settingButton addTarget:self action:@selector(setting:) forControlEvents:UIControlEventTouchUpInside];
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
    [_tableView registerCellClasses:@[[{{args.Prefix}}MineHeaderInfoCell class],
                                      [{{args.Prefix}}MineOperationCell class]]];
}


#pragma mark - Load datas.

- (void)loadCellDescribeDatas {
    // 开发者根据各自应用的个人页面的UI，自定义 describedata，并添加到 _cellDescribeDatas.
    // 该方法中下述代码可能对开发无用，这里只是为了提供一个示例，可删除。
    {{args.Prefix}}MineCellDescribeData *headerInfoCellData = [[{{args.Prefix}}MineCellDescribeData alloc] init];
    headerInfoCellData.cellClass = [{{args.Prefix}}MineHeaderInfoCell class];
    headerInfoCellData.delegate = self;
    headerInfoCellData.iconName = @"mine_default_header";

    {{args.Prefix}}MineCellDescribeData *myPublishCellData = [[{{args.Prefix}}MineCellDescribeData alloc] init];
    myPublishCellData.cellClass = [{{args.Prefix}}MineOperationCell class];
    myPublishCellData.iconName = @"mine_publish";
    myPublishCellData.title = @"我的发布:";
    myPublishCellData.selectCellBlock = ^(MCTableBaseCell *cell, MCTableBaseDescribeData *describeData) {
        // 开发者在此处添加自己的 cell 选中时的逻辑，通常是 push 一个二级页面，block 内注意循环引用
        // 可以使用 pushNextControllerWithUrl：方法
    };

    {{args.Prefix}}MineCellDescribeData *myCollectionCellData = [[{{args.Prefix}}MineCellDescribeData alloc] init];
    myCollectionCellData.cellClass = [{{args.Prefix}}MineOperationCell class];
    myCollectionCellData.iconName = @"mine_collection";
    myCollectionCellData.title = @"我的收藏:";
    myCollectionCellData.selectCellBlock = ^(MCTableBaseCell *cell, MCTableBaseDescribeData *describeData) {
        // 开发者在此处添加自己的 cell 选中时的逻辑，通常是 push 一个二级页面，block 内注意循环引用
        // 可以使用 pushNextControllerWithUrl：方法
    };

    {{args.Prefix}}MineCellDescribeData *myPreferenceCellData = [[{{args.Prefix}}MineCellDescribeData alloc] init];
    myPreferenceCellData.cellClass = [{{args.Prefix}}MineOperationCell class];
    myPreferenceCellData.iconName = @"mine_preference";
    myPreferenceCellData.title = @"我的偏好:";
    myPreferenceCellData.selectCellBlock = ^(MCTableBaseCell *cell, MCTableBaseDescribeData *describeData) {
        // 开发者在此处添加自己的 cell 选中时的逻辑，通常是 push 一个二级页面，block 内注意循环引用
        // 可以使用 pushNextControllerWithUrl：方法
    };

    {{args.Prefix}}MineCellDescribeData *inviteFriendsCellData = [[{{args.Prefix}}MineCellDescribeData alloc] init];
    inviteFriendsCellData.cellClass = [{{args.Prefix}}MineOperationCell class];
    inviteFriendsCellData.iconName = @"mine_invite";
    inviteFriendsCellData.title = @"邀请好友:";
    inviteFriendsCellData.selectCellBlock = ^(MCTableBaseCell *cell, MCTableBaseDescribeData *describeData) {
        // 开发者在此处添加自己的 cell 选中时的逻辑，通常是 push 一个二级页面，block 内注意循环引用
        // 可以使用 pushNextControllerWithUrl：方法
    };

    _cellDescribeDatas = @[@[headerInfoCellData,
                             myPublishCellData,
                             myCollectionCellData,
                             myPreferenceCellData,
                             inviteFriendsCellData]];
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
    {{args.Prefix}}MineCellDescribeData *data = _cellDescribeDatas[indexPath.section][indexPath.row];
    UITableViewCell *cell = [_tableView dequeueReusableCellWithClassType:data.cellClass];
    data.customCellBlock((MCTableBaseCell *)cell, data);
    return cell;
}


#pragma mark - UITableViewDelegate.

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    {{args.Prefix}}MineCellDescribeData *data = _cellDescribeDatas[indexPath.section][indexPath.row];
    UITableViewCell *cell = [_tableView dequeueReusableCellWithClassType:data.cellClass];
    data.customCellBlock((MCTableBaseCell *)cell, data);
    return [data cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    {{args.Prefix}}MineCellDescribeData *data = _cellDescribeDatas[indexPath.section][indexPath.row];
    if (data.selectCellBlock) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        data.selectCellBlock((MCTableBaseCell *)cell, data);
    }
}


#pragma mark - {{args.Prefix}}MineHeaderInfoCellDelegate.

// 点击了登录/注册按钮后，弹出登录页面
- (void)loginOrRegister:({{args.Prefix}}MineHeaderInfoCell *)cell {
    [{{args.Prefix}}LoginController showLoginControllerWithToastMessage:@"" successBlock:^{
        [{{args.Prefix}}UserDataManager sharedInstance].alreadyLogin = YES;
        [self reloadInfo];
    } cancelBlock:^{

    }];
}


#pragma mark - {{args.Prefix}}MineSettingControllerDelegate.

/// 登录成功后刷新个人页面（用户名、头像可能更改）
- (void)refreshUser:({{args.Prefix}}MineSettingController *)settingController {
    [self reloadInfo];
}


#pragma mark - Actions.

/// 点击退出登录后刷新个人页面
- (void)reloadInfo {
    [self loadCellDescribeDatas];
    [_tableView reloadData];
}

/// 进入下一级页面，开发者可直接调用该方法，并传入相应页面的 url 即可
- (void)pushNextControllerWithUrl:(NSString *)controllerUrl {
    HTControllerRouteParam *param = [[HTControllerRouteParam alloc] init];
    param.url = controllerUrl;
    param.launchMode = HTControllerLaunchModePushNavigation;
    param.fromViewController = [APPDELEGATE() rootNavigationController];
    param.delegate = self;

    [[HTControllerRouter sharedRouter] route:param];
}

- (void)setting:(id)sender {
    [self pushNextControllerWithUrl:@"{{args.ProductName}}://mine/setting"];
}

@end
