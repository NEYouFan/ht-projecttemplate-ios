//
//  ___VARIABLE_Prefix:identifier___GuidePageItemView.h
//  ___VARIABLE_Prefix:identifier___
//
//  Created by shoulei ma on 2017/5/26.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "___VARIABLE_Prefix:identifier___GuidePageModel.h"

@class ___VARIABLE_Prefix:identifier___GuidePageItem;

@protocol ___VARIABLE_Prefix:identifier___GuidePageItemDelegate <NSObject>

@optional
- (void)guidePageButtonClicked:(___VARIABLE_Prefix:identifier___GuidePageItem *)item type:(___VARIABLE_Prefix:identifier___GuidePageItemType)type;

@end

@interface ___VARIABLE_Prefix:identifier___GuidePageItem : UIView

@property (nonatomic, weak) id<___VARIABLE_Prefix:identifier___GuidePageItemDelegate> delegate;

- (instancetype)initWithType:(___VARIABLE_Prefix:identifier___GuidePageItemType)type model:(___VARIABLE_Prefix:identifier___GuidePageModel *)model;

@end
