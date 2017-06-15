//
//  UIView+{{args.Prefix}}Toast.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 06/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "UIView+{{args.Prefix}}Toast.h"
#import "UIView+HTToast.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

static const NSString *{{args.Prefix}}ToastActivityViewKey  = @"{{args.Prefix}}ToastActivityViewKey";

@implementation UIView ({{args.Prefix}}Toast)

- (void){{args.CategoryPrefix}}_showToastWithMessage:(NSString *)message {
    [self makeToast:message duration:0.5 position:HTToastPositionCenter];
}

- (void){{args.CategoryPrefix}}_showToastWithMessage:(NSString *)message size:(CGSize)size {
    UIView *toast = [self {{args.CategoryPrefix}}_viewForMessage:message image:nil size:size];
    [self showToast:toast duration:0.5 position:HTToastPositionCenter];
}

- (void){{args.CategoryPrefix}}_makeToast:(NSString *)message duration:(NSTimeInterval)duration position:(id)position image:(UIImage *)image {
    UIView *toast = [self {{args.CategoryPrefix}}_viewForMessage:message image:image size:CGSizeZero];
    [self showToast:toast duration:duration position:position];
}

- (UIView *){{args.CategoryPrefix}}_viewForMessage:(NSString *)message image:(UIImage *)image size:(CGSize)size {
    // sanity
    if((message == nil) && (image == nil)) return nil;
    // dynamically build a toast view with any combination of message, title, & image.
    UILabel *messageLabel = nil;
    UIImageView *imageView = nil;
    
    // create the parent view
    UIView *wrapperView = [[UIView alloc] init];
    wrapperView.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);
    wrapperView.layer.cornerRadius = 4;
    
    wrapperView.backgroundColor = [[UIColor colorWithRGBValue:0x333333]
                                   colorWithAlphaComponent:0.8];
    
    if(image != nil) {
        imageView = [[UIImageView alloc] initWithImage:image];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.frame = CGRectMake(38, 25, 34, 34);
    }
    
    CGFloat imageWidth, imageHeight, imageLeft, imageTop;
    
    // the imageView frame values will be used to size & position the other views
    if(imageView != nil) {
        imageWidth = imageView.bounds.size.width;
        imageHeight = imageView.bounds.size.height;
        imageLeft = 38;
        imageTop = 25;
    } else {
        imageWidth = imageHeight = imageLeft = imageTop = 0.0;
    }
    
    if (message != nil) {
        messageLabel = [[UILabel alloc] init];
        messageLabel.numberOfLines = 0;
        messageLabel.font = [UIFont systemFontOfSize:15];
        messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.alpha = 1.0;
        messageLabel.text = message;
        
        // size the message label according to the length of the text
        CGSize maxSizeMessage = CGSizeMake((self.bounds.size.width * 0.8) - imageWidth, self.bounds.size.height * 0.8);
        CGSize expectedSizeMessage = [self sizeForString:message font:messageLabel.font constrainedToSize:maxSizeMessage lineBreakMode:messageLabel.lineBreakMode];
        messageLabel.frame = CGRectMake(0.0, 0.0, expectedSizeMessage.width, expectedSizeMessage.height);
    }
    
    // messageLabel frame values
    CGFloat messageWidth, messageHeight, messageLeft, messageTop;
    
    if(messageLabel != nil) {
        messageWidth = messageLabel.bounds.size.width;
        messageHeight = messageLabel.bounds.size.height;
        messageLeft = 10;
        messageTop = imageTop + imageHeight +10;
    } else {
        messageWidth = messageHeight = messageLeft = messageTop = 0.0;
    }
    
    //    CGFloat longerWidth = MAX(0, messageWidth);
    //    CGFloat longerLeft = MAX(0, messageLeft);
    
    // wrapper width uses the longerWidth or the image width, whatever is larger. same logic applies to the wrapper height
    //    CGFloat wrapperWidth = MAX((imageWidth + (25 * 2)), (longerLeft + longerWidth + 25));
    //    CGFloat wrapperHeight = MAX((messageTop + messageHeight + 23), (imageHeight + (20 * 2)));
    
    wrapperView.frame = CGRectMake(0.0, 0.0, 110, 105);
    
    if(imageView != nil) {
        [wrapperView addSubview:imageView];
    }
    
    if(messageLabel != nil) {
        messageLabel.frame = CGRectMake(messageLeft, messageTop, messageWidth, messageHeight);
        messageLabel.center = CGPointMake(wrapperView.center.x, messageLabel.center.y);
        [wrapperView addSubview:messageLabel];
    }
    
    imageView.center = CGPointMake(wrapperView.center.x, imageView.center.y);
    
    if (size.width && size.height) {
        wrapperView.frame = CGRectMake(0.0, 0.0, size.width, size.height);
        CGFloat top = (size.height - imageView.bounds.size.height - (imageView ? 10 : 0) - messageLabel.bounds.size.height) / 2;
        if (imageView != nil) {
            imageView.frame = CGRectMake((size.width - imageView.bounds.size.width) / 2, top, 34, 34);
        }
        
        if(messageLabel != nil) {
            messageLabel.frame = CGRectMake((size.width - messageLabel.bounds.size.width) / 2, top + imageView.bounds.size.height + (imageView ? 10 : 0), messageWidth, messageHeight);
        }
    }
    
    return wrapperView;
}

