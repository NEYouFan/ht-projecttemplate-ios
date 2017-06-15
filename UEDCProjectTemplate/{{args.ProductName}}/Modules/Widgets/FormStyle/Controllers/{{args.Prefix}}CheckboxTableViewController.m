//
//  {{args.Prefix}}CheckboxTableViewController.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/26.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}CheckboxTableViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"
#import "UIView+{{args.Prefix}}Line.h"
#import "DLRadioButton.h"

typedef NS_ENUM(NSUInteger, {{args.Prefix}}RadioSelectedType) {
    {{args.Prefix}}RadioSelectedTypeCircle,
    {{args.Prefix}}RadioSelectedTypeRectangle,
};

@interface {{args.Prefix}}CheckboxTableViewController () <HTRouteTargetProtocol,
                                               HTContainerViewControllerProtocol,
                                               HTNavigationBackPanGestureProtocol>

@end

@implementation {{args.Prefix}}CheckboxTableViewController
@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://checkbox";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"单选框及复选框";
    
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    
    [self loadSubviews];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

#pragma mark - Init View

- (void)loadSubviews {
    UILabel * label1 = [self creaetHintLabelWithText:@"单选框"];
    label1.x = 14;
    label1.y = 54;
    [self.view addSubview:label1];
    
    UIView * container1 = [self createContainerView];
    container1.x = 0;
    container1.y = label1.bottom + 7;
    [self.view addSubview:container1];
    
    [self addSingleRadionButtonInContainer:container1];

    UILabel * label2 = [self creaetHintLabelWithText:@"复选框1"];
    label2.x = 14;
    label2.y = container1.bottom + 9 ;
    [self.view addSubview:label2];
    
    UIView * container2 = [self createContainerView];
    container2.x = 0;
    container2.y = label2.bottom + 7;
    [self.view addSubview:container2];
    
    [self addMutiRadionButtonInContainer:container2 radioType:{{args.Prefix}}RadioSelectedTypeCircle];
    
    UILabel * label3 = [self creaetHintLabelWithText:@"复选框2"];
    label3.x = 14;
    label3.y = container2.bottom + 9 ;
    [self.view addSubview:label3];
    
    UIView * container3 = [self createContainerView];
    container3.x = 0;
    container3.y = label3.bottom + 7;
    [self.view addSubview:container3];
    
    [self addMutiRadionButtonInContainer:container3 radioType:{{args.Prefix}}RadioSelectedTypeRectangle];
}


#pragma mark - layout methods.

- (void)layoutViews{
}


#pragma mark - event handler.

- (void)logSelectedButton:(DLRadioButton *)radioButton {
    [radioButton setTitle:radioButton.selected ? @"选中" : @"未选中" forState:UIControlStateNormal];
    
    for (DLRadioButton *button in radioButton.otherButtons) {
        [button setTitle:button.selected ? @"选中" : @"未选中" forState:UIControlStateNormal];
    }
}


#pragma mark - private method

-(void)addSingleRadionButtonInContainer:(UIView *)container {
    CGRect buttonFrame1 = CGRectMake(22, 11, 100, 18);
    DLRadioButton *firstRadioButton = [self createRadioButtonWithFrame:buttonFrame1
                                                                 Title:@"未选中"];
    
    [container addSubview:firstRadioButton];
    CGRect buttonFrame2 = CGRectMake(22, 56, 100, 18);
    DLRadioButton *radioButton = [self createRadioButtonWithFrame:buttonFrame2
                                                            Title:@"选中"];
    radioButton.selected = YES;
    firstRadioButton.otherButtons = @[radioButton];
    [container addSubview:radioButton];
    
    firstRadioButton.icon = [UIImage imageNamed:@"widget_single_unselected"];
    radioButton.icon = [UIImage imageNamed:@"widget_single_unselected"];
    firstRadioButton.iconSelected = [UIImage imageNamed:@"widget_single_selected"];
    radioButton.iconSelected = [UIImage imageNamed:@"widget_single_selected"];
}

-(void)addMutiRadionButtonInContainer:(UIView *)container radioType:({{args.Prefix}}RadioSelectedType)type {
    CGRect buttonFrame1 = CGRectMake(22, 11, 100, 18);
    DLRadioButton *firstRadioButton = [self createRadioButtonWithFrame:buttonFrame1
                                                                 Title:@"未选中"];

    [container addSubview:firstRadioButton];
    CGRect buttonFrame2 = CGRectMake(22, 56, 100, 18);
    DLRadioButton *radioButton = [self createRadioButtonWithFrame:buttonFrame2
                                                            Title:@"选中"];
    radioButton.selected = YES;
    firstRadioButton.otherButtons = @[radioButton];
    [container addSubview:radioButton];
    
    firstRadioButton.multipleSelectionEnabled = YES;
    radioButton.multipleSelectionEnabled = YES;
    
    switch (type) {
        case {{args.Prefix}}RadioSelectedTypeCircle: {
            firstRadioButton.icon = [UIImage imageNamed:@"widget_single_unselected"];
            radioButton.icon = [UIImage imageNamed:@"widget_single_unselected"];
            firstRadioButton.iconSelected = [UIImage imageNamed:@"widget_multi_selected1"];
            radioButton.iconSelected = [UIImage imageNamed:@"widget_multi_selected1"];
            break;
        }
        case {{args.Prefix}}RadioSelectedTypeRectangle: {
            firstRadioButton.icon = [UIImage imageNamed:@"widget_multi_unselected2"];
            radioButton.icon = [UIImage imageNamed:@"widget_multi_unselected2"];
            firstRadioButton.iconSelected = [UIImage imageNamed:@"widget_multi_selected2"];
            radioButton.iconSelected = [UIImage imageNamed:@"widget_multi_selected2"];
            break;
        }
        default:
            break;
    }
}

- (UILabel *)creaetHintLabelWithText:(NSString *)text {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:14.0];
    label.textColor = [UIColor colorWithRGBValue:kLightTextColor];
    label.textAlignment = NSTextAlignmentCenter;
    [label sizeToFit];
    return label;
}

- (UIView *)createContainerView {
    UIView * view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    [view {{args.CategoryPrefix}}_addHorizontalTopLineWithLeftMargin:0 rightMargin:0];
    [view {{args.CategoryPrefix}}_addHorizontalBottomLineWithLeftMargin:0 rightMargin:0];
    [view {{args.CategoryPrefix}}_addHorizontalMiddleLineWithLeftMargin:20 rightMargin:0];

    view.height = 90.0;
    view.width = SCREEN_WIDTH;
    return view;
}
- (DLRadioButton *)createRadioButtonWithFrame:(CGRect) frame Title:(NSString *)title {
    DLRadioButton *radioButton = [[DLRadioButton alloc] initWithFrame:frame];
    radioButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [radioButton setTitle:title forState:UIControlStateNormal];
    [radioButton setTitleColor:[UIColor colorWithRGBValue:kContentTextColor] forState:UIControlStateNormal];
    //改变选择标示图片只需要设置icon 和 iconSelected 就好了
    radioButton.iconColor = [UIColor colorWithRGBValue:kSecondClassTitleTextColor];
    radioButton.indicatorColor = [UIColor colorWithRGBValue:kSecondClassTitleTextColor];
    radioButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [radioButton addTarget:self action:@selector(logSelectedButton:) forControlEvents:UIControlEventTouchUpInside];
    radioButton.marginWidth = 16;
    
    return radioButton;
}

@end
