//
//  {{args.Prefix}}StaticListDemoCell2.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 12/16/2016.
//  Copyright © 2016 HT. All rights reserved.
//

#import "MCTableBaseCell.h"

@class {{args.Prefix}}StaticListDemoCell2;

@protocol {{args.Prefix}}StaticListDemoCell2Delegate <NSObject>

@required;
- (void)switchStatusChanged:({{args.Prefix}}StaticListDemoCell2 *)cell;

@end

/**
 静态列表中开关 tabbar badge 的 cell
 */
@interface {{args.Prefix}}StaticListDemoCell2 : MCTableBaseCell

@property (nonatomic, strong) UIImageView *headerIconImageView;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UISwitch *rightSwitchButton;
@property (nonatomic, weak) id<{{args.Prefix}}StaticListDemoCell2Delegate> delegate;

@end
