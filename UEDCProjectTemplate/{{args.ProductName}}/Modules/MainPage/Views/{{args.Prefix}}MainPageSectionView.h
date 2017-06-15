//
//  {{args.Prefix}}MainPageSectionView.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/19.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol {{args.Prefix}}MainPageSectionViewDelegate <NSObject>


/**
 点击到View上的CELL button

 @param url 传出跳转的目标routerURL
 */
- (void)jumpWithRouterURL:(NSString *)url;

@end

@interface {{args.Prefix}}MainPageSectionView : UIView

@property (nonatomic, weak) id <{{args.Prefix}}MainPageSectionViewDelegate> delegate;

/**
 初始化生成SectionView， View的高度会根据传入的参数自动计算

 @param title Section 标题
 @param iconName 图标的名称
 @param cellNames 每个cell的展示名称
 @param urls 每个cell点击之后的跳转routerURL
 @return SectionView
 */
- (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                    cellNames:(NSArray<NSString *> *)cellNames
                   routerURLs:(NSArray<NSString *> *)urls;




@end
