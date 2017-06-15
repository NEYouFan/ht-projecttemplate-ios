//
//  {{args.Prefix}}GuidePageView.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/26.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "{{args.Prefix}}GuidePageModel.h"

@class {{args.Prefix}}GuidePageView;

@protocol {{args.Prefix}}GuidePageViewDelegate <NSObject>

@optional
- (void)enterButtonClicked:({{args.Prefix}}GuidePageView *)view type:({{args.Prefix}}GuidePageItemType)type;

@end

@interface {{args.Prefix}}GuidePageView : UIView

@property (nonatomic, weak) id<{{args.Prefix}}GuidePageViewDelegate> delegate;

@property (nonatomic, strong) NSArray <{{args.Prefix}}GuidePageModel *>*models;

@end
