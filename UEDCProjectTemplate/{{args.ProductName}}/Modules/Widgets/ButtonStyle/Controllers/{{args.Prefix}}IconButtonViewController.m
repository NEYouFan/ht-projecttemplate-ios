//
//  {{args.Prefix}}IconButtonViewController.m
//
//  Created by {{args.Author}} on 2017/5/2.
//    Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}IconButtonViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}IconTextButton.h"
#import "UIImage+Alpha.h"

@interface {{args.Prefix}}IconButtonViewController () <HTRouteTargetProtocol,
                                                HTContainerViewControllerProtocol,
                                                HTNavigationBackPanGestureProtocol>

@end

@implementation {{args.Prefix}}IconButtonViewController

@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://IconButton";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark --- Life Cycle ---

- (void)viewDidLoad {
    [super viewDidLoad];
    //to do: 设置页面title
    self.title = @"icon+文字的按钮";
    [self loadSubviews];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    
    self.view.backgroundColor = [UIColor colorWithRGBValue:0xf8f8f8];
    // Do any additional setup after loading the view.
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    // 若要修改tableview／refreshview／loadmoreview的frame，在这里修改
}

#pragma mark --- loadSubViews ---

- (void)loadSubviews{
    {{args.Prefix}}IconTextButton * button1 = [self IconTextButtonWithTitle:@"添加礼品卡"
                                                       titleFont:[UIFont fontWithName:@"PingFangSC-Regular" size:kDefaultTitleFontSize]
                                                           image:[UIImage imageNamed:@"widget_default_m"]
                                                       imageSize: CGSizeMake(24, 24)];
   
    button1.frame = CGRectMake(15, 15, SCREEN_WIDTH - 30, 44);
    [button1 arrangeIcon:{{args.Prefix}}ButtonIconDirectionLeft];
    [self.view addSubview:button1];
    
    {{args.Prefix}}IconTextButton * button2 = [self IconTextButtonWithTitle:@"添加好友"
                                                       titleFont:[UIFont fontWithName:@"PingFangSC-Regular" size:kDefaultTitleFontSize]
                                                           image:[UIImage imageNamed:@"widget_default_m"]
                                                       imageSize: CGSizeMake(24, 24)];
    
    button2.width = (SCREEN_WIDTH - 45)/2;
    button2.height = 40;
    button2.x =  15;
    button2.y = button1.bottom + 15;
    [button2 arrangeIcon:{{args.Prefix}}ButtonIconDirectionLeft];
    [self.view addSubview:button2];
    
    {{args.Prefix}}IconTextButton * button3 = [self IconTextButtonWithTitle:@"添加收藏"
                                                       titleFont:[UIFont fontWithName:@"PingFangSC-Regular" size:kDefaultTitleFontSize]
                                                           image:[UIImage imageNamed:@"widget_default_m"]
                                                       imageSize: CGSizeMake(24, 24)];
    
    button3.width = (SCREEN_WIDTH - 45)/2;
    button3.height = 40;
    button3.x =  button2.tail + 15;
    button3.y = button1.bottom + 15;
    [button3 arrangeIcon:{{args.Prefix}}ButtonIconDirectionLeft];
    [self.view addSubview:button3];
    
    {{args.Prefix}}IconTextButton * button4 = [self IconTextButtonWithTitle:@"立即抢购"
                                                       titleFont:[UIFont fontWithName:@"PingFangSC-Regular" size:kDefaultTitleFontSize]
                                                           image:[UIImage imageNamed:@"widget_default_m"]
                                                       imageSize: CGSizeMake(24, 24)];
    
    button4.width = (SCREEN_WIDTH - 45)/2;
    button4.height = 40;
    button4.x =  15;
    button4.y = button2.bottom + 15;
    [button4 arrangeIcon:{{args.Prefix}}ButtonIconDirectionRight];
    [self.view addSubview:button4];
    
    {{args.Prefix}}IconTextButton * button5 = [self IconTextButtonWithTitle:@"查看详情"
                                                       titleFont:[UIFont fontWithName:@"PingFangSC-Regular" size:kDefaultTitleFontSize]
                                                           image:[UIImage imageNamed:@"widget_default_m"]
                                                       imageSize: CGSizeMake(24, 24)];
    
    button5.width = (SCREEN_WIDTH - 45)/2;
    button5.height = 40;
    button5.x =  button4.tail + 15;
    button5.y = button2.bottom + 15;
    [button5 arrangeIcon:{{args.Prefix}}ButtonIconDirectionRight];
    [self.view addSubview:button5];
    
    {{args.Prefix}}IconTextButton * button6 = [self IconTextButtonWithTitle:@"顶部"
                                                       titleFont:[UIFont systemFontOfSize:10]
                                                           image:[UIImage imageNamed:@"widget_default_s"]
                                                       imageSize: CGSizeMake(14, 14)];
    button6.width = 40;;
    button6.height = 40;
    button6.x = 15;
    button6.y = button4.bottom + 15;
    button6.layer.cornerRadius = button6.width/2;
    [button6 arrangeIcon:{{args.Prefix}}ButtonIconDirectionUp];
    [self.view addSubview:button6];
    
    {{args.Prefix}}IconTextButton * button7 = [self IconTextButtonWithTitle:@"关闭"
                                                       titleFont:[UIFont systemFontOfSize:10]
                                                           image:[UIImage imageNamed:@"widget_default_s"]
                                                       imageSize: CGSizeMake(14, 14)];
    button7.width = 40;;
    button7.height = 40;
    button7.x = button6.tail + 12;
    button7.y = button4.bottom + 15;
    button7.layer.cornerRadius = button7.width/2;
    [button7 arrangeIcon:{{args.Prefix}}ButtonIconDirectionUp];
    [self.view addSubview:button7];



    
    
}


# pragma mark  --- private method ---

-({{args.Prefix}}IconTextButton *)IconTextButtonWithTitle:(NSString *)title
                                     titleFont:(UIFont *)font
                                         image:(UIImage *)image
                                     imageSize:(CGSize)size{
    {{args.Prefix}}IconTextButton * button1 = [[{{args.Prefix}}IconTextButton alloc] init];
    button1.layer.borderColor = [UIColor colorWithRGBValue:kDefaultButtonColor].CGColor;
    button1.layer.borderWidth = 1;
    button1.backgroundColor = [UIColor whiteColor];
    UIImageView *iconView1 = [[UIImageView alloc] init];
    iconView1.size = size;
    iconView1.image = button1.normalImage = image;
    button1.highlightedImage = [image imageByApplyingAlpha:0.6];
    button1.iconView = iconView1;
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectZero];
    label1.textColor = button1.normalTextColor = [UIColor colorWithRGBValue:kContentTextColor];
    button1.highlightedTextColor = [UIColor colorWithRGBValue:kDefaultButtonHighlightColor];
    label1.text = title;
    label1.textAlignment = NSTextAlignmentLeft;
    label1.font = font;
    [label1 sizeToFit];
    button1.textLabel = label1;
    return button1;
}

@end

