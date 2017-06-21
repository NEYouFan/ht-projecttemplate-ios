//
//  {{args.Prefix}}PhotoChooseViewController.m
//
//  Created by {{args.Author}} on 2017/5/19.
//    Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}PhotoChooseViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}ImagePickerViewManager.h"

@interface {{args.Prefix}}PhotoChooseViewController () <HTRouteTargetProtocol,
                                                HTContainerViewControllerProtocol,
                                                HTNavigationBackPanGestureProtocol>

@end

@implementation {{args.Prefix}}PhotoChooseViewController

@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://photoChoose";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark --- Life Cycle ---

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"照片选择页面布局";
    [self loadSubviews];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    // Do any additional setup after loading the view.
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    // 若要修改tableview／refreshview／loadmoreview的frame，在这里修改
}

#pragma mark --- loadSubViews ---

- (void)loadSubviews{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.width = SCREEN_WIDTH - 60;
    button.height = 42;
    button.center = CGPointMake(SCREEN_WIDTH/2., (SCREEN_HEIGHT - kNavigationHeight)/2.);
    button.layer.masksToBounds = YES;
    button.backgroundColor = [UIColor whiteColor];
    button.layer.borderWidth = 0.5f;
    button.layer.borderColor = [UIColor colorWithRGBValue:kTextBorderColor].CGColor;
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"照片选择页面布局" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRGBValue:kButtonTextColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:kDefaultTitleFontSize];
    [self.view addSubview:button];

}


#pragma mark --- button action ---

- (void)clickButton{
    [[{{args.Prefix}}ImagePickerViewManager sharedInstance] showImagePickerWithFinishedBlock:^({{args.Prefix}}ImagePickerViewController *imagePickerViewController, NSArray<HTAsset *> *assets) {
        NSLog(@"选择了%lu张照片", (unsigned long)assets.count);
    } cancelBlock:^({{args.Prefix}}ImagePickerViewController *imagePickerViewController) {
        NSLog(@"取消照片选择");
    }];
}

@end

