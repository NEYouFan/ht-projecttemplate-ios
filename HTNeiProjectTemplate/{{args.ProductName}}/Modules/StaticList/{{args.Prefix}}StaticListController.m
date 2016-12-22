//
//  {{args.Prefix}}StaticListController.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 12/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}StaticListController.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}StaticListDescribeData.h"
#import "{{args.Prefix}}StaticListDemoCell1.h"
#import "{{args.Prefix}}StaticListDemoCell2.h"
#import "UITableView+MCRegisterCellClass.h"


@interface {{args.Prefix}}StaticListController () <UITableViewDataSource,
                                                   UITableViewDelegate,
                                                   {{args.Prefix}}StaticListDemoCell2Delegate,
                                                   {{args.Prefix}}StaticListDemoCell1Delegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) NSInteger badgeCount;
@property (nonatomic, assign) BOOL badgeShowed;
@property (nonatomic, strong) NSArray<NSArray<{{args.Prefix}}StaticListDescribeData *> *> *cellDescriptionDatas;

@end

@implementation {{args.Prefix}}StaticListController

#pragma mark - Life cycle.

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [{{args.Prefix}}ThemeColors themeBackgroundColor];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    
    // 设置导航栏上的文字
    self.title = @"静态列表";
    [self loadSubviews];
    [self loadCellDescribeDatas];
    _badgeCount = 0;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    _tableView.frame = self.view.bounds;
}


#pragma mark - Load views.

- (void)loadSubviews {
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [{{args.Prefix}}ThemeColors themeBackgroundColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    // register cell class, use UITableView+MCRegisterCellClass
    [_tableView registerCellClasses:@[[{{args.Prefix}}StaticListDemoCell1 class],
                                      [{{args.Prefix}}StaticListDemoCell2 class]]];
}


#pragma mark - Load datas.

- (void)loadCellDescribeDatas {
    // 这里命名的 cell1Data 只是表示这个 data 对应于静态列表的第一个cell，与 {{args.Prefix}}StaticListDemoCell1 没有关系，比如：cell1Data 的 cellClass 是 {{args.Prefix}}StaticListDemoCell2
    {{args.Prefix}}StaticListDescribeData *cell1Data = [[{{args.Prefix}}StaticListDescribeData alloc] init];
    cell1Data.cellClass = [{{args.Prefix}}StaticListDemoCell2 class];
    cell1Data.headerIconName = @"staticlist_header";
    cell1Data.content = @"显示/隐藏 tab badge";
    cell1Data.switchStatus = NO;
    cell1Data.cell2Delegate = self;
    
    {{args.Prefix}}StaticListDescribeData *cell2Data = [[{{args.Prefix}}StaticListDescribeData alloc] init];
    cell2Data.cellClass = [{{args.Prefix}}StaticListDemoCell1 class];
    cell2Data.title = @"tab badge";
    cell2Data.content = @"增加 badge 数值";
    cell2Data.actionIncrease = YES;
    cell2Data.actionButtonTitle = @"+ 1";
    cell2Data.cell1Delegate = self;
   
    {{args.Prefix}}StaticListDescribeData *cell3Data = [[{{args.Prefix}}StaticListDescribeData alloc] init];
    cell3Data.cellClass = [{{args.Prefix}}StaticListDemoCell1 class];
    cell3Data.title = @"tab badge";
    cell3Data.content = @"减少 badge 数值";
    cell3Data.actionButtonTitle = @"- 1";
    cell3Data.cell1Delegate = self;
    
    _cellDescriptionDatas = @[@[cell1Data], @[cell2Data, cell3Data]];
}


#pragma mark - UITableViewDataSource.

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _cellDescriptionDatas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cellDescriptionDatas[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    {{args.Prefix}}StaticListDescribeData *data = _cellDescriptionDatas[indexPath.section][indexPath.row];
    UITableViewCell *cell = [_tableView dequeueReusableCellWithClassType:data.cellClass];
    data.customCellBlock((MCTableBaseCell *)cell, data);
    return cell;
}


#pragma mark - UITableViewDelegate.

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    {{args.Prefix}}StaticListDescribeData *data = _cellDescriptionDatas[indexPath.section][indexPath.row];
    UITableViewCell *cell = [_tableView dequeueReusableCellWithClassType:data.cellClass];
    data.customCellBlock((MCTableBaseCell *)cell, data);
    return [data cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    {{args.Prefix}}StaticListDescribeData *data = _cellDescriptionDatas[indexPath.section][indexPath.row];
    if (data.selectCellBlock) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        data.selectCellBlock((MCTableBaseCell *)cell, data);
    }
}


#pragma mark - {{args.Prefix}}StaticListDemoCell2Delegate

- (void)switchStatusChanged:({{args.Prefix}}StaticListDemoCell2 *)cell {
    if (cell.rightSwitchButton.isOn) {
        NSString *text = [NSString stringWithFormat:@"%ld", _badgeCount];
        [APPDELEGATE() showTabBadgeAtIndex:1 text:text];
        _badgeShowed = YES;
    } else {
        [APPDELEGATE() hideTabBadgeAtIndex:1];
        _badgeShowed = NO;
    }
}


#pragma mark - {{args.Prefix}}StaticListDemoCell1Delegate

- (void)increaseBadgeCount:({{args.Prefix}}StaticListDemoCell1 *)cell {
    if (!_badgeShowed) {
        return;
    }
    
    _badgeCount++;
    NSString *text = [NSString stringWithFormat:@"%ld", _badgeCount];
    [APPDELEGATE() showTabBadgeAtIndex:1 text:text];
}

- (void)decreaseBadgeCount:({{args.Prefix}}StaticListDemoCell1 *)cell {
    if (!_badgeShowed) {
        return;
    }
    
    _badgeCount--;
    NSString *text = [NSString stringWithFormat:@"%ld", _badgeCount];
    [APPDELEGATE() showTabBadgeAtIndex:1 text:text];
}

@end
