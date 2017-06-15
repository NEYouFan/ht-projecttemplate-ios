//
//  {{args.Prefix}}ShareKitViewController.m
//
//  Created by {{args.Author}} on 2017/5/16.
//    Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}ShareKitViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"
#import "UIImage+Alpha.h"
#import "UIImage+ImageWithColor.h"
#import "{{args.Prefix}}ShareContentData.h"
#import "{{args.Prefix}}SharePopView.h"

@interface {{args.Prefix}}ShareKitViewController () <HTRouteTargetProtocol,
                                                HTContainerViewControllerProtocol,
                                                HTNavigationBackPanGestureProtocol>

@property (nonatomic, strong) UIButton *shareButton;

@end

@implementation {{args.Prefix}}ShareKitViewController

@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://shareKit";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
    
}


#pragma mark --- Life Cycle ---

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"分享控件";
    [self loadSubviews];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    _shareButton = [self {{args.CategoryPrefix}}_addNavigationRightItemWithTitle:@"分享"];
    [_shareButton addTarget:self action:@selector(onClickShare) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    // 若要修改tableview／refreshview／loadmoreview的frame，在这里修改
}

#pragma mark --- loadSubViews ---

- (void)loadSubviews{
    
}

#pragma mark --- share ---

- (void)onClickShare{
    [{{args.Prefix}}SharePopView sharedInstance].contents = [self shareContents];
    [[{{args.Prefix}}SharePopView sharedInstance] show];
}

- (NSArray *)shareContents{
    NSMutableArray *results = [[NSMutableArray alloc] initWithCapacity:10];
    for (int i = 0; i < 10; i++) {
        {{args.Prefix}}ShareContentData *content =  [[{{args.Prefix}}ShareContentData alloc] init];
        content.title = [NSString stringWithFormat:@"应用%d",i+1];
        content.image = [UIImage imageWithColor:[UIColor colorWithRGBValue:0xffffff]];
        content.imagePressed = [content.image imageByApplyingAlpha:0.6];
        [results addObject:content];
    }
    return results;
}


@end

