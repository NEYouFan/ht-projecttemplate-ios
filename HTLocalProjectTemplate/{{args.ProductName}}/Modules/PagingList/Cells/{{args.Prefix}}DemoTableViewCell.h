//
//  {{args.Prefix}}DemoTableViewCell.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 2017/3/24.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@class {{args.Prefix}}Product;

@interface {{args.Prefix}}DemoTableViewCell : UITableViewCell

@property (nonatomic, strong) {{args.Prefix}}Product *model;

@end
