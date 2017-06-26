//
//  ___VARIABLE_Prefix:identifier___GuidePageView.h
//  ___VARIABLE_Prefix:identifier___
//
//  Created by shoulei ma on 2017/5/26.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "___VARIABLE_Prefix:identifier___GuidePageModel.h"

@class ___VARIABLE_Prefix:identifier___GuidePageView;

@protocol ___VARIABLE_Prefix:identifier___GuidePageViewDelegate <NSObject>

@optional
- (void)enterButtonClicked:(___VARIABLE_Prefix:identifier___GuidePageView *)view type:(___VARIABLE_Prefix:identifier___GuidePageItemType)type;

@end

@interface ___VARIABLE_Prefix:identifier___GuidePageView : UIView

@property (nonatomic, weak) id<___VARIABLE_Prefix:identifier___GuidePageViewDelegate> delegate;

@property (nonatomic, strong) NSArray <___VARIABLE_Prefix:identifier___GuidePageModel *>*models;

@end
