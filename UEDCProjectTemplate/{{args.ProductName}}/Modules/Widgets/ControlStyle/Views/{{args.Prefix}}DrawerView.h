//
//  {{args.Prefix}}DrawerView.h
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/5/2.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
@class {{args.Prefix}}DrawerView;

typedef void (^{{args.Prefix}}DrawerViewSelectedCallback)({{args.Prefix}}DrawerView * draeweView,NSInteger selectedIndex);

@interface {{args.Prefix}}DrawerView : UIControl

@property(nonatomic, copy) {{args.Prefix}}DrawerViewSelectedCallback selectedCallback;
@property(nonatomic, strong) UIButton *titleButton;
-(instancetype)initWithDefaultIndex:(NSInteger)defaultIndex titles:(NSArray <NSString*>*)titles;
@end
