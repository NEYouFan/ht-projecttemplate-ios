//
//  {{args.Prefix}}MainPageCellButton.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/19.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface {{args.Prefix}}MainPageCellButton : UIButton

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) NSString *routerURL;

@end
