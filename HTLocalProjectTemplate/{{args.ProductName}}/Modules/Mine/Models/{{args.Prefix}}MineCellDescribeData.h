//
//  {{args.Prefix}}MineCellDescribeData.h
//  TestNei
//
//  Created by {{args.Author}} on 19/10/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "MCTableBaseDescribeData.h"
#import "{{args.Prefix}}MineHeaderInfoCell.h"

@interface {{args.Prefix}}MineCellDescribeData : MCTableBaseDescribeData

@property (nonatomic, copy) NSString *iconName;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, weak) id<{{args.Prefix}}MineHeaderInfoCellDelegate> delegate;

@end
