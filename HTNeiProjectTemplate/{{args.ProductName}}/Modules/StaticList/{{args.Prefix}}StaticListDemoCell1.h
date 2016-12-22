//
//  {{args.Prefix}}StaticListMCDemoCell1.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 12/16/2016.
//  Copyright © 2016 HT. All rights reserved.
//

#import "MCTableBaseCell.h"

@class {{args.Prefix}}StaticListDemoCell1;

@protocol {{args.Prefix}}StaticListDemoCell1Delegate <NSObject>

@required;
- (void)increaseBadgeCount:({{args.Prefix}}StaticListDemoCell1 *)cell;
- (void)decreaseBadgeCount:({{args.Prefix}}StaticListDemoCell1 *)cell;

@end

/**
 静态列表中，对 tabbar badge 加减操作的 cell
 */
@interface {{args.Prefix}}StaticListDemoCell1 : MCTableBaseCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIButton *actionButton;
@property (nonatomic, assign) BOOL actionIncrease; // 这里 button 如果选择较多可使用枚举
@property (nonatomic, weak) id<{{args.Prefix}}StaticListDemoCell1Delegate> delegate;

@end
