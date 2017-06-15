//
//  {{args.Prefix}}IconCell.h
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/5/2.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
@class {{args.Prefix}}IconCellModel;

@interface {{args.Prefix}}IconCell : UICollectionViewCell


@property(nonatomic, strong) UIImageView * imageView;
@property(nonatomic, strong) UILabel * namelabel;

@property(nonatomic, strong) {{args.Prefix}}IconCellModel * model;
@end
