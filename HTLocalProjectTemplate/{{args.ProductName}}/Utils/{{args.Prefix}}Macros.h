//
//  {{args.Prefix}}Macros.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 06/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#ifndef {{args.Prefix}}Macros_h
#define {{args.Prefix}}Macros_h

/// 使用 PerformSelector 时忽略编译器的泄露警告
#define {{args.Prefix}}IgnorePerformSelectorLeakWarning(PerformSelectorCode) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
PerformSelectorCode; \
_Pragma("clang diagnostic pop") \
} while(0)

/// 弱引用 self
#define {{args.Prefix}}Weak(self) autoreleasepool{} __weak typeof(self) weakSelf = self;

/// 判断版本
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define IOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0 && [[UIDevice currentDevice].systemVersion doubleValue] < 9.0)
#define IOS8_10 ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 8.0 && [[UIDevice currentDevice].systemVersion doubleValue] < 10.0)
#define IOS10 ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 10.0)

#endif /* {{args.Prefix}}Macros_h */
