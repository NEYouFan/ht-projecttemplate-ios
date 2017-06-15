//
//  {{args.Prefix}}ShareCollectionViewCell.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/16.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "{{args.Prefix}}ShareContentData.h"

@class {{args.Prefix}}ShareCollectionViewCell;

extern CGFloat const kShareCollectionCellHeight;

@protocol {{args.Prefix}}ShareCollectionViewCellDelegate <NSObject>

- (void)onClickShareItem:({{args.Prefix}}ShareCollectionViewCell *)cell;

@end

@interface {{args.Prefix}}ShareCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong){{args.Prefix}}ShareContentData *data;
@property (nonatomic, weak) id<{{args.Prefix}}ShareCollectionViewCellDelegate> delegate;

@end
