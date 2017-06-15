//
//  {{args.Prefix}}StepperViewController.m
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/4/26.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}StepperViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}Stepper.h"

@interface {{args.Prefix}}StepperViewController ()<HTRouteTargetProtocol,
HTContainerViewControllerProtocol,
HTNavigationBackPanGestureProtocol>

@end

@implementation {{args.Prefix}}StepperViewController
@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://stepper";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark - Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"进步器";
    [self loadSubviews];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    
}


#pragma mark - Init View

- (void)loadSubviews{
    
    {{args.Prefix}}Stepper * stepper1 = [[{{args.Prefix}}Stepper alloc]init];
    stepper1.currentValue = 10;
    stepper1.valueChangedCallback = ^({{args.Prefix}}Stepper *stepper, int newValue) {
        NSLog(@"new value is %i",newValue);
    };
    stepper1.width = 160;
    stepper1.height = 45;
    stepper1.middleX = SCREEN_WIDTH/2.0;
    stepper1.y = 80;
    [self.view addSubview:stepper1];
    
    UILabel *label1 = [self creatHintLabelWithText:@"0px圆角"];
    label1.middleX = SCREEN_WIDTH/2.0;
    label1.y = stepper1.bottom + 14;
    [self.view addSubview:label1];
    
    {{args.Prefix}}Stepper * stepper2 = [[{{args.Prefix}}Stepper alloc]init];
    stepper2.currentValue = 10;
    stepper2.radian = 1.5f;
    stepper2.width = 160;
    stepper2.height = 45;
    stepper2.middleX = SCREEN_WIDTH/2.0;
    stepper2.y = label1.bottom + 41;
    [self.view addSubview:stepper2];
    
    
    UILabel *label2 = [self creatHintLabelWithText:@"3px圆角"];
    label2.middleX = stepper1.middleX;
    label2.y = stepper2.bottom + 14;
    [self.view addSubview:label2];
    
    
    {{args.Prefix}}Stepper * stepper3 = [[{{args.Prefix}}Stepper alloc]init];
    stepper3.currentValue = 10;
    stepper3.radian = 3.0f;
    stepper3.width = 160;
    stepper3.height = 45;
    stepper3.middleX = SCREEN_WIDTH/2.0;
    stepper3.y = label2.bottom + 41;
    [self.view addSubview:stepper3];
    
    
    UILabel *label3 = [self creatHintLabelWithText:@"6px圆角"];
    label3.middleX = stepper1.middleX;
    label3.y = stepper3.bottom + 14;
    [self.view addSubview:label3];
    
    
    {{args.Prefix}}Stepper * stepper4 = [[{{args.Prefix}}Stepper alloc]init];
    stepper4.currentValue = 10;
    stepper4.radian = 22.5f;
    stepper4.width = 160;
    stepper4.height = 45;
    stepper4.middleX = SCREEN_WIDTH/2.0;
    stepper4.y = label3.bottom + 41;
    [self.view addSubview:stepper4];
    
    
    UILabel *label4 = [self creatHintLabelWithText:@"全圆角"];
    label4.middleX = stepper1.middleX;
    label4.y = stepper4.bottom + 14;
    [self.view addSubview:label4];
    
}

#pragma mark - private method

- (UILabel *)creatHintLabelWithText:(NSString *)text{
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:14.0];
    label.textColor = [UIColor colorWithRGBValue:kLightTextColor];
    label.textAlignment = NSTextAlignmentCenter;
    [label sizeToFit];
    return label;
}

@end
