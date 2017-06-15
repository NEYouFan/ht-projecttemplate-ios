//
//  {{args.Prefix}}IconTextButton.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/3.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}IconTextButton.h"
#import "UIView+Frame.h"

const CGFloat IconTextGap = 9.0;

@implementation {{args.Prefix}}IconTextButton

-(void)arrangeIcon:({{args.Prefix}}ButtonIconDirection)direction{
    switch (direction) {
        case {{args.Prefix}}ButtonIconDirectionUp:
            self.iconView.middleX = self.textLabel.middleX =self.width/2;
            self.iconView.y = (self.height - self.iconView.height - self.textLabel.height)/2;
            self.textLabel.y = self.iconView.bottom + 2.0;
            break;
        case {{args.Prefix}}ButtonIconDirectionDown:
            self.iconView.middleX = self.textLabel.middleX =self.width/2;
            self.textLabel.y = (self.height - self.iconView.height - self.textLabel.height)/2;
            self.iconView.y = self.textLabel.bottom + 2.0;
            break;
        case {{args.Prefix}}ButtonIconDirectionLeft:
            self.iconView.middleY = self.textLabel.middleY = self.height/2;
            self.iconView.x = (self.width - self.iconView.width - self.textLabel.width)/2;
            self.textLabel.x = self.iconView.tail + IconTextGap;
            break;
        case {{args.Prefix}}ButtonIconDirectionRight:
            self.iconView.middleY = self.textLabel.middleY = self.height/2;
            self.textLabel.x = (self.width - self.iconView.width - self.textLabel.width)/2;
            self.iconView.x = self.textLabel.tail + IconTextGap;
            break;
        default:
            self.iconView.middleY = self.textLabel.middleY = self.height/2;
            self.iconView.x = (self.width - self.iconView.width - self.textLabel.width)/2;
            self.textLabel.x = self.iconView.tail + IconTextGap;
            break;
    }
}

@end
