//
//  UDECShareContentData.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/16.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface {{args.Prefix}}ShareContentData : NSObject

@property(nonatomic, copy) NSString *title;
@property(nonatomic, strong) UIImage *image;
@property(nonatomic, strong) UIImage *imagePressed;

@end
