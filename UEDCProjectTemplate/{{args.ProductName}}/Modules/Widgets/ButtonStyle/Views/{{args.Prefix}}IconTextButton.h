//
//  {{args.Prefix}}IconTextButton.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/3.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "{{args.Prefix}}ImageTextButton.h"

typedef NS_ENUM(NSInteger, {{args.Prefix}}ButtonIconDirection) {
    {{args.Prefix}}ButtonIconDirectionUp,
    {{args.Prefix}}ButtonIconDirectionLeft,
    {{args.Prefix}}ButtonIconDirectionRight,
    {{args.Prefix}}ButtonIconDirectionDown,
};

@interface {{args.Prefix}}IconTextButton : {{args.Prefix}}ImageTextButton

-(void)arrangeIcon:({{args.Prefix}}ButtonIconDirection)direction;

@end
