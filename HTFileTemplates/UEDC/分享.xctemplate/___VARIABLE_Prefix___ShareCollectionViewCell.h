//
//  ___VARIABLE_Prefix:identifier___ShareCollectionViewCell.h
//  ___VARIABLE_Prefix:identifier___
//
//  Created by 陶泽宇 on 2017/5/16.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "___VARIABLE_Prefix:identifier___ShareContentData.h"

@class ___VARIABLE_Prefix:identifier___ShareCollectionViewCell;

extern CGFloat const kShareCollectionCellHeight;

@protocol ___VARIABLE_Prefix:identifier___ShareCollectionViewCellDelegate <NSObject>

- (void)onClickShareItem:(___VARIABLE_Prefix:identifier___ShareCollectionViewCell *)cell;

@end

@interface ___VARIABLE_Prefix:identifier___ShareCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong)___VARIABLE_Prefix:identifier___ShareContentData *data;
@property (nonatomic, weak) id<___VARIABLE_Prefix:identifier___ShareCollectionViewCellDelegate> delegate;

@end
