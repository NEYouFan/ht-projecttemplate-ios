//
//  {{args.Prefix}}NotificationCenter.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 06/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 用于统一处理全局通知的类。
 
 为防止全局通知使用过于混乱，这里提供一个统一管理的类。建议为每个 NotificationCenter 的通知在这里编写一个类方法来发送。下面给出了一个例子。
 */
@interface {{args.Prefix}}NotificationCenter : NSObject

///  示例方法，发送一个 notification1 的通知
+ (void)postNotification1WithObject:(id)anObject;

@end
