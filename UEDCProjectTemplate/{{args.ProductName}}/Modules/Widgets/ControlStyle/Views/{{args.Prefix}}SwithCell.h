//
//  {{args.Prefix}}SwithCell.h
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/4/27.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
@class {{args.Prefix}}SwitchCellModel;
@class {{args.Prefix}}Slider;

@interface {{args.Prefix}}SwithCell : UITableViewCell

@property(nonatomic, strong) UISwitch * switchWidget;
@property(nonatomic, strong) UILabel * titleLabel;
@property(nonatomic, strong) {{args.Prefix}}Slider * slider;
@property(nonatomic, strong) {{args.Prefix}}SwitchCellModel *model;

@end
