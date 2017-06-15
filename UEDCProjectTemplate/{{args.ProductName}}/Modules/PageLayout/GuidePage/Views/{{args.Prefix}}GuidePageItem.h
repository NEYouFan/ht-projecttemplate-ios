//
//  {{args.Prefix}}GuidePageItemView.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/26.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "{{args.Prefix}}GuidePageModel.h"

@class {{args.Prefix}}GuidePageItem;

@protocol {{args.Prefix}}GuidePageItemDelegate <NSObject>

@optional
- (void)guidePageButtonClicked:({{args.Prefix}}GuidePageItem *)item type:({{args.Prefix}}GuidePageItemType)type;

@end

@interface {{args.Prefix}}GuidePageItem : UIView

@property (nonatomic, weak) id<{{args.Prefix}}GuidePageItemDelegate> delegate;

- (instancetype)initWithType:({{args.Prefix}}GuidePageItemType)type model:({{args.Prefix}}GuidePageModel *)model;

@end
