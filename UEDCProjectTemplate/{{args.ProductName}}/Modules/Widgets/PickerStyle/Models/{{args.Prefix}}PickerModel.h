//
//  {{args.Prefix}}PickerModel.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/27.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension.h>

@class {{args.Prefix}}Province, {{args.Prefix}}City, {{args.Prefix}}District;

@interface {{args.Prefix}}PickerModel : NSObject

/**
 *  省份模型数组
 */
@property (nonatomic, strong) NSArray<{{args.Prefix}}Province *> *province;

@end

@interface {{args.Prefix}}Province : NSObject
/**
 *  省份名字
 */
@property (nonatomic, copy) NSString *name;
/**
 *  城市模型数组
 */
@property (nonatomic, strong) NSArray<{{args.Prefix}}City *> *city;

@end

@interface {{args.Prefix}}City : NSObject
/**
 *  城市名字
 */
@property (nonatomic, copy) NSString *name;
/**
 *  县级模型数组
 */
@property (nonatomic, strong) NSArray<{{args.Prefix}}District *> *district;

@end

@interface {{args.Prefix}}District : NSObject
/**
 *  县级名字
 */
@property (nonatomic, copy) NSString *name;
/**
 *  邮编
 */
@property (nonatomic, copy) NSString *zipcode;

@end
