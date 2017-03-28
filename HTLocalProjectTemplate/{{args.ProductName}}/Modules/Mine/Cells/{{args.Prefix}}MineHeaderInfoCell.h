//
//  {{args.Prefix}}MineHeaderInfoCell.h
//  TestNei
//
//  Created by {{args.Author}} on 19/10/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "MCTableBaseCell.h"

@class {{args.Prefix}}MineCellDescribeData;
@class {{args.Prefix}}MineHeaderInfoCell;

@protocol {{args.Prefix}}MineHeaderInfoCellDelegate <NSObject>

@optional
- (void)loginOrRegister:({{args.Prefix}}MineHeaderInfoCell *)cell;

@end

@interface {{args.Prefix}}MineHeaderInfoCell : MCTableBaseCell

@property (nonatomic, weak) id<{{args.Prefix}}MineHeaderInfoCellDelegate> delegate;

@end
