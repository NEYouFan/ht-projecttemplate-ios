//
//  {{args.Prefix}}PickerViewController.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/27.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}PickerViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}PickerView.h"

@interface {{args.Prefix}}PickerViewController ()  <HTRouteTargetProtocol,
                                         HTContainerViewControllerProtocol,
                                         HTNavigationBackPanGestureProtocol>

@property (nonatomic, strong) {{args.Prefix}}PickerView *pickerView;

@end

@implementation {{args.Prefix}}PickerViewController
@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://picker";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark - life cycle.

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"筛选控件";
    
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    
    [self loadSubviews];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    _pickerView.x = 0;
    _pickerView.y = 0;
    _pickerView.width = SCREEN_WIDTH;
    _pickerView.height = SCREEN_HEIGHT - kNavigationHeight;
}


#pragma mark - laod view.

- (void)loadSubviews {
    _pickerView = [[{{args.Prefix}}PickerView alloc] init];
    [self.view addSubview:_pickerView];
    _pickerView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.3];
}

@end
