//
//  ___VARIABLE_Prefix:identifier___Circle.h
//  ___VARIABLE_Prefix:identifier___
//
//  Created by 陶泽宇 on 2017/5/26.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <UIKit/UIKit.h>

/**
 *  单个圆的各种状态
 */
typedef enum{
    CircleStateNormal = 1,
    CircleStateSelected,
    CircleStateError,
    CircleStateLastOneSelected,
    CircleStateLastOneError
}CircleState;

/**
 *  单个圆的用途类型
 */
typedef enum
{
    CircleTypeInfo = 1,
    CircleTypeGesture
}CircleType;


@interface ___VARIABLE_Prefix:identifier___Circle : UIView

/**
 *  所处的状态
 */
@property (nonatomic, assign) CircleState state;

/**
 *  类型
 */
@property (nonatomic, assign) CircleType type;

/**
 *  是否有箭头 default is YES
 */
@property (nonatomic, assign) BOOL arrow;

/** 角度 */
@property (nonatomic,assign) CGFloat angle;

@end
