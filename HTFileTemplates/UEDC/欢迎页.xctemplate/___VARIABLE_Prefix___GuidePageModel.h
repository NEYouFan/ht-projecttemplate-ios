//
//  ___VARIABLE_Prefix:identifier___GuidePageModel.h
//  ___VARIABLE_Prefix:identifier___
//
//  Created by shoulei ma on 2017/5/26.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ___VARIABLE_Prefix:identifier___GuidePageItemType){
    ___VARIABLE_Prefix:identifier___GuidePageItemTypeInvalid = 0,
    ___VARIABLE_Prefix:identifier___GuidePageItemTypeFirst,
    ___VARIABLE_Prefix:identifier___GuidePageItemTypeSecond,
    ___VARIABLE_Prefix:identifier___GuidePageItemTypeThird
};

@interface ___VARIABLE_Prefix:identifier___GuidePageModel : NSObject

@property (nonatomic, assign) BOOL isShowButton;

@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subTitle;

@end
