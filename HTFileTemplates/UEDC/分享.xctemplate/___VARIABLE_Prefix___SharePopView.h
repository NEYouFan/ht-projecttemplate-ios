//
//  ___VARIABLE_Prefix:identifier___SharePopView.h
//  ___VARIABLE_Prefix:identifier___
//
//  Created by 陶泽宇 on 2017/5/16.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "___VARIABLE_Prefix:identifier___ShareContentData.h"

@interface ___VARIABLE_Prefix:identifier___SharePopView : UIView

@property(nonatomic, copy)NSArray<___VARIABLE_Prefix:identifier___ShareContentData *> *contents;

+ (instancetype)sharedInstance;

- (void)show;

- (void)dismiss;


@end
