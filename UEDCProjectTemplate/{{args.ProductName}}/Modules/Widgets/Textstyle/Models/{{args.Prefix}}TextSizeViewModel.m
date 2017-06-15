//
//  {{args.Prefix}}TextSizeViewModel.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/20.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}TextSizeViewModel.h"

@implementation {{args.Prefix}}TextSizeViewModel

+ (NSArray<{{args.Prefix}}TextSizeViewModel *> *)textSizeViewModels{
    NSArray *titles = @[@"一级标题",@"二级标题",@"一级正文",@"二级正文",@"注释文字"];
    NSArray *tails = @[@"18px",@"17px",@"16px",@"14px",@"11px、12px、13px、15px"];
    NSArray *sizes = @[@(kFirstClassContentFontSize),
                       @(kFirstClassContentFontSize),
                       @(kFirstClassContentFontSize),
                       @(kFirstClassContentFontSize),
                       @(kFirstClassContentFontSize),];
    
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:5];
    
    for (int i = 0; i < [titles count]; i ++) {
        {{args.Prefix}}TextSizeViewModel *model = [[{{args.Prefix}}TextSizeViewModel alloc] init];
        model.title = titles[i];
        model.tail = tails[i];
        model.size = [sizes[i] floatValue];
        [result addObject:model];
    }
    return result;
}

@end

