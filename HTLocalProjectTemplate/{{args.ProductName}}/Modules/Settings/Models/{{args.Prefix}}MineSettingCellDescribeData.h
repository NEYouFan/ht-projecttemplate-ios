//
//  {{args.Prefix}}MineSettingCellDescribeData.h
//  TestNei
//
//  Created by {{args.Author}} on 21/10/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "MCTableBaseDescribeData.h"
#import "{{args.Prefix}}MineSettingLogoutCell.h"
#import "{{args.Prefix}}MineSettingSwitchCell.h"

@interface {{args.Prefix}}MineSettingCellDescribeData : MCTableBaseDescribeData

@property (nonatomic, weak) id<{{args.Prefix}}MineSettingSwitchDelegate> switchDelegate;
@property (nonatomic, weak) id<{{args.Prefix}}MineSettingLogoutDelegate> logoutDelegate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *rightTitle;
@property (nonatomic, assign, getter=isSwitchOn) BOOL switchOn;
@property (nonatomic, assign) UITableViewCellSelectionStyle selectionStyle;

@end
