//
//  {{args.Prefix}}TextSizeViewModel.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/20.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface {{args.Prefix}}TextSizeViewModel : NSObject

@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *tail;
@property (nonatomic, assign)CGFloat size;

+ (NSArray<{{args.Prefix}}TextSizeViewModel *> *)textSizeViewModels;

@end

