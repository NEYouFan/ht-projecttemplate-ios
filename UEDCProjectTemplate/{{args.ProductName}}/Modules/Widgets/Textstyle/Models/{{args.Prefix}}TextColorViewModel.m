//
//  {{args.Prefix}}TextColorViewModel.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/20.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}TextColorViewModel.h"


@implementation {{args.Prefix}}TextColorViewModel

+ (NSArray<{{args.Prefix}}TextColorViewModel *> *)textColorViewModels{
    NSArray *titles = @[@"一级标题",@"二级标题",@"正文文字",@"注释文字",@"链接文字",@"警告文字"];
    NSArray *colorStrings = @[@"#333333",@"#666666",@"#333333",@"#b2b2b2",@"#3377AA",@"#ee0000"];
    NSArray *colorValues = @[@(kFisrtClassTitleTextColor),
                             @(kSecondClassTitleTextColor),
                             @(kContentTextColor),
                             @(kCommitTextColor),
                             @(kLinkTextColor),
                             @(kWarningTextColor)
                             ];
    
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:5];
    
    for (int i = 0; i < [titles count]; i ++) {
        {{args.Prefix}}TextColorViewModel *model = [[{{args.Prefix}}TextColorViewModel alloc] init];
        model.title = titles[i];
        model.colorString = colorStrings[i];
        model.colorValue = [colorValues[i] unsignedIntValue];
        [result addObject:model];
    }
    return result;
}

@end
