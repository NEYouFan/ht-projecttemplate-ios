//
//  {{args.Prefix}}MainPageModel.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/19.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface {{args.Prefix}}MainPageModel : NSObject

@property (nonatomic, copy) NSArray *sectionTitles;
@property (nonatomic, copy) NSArray *sectionIcons;
@property (nonatomic, copy) NSArray <NSArray *>* sectionCellNames;
@property (nonatomic, copy) NSArray <NSArray *>* sectionCellUrls;

@end

@interface {{args.Prefix}}MainPageModelGenerator : NSObject

+ ({{args.Prefix}}MainPageModel *)textPageModel;
+ ({{args.Prefix}}MainPageModel *)widgetsPageModel;
+ ({{args.Prefix}}MainPageModel *)iconsPageModel;
+ ({{args.Prefix}}MainPageModel *)layoutPageModel;


@end
