//
//  {{args.Prefix}}LeftPanButtonViewController.m
//
//  Created by {{args.Author}} on 2017/5/3.
//    Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}LeftPanButtonViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}LeftPanButtonCell.h"
#import "UIView+{{args.Prefix}}Line.h"

@interface {{args.Prefix}}LeftPanButtonViewController () <HTRouteTargetProtocol,
                                                HTContainerViewControllerProtocol,
                                                HTNavigationBackPanGestureProtocol,
                                                UITableViewDelegate,
                                                UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation {{args.Prefix}}LeftPanButtonViewController

@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://leftPanButton";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark --- Life Cycle ---

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"左滑出现的按钮";
    [self loadSubviews];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    // Do any additional setup after loading the view.
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    // 若要修改tableview／refreshview／loadmoreview的frame，在这里修改
    _tableView.frame = self.view.bounds;
}

#pragma mark --- loadSubViews ---

- (void)loadSubviews{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[{{args.Prefix}}LeftPanButtonCell class] forCellReuseIdentifier:@"cellIdentifier"];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIdentifierline"];
}


#pragma mark --- UITableViewDelegate && DataSource ---

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 40;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (indexPath.row % 2 == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifierline" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        [cell {{args.CategoryPrefix}}_addHorizontalMiddleLineWithLeftMargin:kLeftMargin rightMargin:0];
    }
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat cellHeight;
    if (indexPath.row % 2 == 0) {
        cellHeight = 68;
    } else {
        cellHeight = LINE_WIDTH;
    }

    return cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 2 == 0) {
        UITableViewRowAction *topAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"置顶" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
            // 实现相关的逻辑代码
            // ...
            // 在最后希望cell可以自动回到默认状态，所以需要退出编辑模式
            tableView.editing = NO;
        }];
        topAction.backgroundColor = [UIColor colorWithRGBValue:0x979797];
        
        UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
            // 实现相关的逻辑代码
            // ...
            // 在最后希望cell可以自动回到默认状态，所以需要退出编辑模式
            tableView.editing = NO;
        }];
        deleteAction.backgroundColor = [UIColor colorWithRGBValue:0x777777];
        
        UITableViewRowAction *moreAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"更多" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
            // 实现相关的逻辑代码
            // ...
            // 在最后希望cell可以自动回到默认状态，所以需要退出编辑模式
            tableView.editing = NO;
        }];
        moreAction.backgroundColor = [UIColor colorWithRGBValue:0xb7b7b7];
        
        return @[deleteAction, topAction, moreAction];
    } else {
        return @[];
    }
}

@end

