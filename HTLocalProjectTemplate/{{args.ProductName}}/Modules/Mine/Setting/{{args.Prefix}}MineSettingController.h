//
//  {{args.Prefix}}MineSettingController.h
//  TestNei
//
//  Created by {{args.Author}} on 21/10/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}BaseViewController.h"

typedef NS_ENUM(NSInteger, {{args.Prefix}}MineSettingActionType) {
    {{args.Prefix}}MineSettingActionTypeNone = 0,
    {{args.Prefix}}MineSettingActionTypeLogout,
    {{args.Prefix}}MineSettingActionTypeClearCache
};

@class {{args.Prefix}}MineSettingController;

@protocol {{args.Prefix}}MineSettingControllerDelegate <NSObject>

@required
- (void)refreshUser:({{args.Prefix}}MineSettingController *)settingController;

@end

@interface {{args.Prefix}}MineSettingController : {{args.Prefix}}BaseViewController

@property (nonatomic, weak) id<{{args.Prefix}}MineSettingControllerDelegate> delegate;

@end
