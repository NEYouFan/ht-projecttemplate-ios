//
//  {{args.Prefix}}IconCellModel.m
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/5/2.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}IconCellModel.h"

@implementation {{args.Prefix}}IconCellModel

+(NSArray<{{args.Prefix}}IconCellModel *> *)iconCellModels{
    NSMutableArray * models = [NSMutableArray new];
    NSArray * names = @[@"订单",@"好友",@"文件",@"发现",@"客服",@"评价",@"搜索",@"喜欢",@"点赞",@"消息",@"图片",@"通讯录",@"主页",@"我的",@"设置",@"删除",@"返回",@"电话",@"添加",@"收藏",@"日历",@"购物车",@"分享",@"更多",@"帮助",@"上传",@"下载",@"雷达",@"扫一扫"];
    
    for (int i = 0; i<names.count;  i++ ) {
        {{args.Prefix}}IconCellModel * model = [[{{args.Prefix}}IconCellModel alloc]init];
        model.name = names[i];
        [models addObject:model];
    }
    return models;
}

-(void)setIndex:(NSInteger)index{
    _index = index;
    self.imageName = [NSString stringWithFormat:@"widget_icon_%li",(long)index];
}
@end
