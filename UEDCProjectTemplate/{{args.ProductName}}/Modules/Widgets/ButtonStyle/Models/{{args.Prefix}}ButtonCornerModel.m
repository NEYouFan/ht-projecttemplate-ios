//
//  {{args.Prefix}}ButtonCornerModel.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/21.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}ButtonCornerModel.h"

@implementation {{args.Prefix}}ButtonCornerModel

+ (NSArray <{{args.Prefix}}ButtonCornerModel *> *)rightAngleButtonModels{
    NSArray *texts = @[@"直角按钮 Normal",@"直角按钮 Loading",@"直角按钮 Disabled",@"直角按钮 Normal",@"直角按钮 Loading",@"直角按钮 Disabled"];
    NSArray *textColors = @[@(kWhitheTextColor),@(kWhitheTextColor),@(kWhitheTextColor),@(kContentTextColor),@(kContentTextColor),@(kLightTextColor)];
    NSArray *backgroundColors =  @[@(kDefaultButtonColor),@(kDefaultButtonHighlightColor),@(kDefaultButtonHighlightColor),@(kWhiteButtonColor),@(kWhiteButtonColor),@(kWhiteButtonColor)];
    NSArray *alphas = @[@(1.0),@(1.0),@(0.5),@(1.0),@(1.0),@(0.5)];
    
    NSMutableArray *result =  [[NSMutableArray alloc] initWithCapacity:6];
    for (int i = 0; i < [texts count]; i++) {
        {{args.Prefix}}ButtonCornerModel *model = [[{{args.Prefix}}ButtonCornerModel alloc] init];
        model.text = texts[i];
        model.textColor = [textColors[i] unsignedIntValue];
        model.backgroundColor = [backgroundColors[i] unsignedIntValue];
        model.alpha = [alphas[i] floatValue];
        model.cornerRadius = 0;
        [result addObject:model];
    }
    return result;
}

+ (NSArray <{{args.Prefix}}ButtonCornerModel *> *)roundCornerButtonModels{
    NSArray *texts = @[@"2px圆角按钮",@"8px圆角按钮",@"16px圆角按钮",@"圆形按钮",@"2px圆角按钮",@"8px圆角按钮",@"16px圆角按钮",@"圆形按钮"];
    NSArray *textColors = @[@(kWhitheTextColor),@(kWhitheTextColor),@(kWhitheTextColor),@(kWhitheTextColor),@(kContentTextColor),@(kContentTextColor),@(kContentTextColor),@(kContentTextColor)];
    NSArray *backgroundColors =  @[@(kDefaultButtonColor),@(kDefaultButtonColor),@(kDefaultButtonColor),@(kDefaultButtonColor),@(kWhiteButtonColor),@(kWhiteButtonColor),@(kWhiteButtonColor),@(kWhiteButtonColor)];
    NSArray *cornerRadius = @[@(1),@(4),@(8),@(22.5),@(1),@(4),@(8),@(22.5)];
    
    NSMutableArray *result =  [[NSMutableArray alloc] initWithCapacity:6];
    for (int i = 0; i < [texts count]; i++) {
        {{args.Prefix}}ButtonCornerModel *model = [[{{args.Prefix}}ButtonCornerModel alloc] init];
        model.text = texts[i];
        model.textColor = [textColors[i] unsignedIntValue];
        model.backgroundColor = [backgroundColors[i] unsignedIntValue];
        model.alpha = 1.0;
        model.cornerRadius = [cornerRadius[i] floatValue];
        [result addObject:model];
    }
    return result;

}
@end
