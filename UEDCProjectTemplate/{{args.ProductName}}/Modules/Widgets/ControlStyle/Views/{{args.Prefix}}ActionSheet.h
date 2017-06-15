//
//  {{args.Prefix}}ActionSheet.h
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/4/27.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@class {{args.Prefix}}ActionSheet;

typedef void (^{{args.Prefix}}ActionSheetSelectedCallBack)({{args.Prefix}}ActionSheet *actionSheet, NSInteger selectedIndex);

typedef void (^{{args.Prefix}}ActionSheetCancelCallBack)({{args.Prefix}}ActionSheet *actionSheet);


@interface {{args.Prefix}}ActionSheet : UIControl
@property(nonatomic, copy) {{args.Prefix}}ActionSheetSelectedCallBack selectedCallback;
@property(nonatomic, copy) {{args.Prefix}}ActionSheetCancelCallBack cancelCallBack;

- (instancetype)initWithCancelButtonTitle:(NSString *)cancelTitle otherButtonTitles:(NSArray <NSString *> *) otherTitles;

- (void)show;
- (void)hide;
@end
