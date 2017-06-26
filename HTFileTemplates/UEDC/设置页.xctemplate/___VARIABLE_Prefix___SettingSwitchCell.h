//
//  ___VARIABLE_Prefix:identifier___SettingSwitchCell.h
//  ___VARIABLE_Prefix:identifier___
//
//  Created by Baitianyu on 25/05/2017.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "MCTableBaseCell.h"

@protocol ___VARIABLE_Prefix:identifier___SettingSwitchDelegate <NSObject>

@optional
- (void)switchChanged:(BOOL)switchOn;

@end


@interface ___VARIABLE_Prefix:identifier___SettingSwitchCell : MCTableBaseCell

@property (nonatomic, weak) id<___VARIABLE_Prefix:identifier___SettingSwitchDelegate> delegate;

@end
