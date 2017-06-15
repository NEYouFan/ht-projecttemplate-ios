//
//  {{args.Prefix}}SwitchCellModel.m
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/4/27.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}SwitchCellModel.h"

@implementation {{args.Prefix}}SwitchCellModel

+(NSArray<NSArray<{{args.Prefix}}SwitchCellModel *> *>*)switchCellModels{
    
    {{args.Prefix}}SwitchCellModel * model1 = [[{{args.Prefix}}SwitchCellModel alloc]initWithTitle:@"功能一" isOpen:YES sliderValue:0];
    {{args.Prefix}}SwitchCellModel * model2 = [[{{args.Prefix}}SwitchCellModel alloc]initWithTitle:@"功能二" isOpen:NO sliderValue:0];
    {{args.Prefix}}SwitchCellModel * model3 = [[{{args.Prefix}}SwitchCellModel alloc]initWithTitle:@"字体大小" isOpen:NO sliderValue:0.5];
    {{args.Prefix}}SwitchCellModel * model4 = [[{{args.Prefix}}SwitchCellModel alloc]initWithTitle:@"页面亮度" isOpen:NO sliderValue:0.25];
    return  @[@[model1,model2],@[model3,model4]];

}

-(instancetype)initWithTitle:(NSString *)title isOpen:(BOOL)isOpen sliderValue:(float)value{
    self = [super init];
    if (self) {
        _title = title;
        _isOpen = isOpen;
        _sliderValue = value;
    }
    return self;
}
@end
