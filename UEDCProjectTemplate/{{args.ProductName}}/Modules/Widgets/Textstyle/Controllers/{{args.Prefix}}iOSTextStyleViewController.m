//
//  {{args.Prefix}}iOSTextStyleViewController.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/20.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}iOSTextStyleViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"

@interface {{args.Prefix}}iOSTextStyleViewController ()<HTRouteTargetProtocol,
                                            HTContainerViewControllerProtocol,
                                            HTNavigationBackPanGestureProtocol>

@end

@implementation {{args.Prefix}}iOSTextStyleViewController
@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://iOS_textStyle";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"iOS默认字体";
    [self loadSubviews];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    // Do any additional setup after loading the view.
}

- (void)loadSubviews{
    UILabel *titleLabel_1 = [[UILabel alloc] init];
    titleLabel_1.x = 15;
    titleLabel_1.y = 33;
    titleLabel_1.height = 21;
    titleLabel_1.text = @"iOS默认中文字体";
    titleLabel_1.font = [UIFont systemFontOfSize:15];
    titleLabel_1.textColor = [UIColor colorWithRGBValue:kLightTextColor];
    titleLabel_1.textAlignment = NSTextAlignmentLeft;
    [titleLabel_1 sizeToFit];
    [self.view addSubview:titleLabel_1];
    
    UIView *firstView = [[UIView alloc] init];
    firstView.x = titleLabel_1.x;
    firstView.y = titleLabel_1.bottom + 11.5;
    firstView.width = SCREEN_WIDTH -30;
    firstView.height = 167.5;
    firstView.backgroundColor = [UIColor whiteColor];
    firstView.layer.cornerRadius = 2;
    [self.view addSubview:firstView];
    
    UILabel *ChineseLabel = [[UILabel alloc] init];
    ChineseLabel.font = [UIFont systemFontOfSize:35];
    ChineseLabel.textAlignment = NSTextAlignmentCenter;
    ChineseLabel.text = @"苹方";
    ChineseLabel.textColor = [UIColor colorWithRGBValue:kDefaultTextColor];
    [ChineseLabel sizeToFit];
    ChineseLabel.middleX = firstView.width/2;
    ChineseLabel.middleY = firstView.height/2;
    [firstView addSubview:ChineseLabel];
    
    
    UILabel *titleLabel_2 = [[UILabel alloc] init];
    titleLabel_2.x = 15;
    titleLabel_2.y = firstView.bottom + 32;;
    titleLabel_2.height = 21;
    titleLabel_2.text = @"iOS默认英文字体";
    titleLabel_2.font = [UIFont systemFontOfSize:15];
    titleLabel_2.textColor = [UIColor colorWithRGBValue:kLightTextColor];
    titleLabel_2.textAlignment = NSTextAlignmentLeft;
    [titleLabel_2 sizeToFit];
    [self.view addSubview:titleLabel_2];
    
    UIView *secondView = [[UIView alloc] init];
    secondView.x = titleLabel_2.x;
    secondView.y = titleLabel_2.bottom + 11.5;
    secondView.width = SCREEN_WIDTH -30;
    secondView.height = 167.5;
    secondView.backgroundColor = [UIColor whiteColor];
    secondView.layer.cornerRadius = 2;
    [self.view addSubview:secondView];
    
    UILabel *EnglishLabel = [[UILabel alloc] init];
    EnglishLabel.font = [UIFont systemFontOfSize:35];
    EnglishLabel.textAlignment = NSTextAlignmentCenter;
    EnglishLabel.text = @"San Francisco";
    EnglishLabel.textColor = [UIColor colorWithRGBValue:kDefaultTextColor];
    [EnglishLabel sizeToFit];
    EnglishLabel.middleX = secondView.width/2;
    EnglishLabel.middleY = secondView.height/2;
    [secondView addSubview:EnglishLabel];
}


@end
