//
//  ___VARIABLE_Prefix:identifier___MineCellDescribeData.h
//  ___VARIABLE_Prefix:identifier___
//
//  Created by Baitianyu on 17/05/2017.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "MCTableBaseDescribeData.h"
#import "___VARIABLE_Prefix:identifier___MineSegmentCell.h"

@interface ___VARIABLE_Prefix:identifier___MineCellDescribeData : MCTableBaseDescribeData

@property (nonatomic, copy) NSString *headerIconName;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *userDesc;

@property (nonatomic, copy) NSString *iconName;
@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<NSString *> *segmentIconNames;
@property (nonatomic, weak) id<___VARIABLE_Prefix:identifier___MineSegmentCellDelegate> delegate;

@end
