//
//  {{args.Prefix}}VerifyGusturePasswordViewController.m
//
//  Created by {{args.Author}} on 2017/5/27.
//    Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}VerifyGusturePasswordViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}LockLabel.h"
#import "{{args.Prefix}}Circle.h"
#import "{{args.Prefix}}CircleView.h"
#import "{{args.Prefix}}CircleViewConst.h"

@interface {{args.Prefix}}VerifyGusturePasswordViewController () <HTRouteTargetProtocol,
                                                        HTContainerViewControllerProtocol,
                                                        HTNavigationBackPanGestureProtocol,
                                                        CircleViewDelegate>

@property (nonatomic, strong) {{args.Prefix}}CircleView *lockView;
@property (nonatomic, strong) {{args.Prefix}}LockLabel *msgLabel;

@end

@implementation {{args.Prefix}}VerifyGusturePasswordViewController

@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://VerifyGusturePassword";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark --- Life Cycle ---

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"验证手势密码";
    [self loadSubviews];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    self.view.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
    // Do any additional setup after loading the view.
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    // 若要修改tableview／refreshview／loadmoreview的frame，在这里修改
}

#pragma mark --- loadSubViews ---

- (void)loadSubviews{
    {{args.Prefix}}LockLabel *msgLabel = [[{{args.Prefix}}LockLabel alloc] init];
    msgLabel.frame = CGRectMake(0, 0, SCREEN_WIDTH, 14);
    msgLabel.center = CGPointMake(SCREEN_WIDTH/2, 90);
    self.msgLabel = msgLabel;
    [self.view addSubview:msgLabel];
    [self.msgLabel showNormalMsg:gestureTextOldGesture];

    
    {{args.Prefix}}CircleView *lockView = [[{{args.Prefix}}CircleView alloc] init];
    lockView.arrow = NO;
    lockView.delegate = self;
    self.lockView = lockView;
    [self.lockView setType:CircleViewTypeVerify];
    lockView.y = self.msgLabel.bottom + 40;
    [self.view addSubview:lockView];
}


#pragma mark - login or verify gesture
- (void)circleView:({{args.Prefix}}CircleView *)view type:(CircleViewType)type didCompleteLoginGesture:(NSString *)gesture result:(BOOL)equal
{
    if (type == CircleViewTypeVerify) {
        
        if (equal) {
            NSLog(@"验证成功");
            [self ht_back];
            
        } else {
            NSLog(@"密码错误！");
            [self.msgLabel showWarnMsgAndShake:gestureTextGestureVerifyError];
        }
    }
}

#pragma mark -- HTNavigationBackPanGestureProtocol --

- (BOOL)navigationControllerBackPanGestureRecognizerShouldBegin:(UIPanGestureRecognizer*)gesture{
    return NO;
}


@end

