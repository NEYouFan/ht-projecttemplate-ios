//
//  {{args.Prefix}}MineSettingLogoutCell.h
//  TestNei
//
//  Created by {{args.Author}} on 21/10/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "MCTableBaseCell.h"

@class {{args.Prefix}}MineSettingLogoutCell;

@protocol {{args.Prefix}}MineSettingLogoutDelegate <NSObject>

@optional
- (void)logout:({{args.Prefix}}MineSettingLogoutCell *)cell;

@end

@interface {{args.Prefix}}MineSettingLogoutCell : MCTableBaseCell

@property (nonatomic, weak) id<{{args.Prefix}}MineSettingLogoutDelegate> delegate;

@end
