//
//  {{args.Prefix}}ListLayoutCellDescribeData.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 17/05/2017.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "MCTableBaseDescribeData.h"

@interface {{args.Prefix}}ListLayoutCellDescribeData : MCTableBaseDescribeData

@property (nonatomic, copy) NSString *leftIconName;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) NSString *rightIconName;

@end
