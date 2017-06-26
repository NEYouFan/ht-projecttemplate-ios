//
//  ___VARIABLE_Prefix:identifier___SettingCellDescribeData.h
//  ___VARIABLE_Prefix:identifier___
//
//  Created by Baitianyu on 25/05/2017.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "MCTableBaseDescribeData.h"
#import "___VARIABLE_Prefix:identifier___SettingSwitchCell.h"

@interface ___VARIABLE_Prefix:identifier___SettingCellDescribeData : MCTableBaseDescribeData

@property (nonatomic, copy) NSString *iconName;
@property (nonatomic, weak) id<___VARIABLE_Prefix:identifier___SettingSwitchDelegate> switchDelegate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) NSString *rightTitle;
@property (nonatomic, assign, getter=isSwitchOn) BOOL switchOn;

@end
