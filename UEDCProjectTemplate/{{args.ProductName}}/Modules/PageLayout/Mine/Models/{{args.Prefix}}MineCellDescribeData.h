//
//  {{args.Prefix}}MineCellDescribeData.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 17/05/2017.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "MCTableBaseDescribeData.h"
#import "{{args.Prefix}}MineSegmentCell.h"

@interface {{args.Prefix}}MineCellDescribeData : MCTableBaseDescribeData

@property (nonatomic, copy) NSString *headerIconName;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *userDesc;

@property (nonatomic, copy) NSString *iconName;
@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<NSString *> *segmentIconNames;
@property (nonatomic, weak) id<{{args.Prefix}}MineSegmentCellDelegate> delegate;

@end
