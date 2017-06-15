//
//  {{args.Prefix}}SettingSwitchCell.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 25/05/2017.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "MCTableBaseCell.h"

@protocol {{args.Prefix}}SettingSwitchDelegate <NSObject>

@optional
- (void)switchChanged:(BOOL)switchOn;

@end


@interface {{args.Prefix}}SettingSwitchCell : MCTableBaseCell

@property (nonatomic, weak) id<{{args.Prefix}}SettingSwitchDelegate> delegate;

@end
