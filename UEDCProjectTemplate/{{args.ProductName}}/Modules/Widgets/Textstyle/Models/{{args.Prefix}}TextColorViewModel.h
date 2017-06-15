//
//  {{args.Prefix}}TextColorViewModel.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/20.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface {{args.Prefix}}TextColorViewModel : NSObject

@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *colorString;
@property (nonatomic, assign) uint32_t colorValue;

+ (NSArray<{{args.Prefix}}TextColorViewModel *> *)textColorViewModels;

@end
