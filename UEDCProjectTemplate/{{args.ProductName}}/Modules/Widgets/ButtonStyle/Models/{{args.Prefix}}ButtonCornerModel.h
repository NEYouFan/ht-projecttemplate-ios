//
//  {{args.Prefix}}ButtonCornerModel.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/21.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface {{args.Prefix}}ButtonCornerModel : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) uint32_t textColor;
@property (nonatomic, assign) uint32_t backgroundColor;
@property (nonatomic, assign) CGFloat alpha;
@property (nonatomic, assign) CGFloat cornerRadius;

+ (NSArray <{{args.Prefix}}ButtonCornerModel *> *)rightAngleButtonModels;
+ (NSArray <{{args.Prefix}}ButtonCornerModel *> *)roundCornerButtonModels;


@end
