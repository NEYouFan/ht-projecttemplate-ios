//
//  {{args.Prefix}}PickerModel.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/27.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}PickerModel.h"

@implementation {{args.Prefix}}PickerModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"province" : [{{args.Prefix}}Province class]};
}

@end

@implementation {{args.Prefix}}Province

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"city" : [{{args.Prefix}}City class]};
}

@end

@implementation {{args.Prefix}}City

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"district" : [{{args.Prefix}}District class]};
}

@end

@implementation {{args.Prefix}}District

@end

