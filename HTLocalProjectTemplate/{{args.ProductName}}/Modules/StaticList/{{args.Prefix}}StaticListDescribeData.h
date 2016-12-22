//
//  {{args.Prefix}}StaticListDescribeData.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 12/16/2016.
//  Copyright © 2016 HT. All rights reserved.
//

#import "MCTableBaseDescribeData.h"
#import "{{args.Prefix}}StaticListDemoCell2.h"
#import "{{args.Prefix}}StaticListDemoCell1.h"

@interface {{args.Prefix}}StaticListDescribeData : MCTableBaseDescribeData

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) BOOL switchStatus;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *headerIconName;
@property (nonatomic, copy) NSString *actionButtonTitle;
@property (nonatomic, assign) BOOL actionIncrease; // 这里 button 如果选择较多可使用枚举

@property (nonatomic, weak) id<{{args.Prefix}}StaticListDemoCell2Delegate> cell2Delegate;
@property (nonatomic, weak) id<{{args.Prefix}}StaticListDemoCell1Delegate> cell1Delegate;

@end
