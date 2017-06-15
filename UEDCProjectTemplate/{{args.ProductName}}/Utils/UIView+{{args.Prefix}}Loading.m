//
//  UIView+{{args.Prefix}}Loading.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 09/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "UIView+{{args.Prefix}}Loading.h"
#import "{{args.Prefix}}LoadingView.h"
#import <objc/runtime.h>
#import "Masonry.h"

static char const *kLoadingKey;
static char const *kLoadingEmptyKey;
static char const *kLoadingErrorKey;
static char const *kRetryBlockKey;

@implementation UIView ({{args.Prefix}}Loading) 

#pragma mark - Loading.

- (void){{args.CategoryPrefix}}_showLoading {
    [self {{args.CategoryPrefix}}_showLoadingWithBackgroundColor:[UIColor colorWithRGBValue:kLoadingBackgroundColor]];
}

- (void){{args.CategoryPrefix}}_showLoadingWithBackgroundColor:(UIColor *)backgroundColor {
    [self {{args.CategoryPrefix}}_showLoadingWithIndication:@"正在加载" backgroundColor:backgroundColor];
}

- (void){{args.CategoryPrefix}}_showLoadingWithIndication:(NSString *)indication {
    [self {{args.CategoryPrefix}}_showLoadingWithIndication:indication backgroundColor:[UIColor colorWithRGBValue:kLoadingBackgroundColor]];
}

- (void){{args.CategoryPrefix}}_showLoadingWithIndication:(NSString *)indication backgroundColor:(UIColor *)backgroundColor {
    {{args.Prefix}}LoadingView *loadingView = [self {{args.CategoryPrefix}}_getLoadingView];
    [self addSubview:loadingView];
    loadingView.indication = indication;
    loadingView.backgroundColor = backgroundColor;
    
    if (!loadingView.superview) {
        [self addSubview:loadingView];
    }
    [self bringSubviewToFront:loadingView];
    
    [loadingView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self);
        make.center.equalTo(self);
    }];
}

- (void){{args.CategoryPrefix}}_hideLoading {
    [self {{args.CategoryPrefix}}_hideLoading:nil];
}

- (void){{args.CategoryPrefix}}_hideLoading:({{args.Prefix}}CompleteBlock)complete {
    {{args.Prefix}}LoadingView *loadingView = [self {{args.CategoryPrefix}}_getLoadingView];
    [UIView animateWithDuration:0.25
                     animations:^{
                         loadingView.alpha = 0;
                     } completion:^(BOOL finished) {
                         if (loadingView.superview) {
                             [loadingView removeFromSuperview];
                             loadingView.alpha = 1;
                         }
                         if (complete) {
                             complete();
                         }
                     }];
}

