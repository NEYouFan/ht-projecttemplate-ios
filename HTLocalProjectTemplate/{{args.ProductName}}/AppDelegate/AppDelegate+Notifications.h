//
//  AppDelegate+Notifications.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 13/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "AppDelegate.h"

/**
 注册本地和远程通知的代码，只需要根据需求做适当改变即可。无需用户再次手写。
 */
@interface AppDelegate (Notifications)

- (void)registerRemoteNotifications;

@end
