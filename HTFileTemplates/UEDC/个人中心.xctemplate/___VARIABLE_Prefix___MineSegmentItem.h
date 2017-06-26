//
//  ___VARIABLE_Prefix:identifier___MineSegmentItem.h
//  ___VARIABLE_Prefix:identifier___
//
//  Created by Baitianyu on 25/05/2017.
//  Copyright © 2017 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ___VARIABLE_Prefix:identifier___MineSegmentItemType){
    ___VARIABLE_Prefix:identifier___MineSegmentItemTypeInvalid = 0,
    ___VARIABLE_Prefix:identifier___MineSegmentItemTypeFirst,
    ___VARIABLE_Prefix:identifier___MineSegmentItemTypeSecond,
    ___VARIABLE_Prefix:identifier___MineSegmentItemTypeThird
};

@class ___VARIABLE_Prefix:identifier___MineSegmentItem;

@protocol ___VARIABLE_Prefix:identifier___SegmentItemDelegate <NSObject>

@optional
- (void)segmentItemSelected:(___VARIABLE_Prefix:identifier___MineSegmentItem *)item type:(___VARIABLE_Prefix:identifier___MineSegmentItemType)type;

@end

@interface ___VARIABLE_Prefix:identifier___MineSegmentItem : UIView

@property (nonatomic, weak) id<___VARIABLE_Prefix:identifier___SegmentItemDelegate> delegate;
- (instancetype)initWithType:(___VARIABLE_Prefix:identifier___MineSegmentItemType)type iconName:(NSString *)iconName;

@end
