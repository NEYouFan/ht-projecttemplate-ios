//
//  {{args.Prefix}}Stepper.h
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/4/26.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
@class {{args.Prefix}}Stepper;
typedef void (^{{args.Prefix}}StepperValueChangedCallback)({{args.Prefix}}Stepper * stepper, int newValue);

@interface {{args.Prefix}}Stepper : UIControl
@property(nonatomic, copy) {{args.Prefix}}StepperValueChangedCallback valueChangedCallback;
@property(nonatomic, assign) int currentValue;
//圆角，默认为0
@property(nonatomic, assign) CGFloat radian;
@end
