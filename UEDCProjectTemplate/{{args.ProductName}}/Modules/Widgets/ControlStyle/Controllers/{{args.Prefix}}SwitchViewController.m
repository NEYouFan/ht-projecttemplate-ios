//
//  {{args.Prefix}}SwitchViewController.m
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/4/27.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}SwitchViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"
#import "UITableView+MCRegisterCellClass.h"
#import "{{args.Prefix}}SwithCell.h"
#import "{{args.Prefix}}SwitchCellModel.h"
#import "UIView+{{args.Prefix}}Line.h"


@interface {{args.Prefix}}SwitchViewController ()<HTRouteTargetProtocol,HTContainerViewControllerProtocol,HTNavigationBackPanGestureProtocol,UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property(nonatomic, copy) NSArray<NSArray<{{args.Prefix}}SwitchCellModel *> *> * models;

@end

@implementation {{args.Prefix}}SwitchViewController
@synthesize containerController;

#pragma mark - Router
+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://switch";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"开关、滑块控件";
    [self loadSubviews];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    
    
}


#pragma mark - Init View

- (void)loadSubviews{

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[{{args.Prefix}}SwithCell class] forCellReuseIdentifier:@"cellIdentifier"];
    
}



#pragma mark - UITableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.models.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.models[section].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    {{args.Prefix}}SwithCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    cell.model = self.models[indexPath.section][indexPath.row];
    NSInteger  rowIndex = indexPath.row;
    
    
    if (rowIndex == 0) {
        [cell {{args.CategoryPrefix}}_addHorizontalTopLineWithLeftMargin:0 rightMargin:0];
    }
    if(rowIndex == self.models[indexPath.section].count -1){
        [cell {{args.CategoryPrefix}}_addHorizontalBottomLineWithLeftMargin:0 rightMargin:0];
    }else{
        [cell {{args.CategoryPrefix}}_addHorizontalBottomLineWithLeftMargin:20 rightMargin:20];
    }
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @[@"开关控件",@"滑块控件"][section];
}

#pragma mark - UITableViewDelegate


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat cellHeight = 44;
    return cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat headerHeight = 60;
    return headerHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    CGFloat footerHeight = 1;
    return footerHeight;
}


#pragma mark - getter

-(NSArray<NSArray<{{args.Prefix}}SwitchCellModel *> *> *)models{
    if (!_models) {
        _models = [{{args.Prefix}}SwitchCellModel switchCellModels];
    }
    return _models;
}
@end
