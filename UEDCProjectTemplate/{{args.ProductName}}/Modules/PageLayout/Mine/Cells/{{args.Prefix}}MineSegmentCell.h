//
//  {{args.Prefix}}MineSegmentCell.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 17/05/2017.
//  Copyright © 2017 Netease. All rights reserved.
//

#import <HTMultiCellTypeTableViewObjc/MCTableBaseCell.h>

@class {{args.Prefix}}MineSegmentCell;

@protocol {{args.Prefix}}MineSegmentCellDelegate <NSObject>

@optional
/// 请根据各自业务命名
- (void)firstSegmentClicked:({{args.Prefix}}MineSegmentCell *)cell;
- (void)secondSegmentClicked:({{args.Prefix}}MineSegmentCell *)cell;
- (void)thirdSegmentClicked:({{args.Prefix}}MineSegmentCell *)cell;

@end

@interface {{args.Prefix}}MineSegmentCell : MCTableBaseCell

@property (nonatomic, weak) id<{{args.Prefix}}MineSegmentCellDelegate> delegate;

@end
