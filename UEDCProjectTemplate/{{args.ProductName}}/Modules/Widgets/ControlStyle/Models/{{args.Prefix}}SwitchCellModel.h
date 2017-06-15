//
//  {{args.Prefix}}SwitchCellModel.h
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/4/27.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface {{args.Prefix}}SwitchCellModel : NSObject

@property(nonatomic, copy) NSString *title;
@property(nonatomic, assign) BOOL isOpen;
@property(nonatomic, assign) float sliderValue;

+(NSArray<NSArray<{{args.Prefix}}SwitchCellModel *> *>*)switchCellModels;

-(instancetype)initWithTitle:(NSString *)title isOpen:(BOOL)isOpen sliderValue:(float)value;

@end
