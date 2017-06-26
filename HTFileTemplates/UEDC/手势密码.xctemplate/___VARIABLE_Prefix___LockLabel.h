//
//  ___VARIABLE_Prefix:identifier___LockLabel.h
//  ___VARIABLE_Prefix:identifier___
//
//  Created by 陶泽宇 on 2017/5/26.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ___VARIABLE_Prefix:identifier___LockLabel : UILabel

/*
 *  普通提示信息
 */
-(void)showNormalMsg:(NSString *)msg;


/*
 *  警示信息
 */
-(void)showWarnMsg:(NSString *)msg;

/*
 *  警示信息(shake)
 */
-(void)showWarnMsgAndShake:(NSString *)msg;

@end
