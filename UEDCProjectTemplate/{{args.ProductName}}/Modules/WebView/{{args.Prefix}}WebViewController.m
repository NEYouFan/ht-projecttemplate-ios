//
//  {{args.Prefix}}WebViewController.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/3/13.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}WebViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}WebLoadingView.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "HTWebViewDelegate.h"

@interface {{args.Prefix}}WebViewController ()<HTRouteTargetProtocol, HTContainerViewControllerProtocol, HTNavigationBackPanGestureProtocol>

@property (nonatomic, strong)UIButton *cancelButton;
@property (nonatomic, strong){{args.Prefix}}WebLoadingView *loadingView;

@end

@implementation {{args.Prefix}}WebViewController
@synthesize containerController;

+ (void)load{
    //设置User-Agent
    [self registUserAgent];
}

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter{
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath{
    return @"{{args.Prefix}}://webview";
}

- (void)receiveRoute:(HTControllerRouteParam*)param{
    self.url = [param.params objectForKey:@"url"];
    self.title = [param.params objectForKey:@"title"];
}

#pragma mark - life cycle

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}


- (void)viewDidLoad{
    [super viewDidLoad];
    
    // 初始化设置webview的NavigationBar
    [self customNavigationBar];
    
    // 初始化loadingView
    [self customLoadingView];
    
    //设置webview代理
    self.webViewDelegate = [HTWebViewDelegate delegateForWebView:self.webView
                                                 webviewDelegate:self
                                          enableJavascriptBridge:YES
                                    withJavascriptDefaultHandler:^(id data, WVJBResponseCallback responseCallback) {}
                                                  enableProgress:YES
                                                withProgressView:_loadingView
                                         enableGestureNavigation:NO];
    //加载url
    if (_url) {
        NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:_url]];
        [self.webView loadRequest:request];
    }
    self.webView.scalesPageToFit = YES;
   
    // 加载该url下对应的cookie
    [self loadCookieOfUrl:self.url];
    
    // 注册jsbridge
    [self configJSBridge];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [self customNavigationBar];
    self.webView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
}


#pragma mark - NaviagationBar
// 初始化设置webview的NavigationBar
- (void)customNavigationBar{
    [self configNavigationBarStyle];
//    [self addLeftBarButton];
//    [self addRightBarButton];
}

- (void)configNavigationBarStyle{
    // 设置状态栏样式
    [UIApplication sharedApplication].statusBarStyle = {{args.Prefix}}StatusBarStyleLightContent;
    // 设置导航栏背景色
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRGBValue:kNaviBackgroundColor]];
    // 设置导航栏是否需要混色
    self.navigationController.navigationBar.translucent = NO;
    // 设置导航栏字体颜色、字体样式
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRGBValue:kNaviForegroundColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:kNaviTitleFontSize], NSFontAttributeName, nil]];
}

//- (UIButton *)addLeftBarButton{
//    // 新建导航栏左侧按钮
//    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectZero];
//    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:leftButton]];
//    [leftButton addTarget:self action:@selector(backClicked:) forControlEvents:UIControlEventTouchUpInside];
//    
//    // 导航栏左侧按钮背景图片(根据视觉需求自定义)
//    UIImage *backImage = [UIImage imageNamed:@"navi_back"];
//    // 导航栏左侧按钮高亮时的背景图片(根据视觉需求自定义)
//    UIImage *backHighlightImage = [UIImage imageNamed:@"navi_back_hl"];
//    [leftButton setBackgroundImage:backImage forState:UIControlStateNormal];
//    [leftButton setBackgroundImage:backHighlightImage forState:UIControlStateHighlighted];
//    [leftButton sizeToFit];
//    
//    return leftButton;
//}
//
//- (UIButton *)addRightBarButton{
//    // 新建导航栏右侧按钮，这里默认为关闭按钮
//    self.cancelButton = [[UIButton alloc] init];
//    [self.cancelButton addTarget:self action:@selector(ht_back) forControlEvents:UIControlEventTouchUpInside];
//    
//    // 导航栏右侧按钮背景图片(根据视觉需求自定义)
//    UIImage *closeIcon = [UIImage imageNamed:@"navi_close"];
//    [self.cancelButton setImage:closeIcon forState:UIControlStateNormal];
//    // 导航栏右侧按钮高亮时的背景图片(根据视觉需求自定义)
//    [self.cancelButton setImage:[UIImage imageNamed:@"navi_close_hl"] forState:UIControlStateHighlighted];
//    [self.cancelButton sizeToFit];
//    self.cancelButton.hidden = YES;
//    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:(UIView *)self.cancelButton];
//    return self.cancelButton;
//}

#pragma mark - loadingView
- (void)customLoadingView{
    CGFloat loadingViewHeight = 2;
    _loadingView = [{{args.Prefix}}WebLoadingView new];
    [self.navigationController.navigationBar addSubview:_loadingView];
    _loadingView.frame = CGRectMake(0, kNavigationBarHeight, SCREEN_WIDTH, loadingViewHeight);
}

#pragma mark - jsbridge
- (void)configJSBridge{
    //在此注册jsbridge,下次的是一个示例
    [self.webViewDelegate.javascriptBridge  registerHandler:@"demoHandler" handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"do something with callback");
    }];

}

#pragma mark - User Agent

// 设置自己的user agent，需找一个合适的时机调用
+ (void)registUserAgent{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIWebView *tempWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
        NSString *oldUA = [tempWebView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
        //在下方设置自己的User Agent
        NSString *newUA = [NSString stringWithFormat:@"%@ %@",oldUA,@"your agent"];
        NSDictionary *dic = @{@"UserAgent": newUA};
        [[NSUserDefaults standardUserDefaults] registerDefaults:dic];
    });
}

#pragma mark - Cookies
// 加载该url下对应的cookie
- (void)loadCookieOfUrl:(NSString *)urlString{
    if (urlString) {
        //防止退出登录的时候 还保留着cookie
        NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
        for (NSHTTPCookie *cookie in [storage cookies]) {
            [storage deleteCookie:cookie];
        }
        
        NSURL *url = [NSURL URLWithString:urlString];
        NSMutableDictionary *cookieProperties = [NSMutableDictionary dictionary];
        //以下是相关的设置cookie的配置相关信息项，可根据自身需要来设置
        [cookieProperties setObject:@"cookie_name" forKey:NSHTTPCookieName];
        [cookieProperties setObject:@"cookie_value" forKey:NSHTTPCookieValue];
        [cookieProperties setObject:[url host] forKey:NSHTTPCookieOriginURL];
        [cookieProperties setObject:@"xxx.xxx.com" forKey:NSHTTPCookieDomain];
        [cookieProperties setObject:@"true" forKey:@"HttpOnly"];
        [cookieProperties setObject:@"/" forKey:NSHTTPCookiePath];
        [cookieProperties setObject:@"0" forKey:NSHTTPCookieVersion];
        [cookieProperties setObject:[[NSDate date] dateByAddingTimeInterval:102400] forKey:NSHTTPCookieExpires];
        NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:cookieProperties];
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
    }
}

#pragma mark - Publich Method

- (void)setUrl:(NSString *)url{
    _url = url;
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [self.webView loadRequest:request];
}

#pragma mark - Private Method

//- (void)backClicked:(id)sender{
//    if ([self.webView canGoBack]) {
//        [self.webView goBack];
//        self.cancelButton.hidden = NO;
//    } else {
//        [self ht_back];
//    }
//}

#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    if (self.title == nil) {
        self.title = self.webTitle?:@"专题";
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}

@end
