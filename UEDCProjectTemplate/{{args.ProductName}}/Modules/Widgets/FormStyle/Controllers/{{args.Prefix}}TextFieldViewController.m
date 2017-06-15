//
//  {{args.Prefix}}TextBoxViewController.m
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/4/26.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}TextFieldViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}TextField.h"


@interface {{args.Prefix}}TextFieldViewController ()<HTRouteTargetProtocol,
                                        HTContainerViewControllerProtocol,
                                        HTNavigationBackPanGestureProtocol>

@property(nonatomic, weak) {{args.Prefix}}TextField * textField;

@end

@implementation {{args.Prefix}}TextFieldViewController
@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://textField";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"文本框控件";
    [self loadSubviews];
    [self layoutViews];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];

}


#pragma mark - Init View

- (void)loadSubviews{

    [self.view addSubview:self.textField];
    
}


#pragma mark - layout methods

- (void)layoutViews{
    
    self.textField.frame = CGRectMake(20, 55, SCREEN_WIDTH - 20 * 2, 30);
    
}

#pragma mark - Getters or Setters

-({{args.Prefix}}TextField *)textField{
    if (!_textField) {
        {{args.Prefix}}TextField *textField = [[{{args.Prefix}}TextField alloc] init];
        textField.defaultPlaceholder = @"默认文案";
        _textField = textField;
    }
    return _textField;
}


@end