- ({{args.Prefix}}LoadingView *){{args.CategoryPrefix}}_getLoadingView {
    {{args.Prefix}}LoadingView *loadingView = objc_getAssociatedObject(self, &kLoadingKey);
    if (!loadingView) {
        loadingView = [[{{args.Prefix}}LoadingView alloc] init];
        objc_setAssociatedObject(self, &kLoadingKey, loadingView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return loadingView;
}


#pragma mark - Loading Empty.

- (void){{args.CategoryPrefix}}_showLoadingEmpty:({{args.Prefix}}RetryLoadingBlock)retry {
    [self {{args.CategoryPrefix}}_showLoadingEmptyWithBackgroundColor:[UIColor colorWithRGBValue:kLoadingBackgroundColor] retryBlock:retry];
}

- (void){{args.CategoryPrefix}}_showLoadingEmptyWithBackgroundColor:(UIColor *)backgroundColor retryBlock:({{args.Prefix}}RetryLoadingBlock)retry {
    __weak UIView *weakSelf = self;
    [self {{args.CategoryPrefix}}_hideLoading:^{
        {{args.Prefix}}LoadingEmptyView *loadingEmptyView = [weakSelf {{args.CategoryPrefix}}_getLoadingEmptyView];
        [self addSubview:loadingEmptyView];
        loadingEmptyView.backgroundColor = backgroundColor;
        loadingEmptyView.alpha = 0;
        
        if (!loadingEmptyView.superview) {
            [weakSelf addSubview:loadingEmptyView];
        }
        [weakSelf bringSubviewToFront:loadingEmptyView];
        
        [loadingEmptyView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(self);
            make.center.equalTo(self);
        }];
        
        objc_setAssociatedObject(self, &kRetryBlockKey, retry, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [UIView animateWithDuration:0.25 animations:^{
            loadingEmptyView.alpha = 1;
        }];
    }];
}

- (void){{args.CategoryPrefix}}_hideLoadingEmpty {
    [self {{args.CategoryPrefix}}_hideLoadingEmpty:nil];
}

- (void){{args.CategoryPrefix}}_hideLoadingEmpty:({{args.Prefix}}CompleteBlock)complete {
    {{args.Prefix}}LoadingEmptyView *loadingEmptyView = [self {{args.CategoryPrefix}}_getLoadingEmptyView];
    [UIView animateWithDuration:0.25
                     animations:^{
                         loadingEmptyView.alpha = 0;
                     } completion:^(BOOL finished) {
                         if (loadingEmptyView.superview) {
                             [loadingEmptyView removeFromSuperview];
                             loadingEmptyView.alpha = 1;
                         }
                         if (complete) {
                             complete();
                         }
                     }];
}

- ({{args.Prefix}}LoadingEmptyView *){{args.CategoryPrefix}}_getLoadingEmptyView {
    {{args.Prefix}}LoadingEmptyView *loadingEmptyView = objc_getAssociatedObject(self, &kLoadingEmptyKey);
    if (!loadingEmptyView) {
        loadingEmptyView = [[{{args.Prefix}}LoadingEmptyView alloc] init];
        objc_setAssociatedObject(self, &kLoadingEmptyKey, loadingEmptyView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return loadingEmptyView;
}

- (void)loadingEmptyReload:({{args.Prefix}}LoadingEmptyView *)view {
    [self {{args.CategoryPrefix}}_hideLoadingEmpty];
    {{args.Prefix}}RetryLoadingBlock retryBlock = objc_getAssociatedObject(self, &kRetryBlockKey);
    if (retryBlock) {
        retryBlock();
    }
}


#pragma mark - LoadingError.

- (void){{args.CategoryPrefix}}_showLoadingError:({{args.Prefix}}RetryLoadingBlock)retry {
    [self {{args.CategoryPrefix}}_showLoadingErrorWithBackgroundColor:[UIColor colorWithRGBValue:kLoadingBackgroundColor] retryBlock:retry];
}

- (void){{args.CategoryPrefix}}_showLoadingErrorWithBackgroundColor:(UIColor *)backgroundColor retryBlock:({{args.Prefix}}RetryLoadingBlock)retry {
    __weak UIView *weakSelf = self;
    [self {{args.CategoryPrefix}}_hideLoading:^{
        {{args.Prefix}}LoadingErrorView *loadingErrorView = [weakSelf {{args.CategoryPrefix}}_getLoadingErrorView];
        [self addSubview:loadingErrorView];
        loadingErrorView.backgroundColor = backgroundColor;
        loadingErrorView.alpha = 0;
        
        if (!loadingErrorView.superview) {
            [weakSelf addSubview:loadingErrorView];
        }
        [weakSelf bringSubviewToFront:loadingErrorView];
        
        [loadingErrorView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(self);
            make.center.equalTo(self);
        }];
        
        objc_setAssociatedObject(self, &kRetryBlockKey, retry, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [UIView animateWithDuration:0.25 animations:^{
            loadingErrorView.alpha = 1;
        }];
    }];
}

- (void){{args.CategoryPrefix}}_hideLoadingError {
    [self {{args.CategoryPrefix}}_hideLoadingError:nil];
}

- (void){{args.CategoryPrefix}}_hideLoadingError:({{args.Prefix}}CompleteBlock)complete {
    {{args.Prefix}}LoadingErrorView *loadingErrorView = [self {{args.CategoryPrefix}}_getLoadingErrorView];
    [UIView animateWithDuration:0.25
                     animations:^{
                         loadingErrorView.alpha = 0;
                     } completion:^(BOOL finished) {
                         if (loadingErrorView.superview) {
                             [loadingErrorView removeFromSuperview];
                             loadingErrorView.alpha = 1;
                         }
                         if (complete) {
                             complete();
                         }
                     }];   
}

- ({{args.Prefix}}LoadingErrorView *){{args.CategoryPrefix}}_getLoadingErrorView {
    {{args.Prefix}}LoadingErrorView *loadingErrorView = objc_getAssociatedObject(self, &kLoadingErrorKey);
    if (!loadingErrorView) {
        loadingErrorView = [[{{args.Prefix}}LoadingErrorView alloc] init];
        loadingErrorView.delegate = self;
        objc_setAssociatedObject(self, &kLoadingErrorKey, loadingErrorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return loadingErrorView;
}

- (void)loadingErrorReload:({{args.Prefix}}LoadingErrorView *)view {
    [self {{args.CategoryPrefix}}_hideLoadingError];
    {{args.Prefix}}RetryLoadingBlock retryBlock = objc_getAssociatedObject(self, &kRetryBlockKey);
    if (retryBlock) {
        retryBlock();
    }
}

@end
