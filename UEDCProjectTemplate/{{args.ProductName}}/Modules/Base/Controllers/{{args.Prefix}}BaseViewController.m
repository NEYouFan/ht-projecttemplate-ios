//
//  {{args.Prefix}}BaseViewController.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 12/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}BaseViewController.h"
#import "HTBaseRequest.h"

@interface {{args.Prefix}}BaseViewController ()

/// 存储待 cancel 的网络请求
@property (nonatomic, strong) NSPointerArray *needCancelRequests;

/// 用于恢复状态栏
@property (nonatomic, assign) {{args.Prefix}}StatusBarStyle lastStatusBarStyle;

@end

@implementation {{args.Prefix}}BaseViewController

#pragma mark - Life cycle.

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (_statusBarStyle != {{args.Prefix}}StatusBarStyleInvalid) {
        _lastStatusBarStyle = [self currentStatusBarStyle];
        [UIApplication sharedApplication].statusBarStyle = [self convertStatusBarStyle:_statusBarStyle];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.statusBarStyle != {{args.Prefix}}StatusBarStyleInvalid) {
        [UIApplication sharedApplication].statusBarStyle = [self convertStatusBarStyle:_lastStatusBarStyle];
    }
}

- (void)dealloc {
    for (HTBaseRequest *request in _needCancelRequests) {
        if (request) {
            [request cancel];
        }
    }
}


#pragma mark - Public methods.

- (void)cancelRequestWhenControllerDealloc:(HTBaseRequest *)request {
    if (!_needCancelRequests) {
        _needCancelRequests = [NSPointerArray weakObjectsPointerArray];
    }
    [_needCancelRequests addPointer:(__bridge void * _Nullable)request];
}

- (void)clearRequests {
    for (HTBaseRequest *request in _needCancelRequests) {
        if (request) {
            [request cancel];
        }
    }
}


#pragma mark - Setter.

- (void)setStatusBarStyle:({{args.Prefix}}StatusBarStyle)statusBarStyle {
    _statusBarStyle = statusBarStyle;
    [UIApplication sharedApplication].statusBarStyle = [self convertStatusBarStyle:_statusBarStyle];
    _lastStatusBarStyle = [self currentStatusBarStyle];
}


#pragma mark - Private methods.

- ({{args.Prefix}}StatusBarStyle)currentStatusBarStyle {
    if ([UIApplication sharedApplication].statusBarStyle == UIStatusBarStyleDefault) {
        return {{args.Prefix}}StatusBarStyleDefault;
    } else if ([UIApplication sharedApplication].statusBarStyle == UIStatusBarStyleLightContent) {
        return {{args.Prefix}}StatusBarStyleLightContent;
    } else {
        return {{args.Prefix}}StatusBarStyleLightContent;
    }
}

- (UIStatusBarStyle)convertStatusBarStyle:({{args.Prefix}}StatusBarStyle)style {
    if (style == {{args.Prefix}}StatusBarStyleDefault) {
        return UIStatusBarStyleDefault;
    } else if (style == {{args.Prefix}}StatusBarStyleLightContent) {
        return UIStatusBarStyleLightContent;
    } else {
        return UIStatusBarStyleLightContent;
    }
}

@end
