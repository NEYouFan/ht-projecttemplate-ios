//
//  UIView+{{args.Prefix}}Toast.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 06/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "UIView+{{args.Prefix}}Toast.h"
#import "UIView+HTToast.h"

@implementation UIView ({{args.Prefix}}Toast)

- (void){{args.CategoryPrefix}}_showToastWithMessage:(NSString *)message {
    [self makeToast:message duration:0.5 position:HTToastPositionCenter];
}

@end
