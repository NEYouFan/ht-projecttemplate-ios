//
//  {{args.Prefix}}WebProgressViewController.m
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/4/28.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}WebProgressViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"
#import "UITableView+MCRegisterCellClass.h"
#import "UIView+{{args.Prefix}}Line.h"
#import <WebKit/WebKit.h>

@interface {{args.Prefix}}WebProgressViewController ()<HTRouteTargetProtocol,HTContainerViewControllerProtocol,HTNavigationBackPanGestureProtocol>
@property(nonatomic, strong) WKWebView *webView;
@property(nonatomic, strong) UIProgressView * progressView;
@end

@implementation {{args.Prefix}}WebProgressViewController

@synthesize containerController;
#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://webProgress";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark - Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"网页加载进度条";
    [self loadSubviews];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    
}
- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.163.com"]]];
}
#pragma mark - Init View

- (void)loadSubviews{
    
    self.view.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];

    self.webView.x = 0;
    self.webView.y = 2;
    self.webView.width = SCREEN_WIDTH;
    self.webView.height = self.view.height -2;
    [self.view addSubview:self.webView];
    
    
    self.progressView.x = 0;
    self.progressView.y = 0;
    self.progressView.width = SCREEN_WIDTH;
    [self.view addSubview:self.progressView];
    
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progressView.progress = [change[@"new"] floatValue];
        if ([change[@"new"] floatValue] == 1) {

            self.progressView.progressTintColor = [UIColor colorWithRGBValue:kNaviBackgroundColor];
        }else{
            self.progressView.progressTintColor = [UIColor colorWithRGBValue: kwebProgressInnerColor];

        }
        
    }
}

#pragma mark - getter

-(WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc]init];
        _webView.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
        [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    }
    return _webView;
}
-(UIProgressView *)progressView{
    if (!_progressView) {
        _progressView = [[UIProgressView alloc]init];
        _progressView.progressTintColor = [UIColor colorWithRGBValue: kwebProgressInnerColor];
        _progressView.trackTintColor = [UIColor colorWithRGBValue: kDefaultBackgroundColor];
        
    }
    return _progressView;
}


@end
