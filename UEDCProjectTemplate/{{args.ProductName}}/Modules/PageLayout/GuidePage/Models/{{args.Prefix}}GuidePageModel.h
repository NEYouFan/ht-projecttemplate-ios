//
//  {{args.Prefix}}GuidePageModel.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/26.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, {{args.Prefix}}GuidePageItemType){
    {{args.Prefix}}GuidePageItemTypeInvalid = 0,
    {{args.Prefix}}GuidePageItemTypeFirst,
    {{args.Prefix}}GuidePageItemTypeSecond,
    {{args.Prefix}}GuidePageItemTypeThird
};

@interface {{args.Prefix}}GuidePageModel : NSObject

@property (nonatomic, assign) BOOL isShowButton;

@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subTitle;

@end
