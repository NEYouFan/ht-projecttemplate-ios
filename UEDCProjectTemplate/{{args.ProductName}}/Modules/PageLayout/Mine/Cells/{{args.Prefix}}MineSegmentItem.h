//
//  {{args.Prefix}}MineSegmentItem.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 25/05/2017.
//  Copyright © 2017 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, {{args.Prefix}}MineSegmentItemType){
    {{args.Prefix}}MineSegmentItemTypeInvalid = 0,
    {{args.Prefix}}MineSegmentItemTypeFirst,
    {{args.Prefix}}MineSegmentItemTypeSecond,
    {{args.Prefix}}MineSegmentItemTypeThird
};

@class {{args.Prefix}}MineSegmentItem;

@protocol {{args.Prefix}}SegmentItemDelegate <NSObject>

@optional
- (void)segmentItemSelected:({{args.Prefix}}MineSegmentItem *)item type:({{args.Prefix}}MineSegmentItemType)type;

@end

@interface {{args.Prefix}}MineSegmentItem : UIView

@property (nonatomic, weak) id<{{args.Prefix}}SegmentItemDelegate> delegate;
- (instancetype)initWithType:({{args.Prefix}}MineSegmentItemType)type iconName:(NSString *)iconName;

@end
