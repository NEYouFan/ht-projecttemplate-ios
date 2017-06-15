//
//  {{args.Prefix}}ListLayoutController.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 17/05/2017.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}ListLayoutController.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}ListLayoutCellDescribeData.h"
#import "UITableView+MCRegisterCellClass.h"
#import "HTControllerRouter.h"
#import "AppDelegate.h"
#import "{{args.Prefix}}UserDataManager.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "UIView+{{args.Prefix}}Line.h"
#import "{{args.Prefix}}ListLayoutCommonCell.h"
#import "{{args.Prefix}}ListLayoutHeaderCell.h"

@interface {{args.Prefix}}ListLayoutController () <HTRouteTargetProtocol,
                                        HTContainerViewControllerProtocol,
                                        HTNavigationBackPanGestureProtocol,
                                        UINavigationControllerDelegate,
                                        UITableViewDelegate,
                                        UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<NSArray<{{args.Prefix}}ListLayoutCellDescribeData *> *> *cellDescribeDatas;

@end

@implementation {{args.Prefix}}ListLayoutController
@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://listLayout";
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
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    [self {{args.CategoryPrefix}}_addNavigationRightItemWithTitle:@"编辑"];
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
    [_tableView registerCellClasses:@[[{{args.Prefix}}ListLayoutHeaderCell class],
                                      [{{args.Prefix}}ListLayoutCommonCell class]]];
}


#pragma mark - Load datas.

- (void)loadCellDescribeDatas {
    __weak MCTableBaseDescribeData *weakData;
    // 开发者根据各自应用的个人页面的UI，自定义 describedata，并添加到 _cellDescribeDatas.
    // 该方法中下述代码可能对开发无用，这里只是为了提供一个示例，可删除。
    {{args.Prefix}}ListLayoutCellDescribeData *onlyTextCellData = [[{{args.Prefix}}ListLayoutCellDescribeData alloc] init];
    onlyTextCellData.cellClass = [{{args.Prefix}}ListLayoutHeaderCell class];
    onlyTextCellData.title = @"纯文字";

    {{args.Prefix}}ListLayoutCellDescribeData *onlyText1CellData = [[{{args.Prefix}}ListLayoutCellDescribeData alloc] init];
    onlyText1CellData.cellClass = [{{args.Prefix}}ListLayoutCommonCell class];
    onlyText1CellData.title = @"标题";
    onlyText1CellData.rightIconName = @"listlayout_right_icon";
    weakData = onlyText1CellData;
    onlyText1CellData.customCellBlock = ^(MCTableBaseCell *cell, MCTableBaseDescribeData *describeData) {
        [weakData defaultCustomCellBlock](cell, describeData);
        [cell {{args.CategoryPrefix}}_addHorizontalBottomLineWithLeftMargin:0 rightMargin:0];
    };
    
    {{args.Prefix}}ListLayoutCellDescribeData *onlyText2CellData = [[{{args.Prefix}}ListLayoutCellDescribeData alloc] init];
    onlyText2CellData.cellClass = [{{args.Prefix}}ListLayoutCommonCell class];
    onlyText2CellData.title = @"标题";
    onlyText2CellData.subTitle = @"副标题";
    onlyText2CellData.rightIconName = @"listlayout_right_icon";
   
    {{args.Prefix}}ListLayoutCellDescribeData *picTextCellData = [[{{args.Prefix}}ListLayoutCellDescribeData alloc] init];
    picTextCellData.cellClass = [{{args.Prefix}}ListLayoutHeaderCell class];
    picTextCellData.title = @"图标+文字";
    
    {{args.Prefix}}ListLayoutCellDescribeData *picText1CellData = [[{{args.Prefix}}ListLayoutCellDescribeData alloc] init];
    picText1CellData.cellClass = [{{args.Prefix}}ListLayoutCommonCell class];
    picText1CellData.title = @"标题";
    picText1CellData.leftIconName = @"listlayout_left_square_icon";
    picText1CellData.rightIconName = @"listlayout_right_icon";
    weakData = picText1CellData;
    picText1CellData.customCellBlock = ^(MCTableBaseCell *cell, MCTableBaseDescribeData *describeData) {
        [weakData defaultCustomCellBlock](cell, describeData);
        [cell {{args.CategoryPrefix}}_addHorizontalBottomLineWithLeftMargin:0 rightMargin:0];
    };
    
    {{args.Prefix}}ListLayoutCellDescribeData *picText2CellData = [[{{args.Prefix}}ListLayoutCellDescribeData alloc] init];
    picText2CellData.cellClass = [{{args.Prefix}}ListLayoutCommonCell class];
    picText2CellData.title = @"标题";
    picText1CellData.subTitle = @"副标题";
    picText2CellData.leftIconName = @"listlayout_left_square_icon";
    picText2CellData.rightIconName = @"listlayout_right_icon";
    
    {{args.Prefix}}ListLayoutCellDescribeData *imageTextCellData = [[{{args.Prefix}}ListLayoutCellDescribeData alloc] init];
    imageTextCellData.cellClass = [{{args.Prefix}}ListLayoutHeaderCell class];
    imageTextCellData.title = @"图像+文字";
    
    {{args.Prefix}}ListLayoutCellDescribeData *imageText1CellData = [[{{args.Prefix}}ListLayoutCellDescribeData alloc] init];
    imageText1CellData.cellClass = [{{args.Prefix}}ListLayoutCommonCell class];
    imageText1CellData.title = @"标题";
    imageText1CellData.leftIconName = @"listlayout_left_circle_icon";
    imageText1CellData.rightIconName = @"listlayout_right_icon";
    weakData = imageText1CellData;
    imageText1CellData.customCellBlock = ^(MCTableBaseCell *cell, MCTableBaseDescribeData *describeData) {
        [weakData defaultCustomCellBlock](cell, describeData);
        [cell {{args.CategoryPrefix}}_addHorizontalBottomLineWithLeftMargin:0 rightMargin:0];
    };
    
    {{args.Prefix}}ListLayoutCellDescribeData *imageText2CellData = [[{{args.Prefix}}ListLayoutCellDescribeData alloc] init];
    imageText2CellData.cellClass = [{{args.Prefix}}ListLayoutCommonCell class];
    imageText2CellData.title = @"标题";
    imageText1CellData.subTitle = @"副标题";
    imageText2CellData.leftIconName = @"listlayout_left_circle_icon";
    imageText2CellData.rightIconName = @"listlayout_right_icon";

    _cellDescribeDatas = @[@[onlyTextCellData, onlyText1CellData, onlyText2CellData,
                           picTextCellData, picText1CellData, picText2CellData,
                           imageTextCellData, imageText1CellData, imageText2CellData]];
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
    {{args.Prefix}}ListLayoutCellDescribeData *data = _cellDescribeDatas[indexPath.section][indexPath.row];
    UITableViewCell *cell = [_tableView dequeueReusableCellWithClassType:data.cellClass];
    data.customCellBlock((MCTableBaseCell *)cell, data);
    return cell;
}


#pragma mark - UITableViewDelegate.

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    {{args.Prefix}}ListLayoutCellDescribeData *data = _cellDescribeDatas[indexPath.section][indexPath.row];
    UITableViewCell *cell = [_tableView dequeueReusableCellWithClassType:data.cellClass];
    data.customCellBlock((MCTableBaseCell *)cell, data);
    return [data cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    {{args.Prefix}}ListLayoutCellDescribeData *data = _cellDescribeDatas[indexPath.section][indexPath.row];
    if (data.selectCellBlock) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        data.selectCellBlock((MCTableBaseCell *)cell, data);
    }
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
