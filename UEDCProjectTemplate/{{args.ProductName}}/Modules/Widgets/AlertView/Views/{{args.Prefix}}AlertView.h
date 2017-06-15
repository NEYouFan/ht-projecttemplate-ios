//
//  {{args.Prefix}}AlertView.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/4.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickBlock)(NSUInteger buttonIndex);
typedef void(^InputTextBlock)(NSUInteger buttonIndex, NSString *inputText);

#define alertViewWidth SCREEN_WIDTH - 60

@interface {{args.Prefix}}AlertView : UIView

+ (instancetype)sharedInstance;

@property(nonatomic,copy)UIColor *alertBackgroundColor;/** 设置alertView背景色 */
@property(nonatomic,copy)UIColor *buttonTitleColor;/** 设置按钮文字色 */
@property(nonatomic,copy)UIColor *maskBackgroundColor;/** 设置遮罩的颜色 */

/**
 自定义alertView，并且显示到屏幕的正中央

 @param view 自定义的alertView的上方的View
 @param buttonTitles alertView下方button的title数组，传入几个title，代表有几个button
 @param block 点击button之后的回调，通过buttonIndex来判断是点击了哪个button
 */
- (void)alertWithCustomView:(UIView *)view
               buttonTitles:(NSArray <NSString *> *)buttonTitles
                   andBlock:(ClickBlock)block;

/**
 展示没有title 仅有content的最基本的alertView
 
 @param content  alertView中部的内容
 @param buttonTitles alertView下方button的title数组，传入几个title，代表有几个button
 @param block 点击button之后的回调，通过buttonIndex来判断是点击了哪个button
 */
- (void)alertWithContent:(NSString *)content
            buttonTitles:(NSArray <NSString *> *)buttonTitles
                andBlock:(ClickBlock)block;


/**
 展示有title 有content的最基本的alertView
 
 @param title alertView最上方的title
 @param content  alertView中部的内容
 @param buttonTitles alertView下方button的title数组，传入几个title，代表有几个button
 @param block 点击button之后的回调，通过buttonIndex来判断是点击了哪个button
 */
- (void)alertWithTitle:(NSString *)title
               content:(NSString *)content
          buttonTitles:(NSArray <NSString *> *)buttonTitles
              andBlock:(ClickBlock)block;


/**
 展示顶部中央为一个图标，中间为content文字样式的alertView

 @param image 图标image
 @param content content文字内容
 @param buttonTitles alertView下方button的title数组，传入几个title，代表有几个button
 @param block 点击button之后的回调，通过buttonIndex来判断是点击了哪个button
 */
- (void)alertWithIconImage:(UIImage *)image
                   content:(NSString *)content
              buttonTitles:(NSArray <NSString *> *)buttonTitles
                  andBlock:(ClickBlock)block;


/**
 展示中间是一个输入框形式的alertView
 
 @param title alertView的title
 @param placeholderText alertView 输入框 placeholder的内容
 @param buttonTitles alertView下方button的title数组，传入几个title，代表有几个button
 @param block 点击button之后的回调，通过buttonIndex来判断是点击了哪个button，inputText来获取输入的字符串
 */
- (void)alertWithInputTitle:(NSString *)title
            placeholderText:(NSString *)placeholderText
               buttonTitles:(NSArray <NSString *> *)buttonTitles
              andInputBlock:(InputTextBlock)block;
@end