- (CGSize)sizeForString:(NSString *)string font:(UIFont *)font constrainedToSize:(CGSize)constrainedSize lineBreakMode:(NSLineBreakMode)lineBreakMode {
    if ([string respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = lineBreakMode;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle};
        CGRect boundingRect = [string boundingRectWithSize:constrainedSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
        return CGSizeMake(ceilf(boundingRect.size.width), ceilf(boundingRect.size.height));
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    return [string sizeWithFont:font constrainedToSize:constrainedSize lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
}

- (void){{args.CategoryPrefix}}_makeToastActivityWithMessage:(NSString *)message
{
    [self {{args.CategoryPrefix}}_makeToastActivityWithMessage:message position:HTToastPositionCenter];
}

- (void){{args.CategoryPrefix}}_makeToastActivityWithMessage:(NSString *)message position:(id)position
{
    // sanity
    self.userInteractionEnabled = NO;
    
    UIView *existingActivityView = (UIView *)objc_getAssociatedObject(self, &{{args.Prefix}}ToastActivityViewKey);
    if (existingActivityView != nil) return;
    UIActivityIndicatorView *activityIndicatorView;
    UIView *activityView;
    
    if (message){
        UILabel *messageLabel = [[UILabel alloc] init];
        messageLabel.text = message;
        messageLabel.textColor = [UIColor whiteColor];
        [messageLabel sizeToFit];
        activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        activityView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 110, 105)];
        
        activityIndicatorView.center = CGPointMake(activityView.bounds.size.width / 2, 20 + activityIndicatorView.bounds.size.height / 2);;
        messageLabel.center = CGPointMake(activityView.bounds.size.width / 2, 65 + messageLabel.bounds.size.height / 2);
        [activityView addSubview:messageLabel];
    }else{
        activityView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
        activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        activityIndicatorView.center = CGPointMake(activityView.bounds.size.width/2, activityView.bounds.size.height / 2);
    }
    activityView.center = [self centerPointForPosition:position withToast:activityView];
    
    activityView.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:0.8];
    activityView.alpha = 0.0;
    activityView.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);
    activityView.layer.cornerRadius = 10;
    
    [activityView addSubview:activityIndicatorView];
    [activityIndicatorView startAnimating];
    
    // associate the activity view with self
    objc_setAssociatedObject (self, &{{args.Prefix}}ToastActivityViewKey, activityView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self addSubview:activityView];
    [UIView animateWithDuration:0.4
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         activityView.alpha = 1.0;
                     } completion:nil];
}

- (void){{args.CategoryPrefix}}_hideToastActivity
{
    self.userInteractionEnabled = YES;
    
    UIView *existingActivityView = (UIView *)objc_getAssociatedObject(self, &{{args.Prefix}}ToastActivityViewKey);
    if (existingActivityView != nil) {
        [UIView animateWithDuration:0.4
                              delay:0.0
                            options:(UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState)
                         animations:^{
                             existingActivityView.alpha = 0.0;
                         } completion:^(BOOL finished) {
                             [existingActivityView removeFromSuperview];
                             objc_setAssociatedObject (self, &{{args.Prefix}}ToastActivityViewKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                         }];
    }
}

- (CGPoint)centerPointForPosition:(id)point withToast:(UIView *)toast
{
    if([point isKindOfClass:[NSString class]]) {
        if([point caseInsensitiveCompare:HTToastPositionTop] == NSOrderedSame) {
            return CGPointMake(self.bounds.size.width/2, (toast.frame.size.height / 2) + 10);
        } else if([point caseInsensitiveCompare:HTToastPositionCenter] == NSOrderedSame) {
            return CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
        }
    } else if ([point isKindOfClass:[NSValue class]]) {
        return [point CGPointValue];
    }
    
    // default to bottom
    return CGPointMake(self.bounds.size.width/2, (self.bounds.size.height - (toast.frame.size.height / 2)) - 10);
}


@end
