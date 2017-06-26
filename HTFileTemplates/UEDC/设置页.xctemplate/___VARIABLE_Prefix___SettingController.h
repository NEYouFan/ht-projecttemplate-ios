//
//  ___VARIABLE_Prefix:identifier___SettingController.h
//  ___VARIABLE_Prefix:identifier___
//
//  Created by Baitianyu on 25/05/2017.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "___VARIABLE_Prefix:identifier___BaseViewController.h"

@class ___VARIABLE_Prefix:identifier___SettingController;

@protocol ___VARIABLE_Prefix:identifier___SettingControllerDelegate <NSObject>

@required
- (void)refreshUser:(___VARIABLE_Prefix:identifier___SettingController *)settingController;

@end

@interface ___VARIABLE_Prefix:identifier___SettingController : ___VARIABLE_Prefix:identifier___BaseViewController

@property (nonatomic, weak) id<___VARIABLE_Prefix:identifier___SettingControllerDelegate> delegate;

@end
