//
//  {{args.Prefix}}MineSettingSwitchCell.h
//  TestNei
//
//  Created by {{args.Author}} on 21/10/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "MCTableBaseCell.h"

@protocol {{args.Prefix}}MineSettingSwitchDelegate <NSObject>

@optional
- (void)switchChanged:(BOOL)switchOn;

@end


@interface {{args.Prefix}}MineSettingSwitchCell : MCTableBaseCell

@property (nonatomic, weak) id<{{args.Prefix}}MineSettingSwitchDelegate> delegate;

@end
