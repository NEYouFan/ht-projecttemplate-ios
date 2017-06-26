//
//  ___VARIABLE_Prefix:identifier___MineSegmentCell.h
//  ___VARIABLE_Prefix:identifier___
//
//  Created by Baitianyu on 17/05/2017.
//  Copyright © 2017 Netease. All rights reserved.
//

#import <HTMultiCellTypeTableViewObjc/MCTableBaseCell.h>

@class ___VARIABLE_Prefix:identifier___MineSegmentCell;

@protocol ___VARIABLE_Prefix:identifier___MineSegmentCellDelegate <NSObject>

@optional
/// 请根据各自业务命名
- (void)firstSegmentClicked:(___VARIABLE_Prefix:identifier___MineSegmentCell *)cell;
- (void)secondSegmentClicked:(___VARIABLE_Prefix:identifier___MineSegmentCell *)cell;
- (void)thirdSegmentClicked:(___VARIABLE_Prefix:identifier___MineSegmentCell *)cell;

@end

@interface ___VARIABLE_Prefix:identifier___MineSegmentCell : MCTableBaseCell

@property (nonatomic, weak) id<___VARIABLE_Prefix:identifier___MineSegmentCellDelegate> delegate;

@end
