//
//  {{args.Prefix}}SettingController.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 25/05/2017.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}BaseViewController.h"

@class {{args.Prefix}}SettingController;

@protocol {{args.Prefix}}SettingControllerDelegate <NSObject>

@required
- (void)refreshUser:({{args.Prefix}}SettingController *)settingController;

@end

@interface {{args.Prefix}}SettingController : {{args.Prefix}}BaseViewController

@property (nonatomic, weak) id<{{args.Prefix}}SettingControllerDelegate> delegate;

@end
