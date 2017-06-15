//
//  {{args.Prefix}}IconCellModel.h
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/5/2.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface {{args.Prefix}}IconCellModel : NSObject

@property(nonatomic, copy) NSString *imageName;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) NSInteger index;

+(NSArray<{{args.Prefix}}IconCellModel *>*)iconCellModels;
@end
