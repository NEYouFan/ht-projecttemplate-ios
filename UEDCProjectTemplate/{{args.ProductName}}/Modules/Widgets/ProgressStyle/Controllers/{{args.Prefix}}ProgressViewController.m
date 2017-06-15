//
//  {{args.Prefix}}ProgressViewController.m
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/4/28.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}ProgressViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"
#import "UITableView+MCRegisterCellClass.h"
#import "UIView+{{args.Prefix}}Line.h"
#import "{{args.Prefix}}ProgressView.h"

@interface {{args.Prefix}}ProgressViewController ()<HTRouteTargetProtocol,HTContainerViewControllerProtocol,HTNavigationBackPanGestureProtocol>


@end

@implementation {{args.Prefix}}ProgressViewController
@synthesize containerController;
#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://progress";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark - Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"上传下载进度条";
    [self loadSubviews];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    
}


#pragma mark - Init View

- (void)loadSubviews{
    
    self.view.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
    
    UILabel *label1 = [self creatHintLabelWithText:@"0px圆角进度条"];
    label1.y = 35;
    [self.view addSubview:label1];
    
    UIView * continer1 = [self creatContiner];
    continer1.y = label1.bottom + 18;
    [self.view addSubview:continer1];

    {{args.Prefix}}ProgressView * progress1 =  [self creatProgressView];
    progress1.progress = 0.6;
    progress1.cornerRadius = 0;
    [continer1 addSubview:progress1];
    
    
    UILabel *label2 = [self creatHintLabelWithText:@"2px圆角进度条"];
    label2.y = continer1.bottom + 30;
    [self.view addSubview:label2];
    
    UIView * continer2 = [self creatContiner];
    continer2.y = label2.bottom + 18;
    [self.view addSubview:continer2];
    
    {{args.Prefix}}ProgressView * progress2 =  [self creatProgressView];
    progress2.progress = 0.5;
    progress2.cornerRadius = 1.5;
    [continer2 addSubview:progress2];
    
    
    UILabel *label3 = [self creatHintLabelWithText:@"全圆角进度条"];
    label3.y = continer2.bottom + 30;
    [self.view addSubview:label3];
    
    UIView * continer3 = [self creatContiner];
    continer3.y = label3.bottom + 18;
    [self.view addSubview:continer3];
    
    {{args.Prefix}}ProgressView * progress3 =  [self creatProgressView];
    progress3.progress = 0.3;
    progress3.cornerRadius = 2.5;
    [continer3 addSubview:progress3];
    
    
}

#pragma mark - private method

- (UILabel *)creatHintLabelWithText:(NSString *)text{
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.x = 22;
    label.font = [UIFont systemFontOfSize:14.0];
    label.textColor = [UIColor colorWithRGBValue:kLightTextColor];
    label.textAlignment = NSTextAlignmentCenter;
    [label sizeToFit];
    return label;
}

-(UIView *)creatContiner{
    UIView * view = [UIView new];
    [view {{args.CategoryPrefix}}_addHorizontalTopLineWithLeftMargin:0 rightMargin:0];
    [view {{args.CategoryPrefix}}_addHorizontalBottomLineWithLeftMargin:0 rightMargin:0];
    view.backgroundColor = [UIColor whiteColor];
    
    view.x = 0;
    view.width = SCREEN_WIDTH;
    view.height = 45;
    
    return view;
}

-({{args.Prefix}}ProgressView *)creatProgressView{
    
    {{args.Prefix}}ProgressView * progress =  [[{{args.Prefix}}ProgressView alloc]init];
    progress.width = SCREEN_WIDTH -60;
    progress.height = 5;
    progress.x = 22;
    progress.y = 20.5;

    return progress;
}

@end
