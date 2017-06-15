//
//  {{args.Prefix}}SettingCellDescribeData.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 25/05/2017.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "MCTableBaseDescribeData.h"
#import "{{args.Prefix}}SettingSwitchCell.h"

@interface {{args.Prefix}}SettingCellDescribeData : MCTableBaseDescribeData

@property (nonatomic, copy) NSString *iconName;
@property (nonatomic, weak) id<{{args.Prefix}}SettingSwitchDelegate> switchDelegate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) NSString *rightTitle;
@property (nonatomic, assign, getter=isSwitchOn) BOOL switchOn;

@end
