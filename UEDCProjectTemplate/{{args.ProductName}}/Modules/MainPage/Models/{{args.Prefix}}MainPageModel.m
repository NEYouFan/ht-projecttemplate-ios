//
//  {{args.Prefix}}MainPageModel.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/19.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}MainPageModel.h"

@implementation {{args.Prefix}}MainPageModel

@end

@implementation {{args.Prefix}}MainPageModelGenerator

+ ({{args.Prefix}}MainPageModel *)textPageModel{
    {{args.Prefix}}MainPageModel *model = [[{{args.Prefix}}MainPageModel alloc] init];
    model.sectionTitles = @[@"文字",
                            ];
    
    model.sectionIcons = @[@"mainPage_text",
                            ];
    
    model.sectionCellNames = @[@[@"iOS默认字体",@"字体大小",@"字体颜色"],
                               ];
    
    model.sectionCellUrls = @[@[@"{{args.Prefix}}://iOS_textStyle", @"{{args.Prefix}}://textSize", @"{{args.Prefix}}://textColor"],
                              ];
    return model;

}

+ ({{args.Prefix}}MainPageModel *)widgetsPageModel{
    {{args.Prefix}}MainPageModel *model = [[{{args.Prefix}}MainPageModel alloc] init];
    model.sectionTitles = @[
                            @"按钮",
                            @"搜索框",
                            @"弹窗",
                            @"通知",
                            @"工具栏",
                            @"底部标签栏",
                            @"导航栏",
                            @"表单控件",
                            @"控制控件",
                            @"筛选控件",
                            @"下拉框控件",
                            @"进度条控件",
                            ];
    
    model.sectionIcons = @[
                           @"mainPage_btn",
                           @"mainPage_search",
                           @"mainPage_alert",
                           @"mainPage_notification",
                           @"mainPage_tools",
                           @"mainPage_bottom",
                           @"mainPage_navi",
                           @"mainPage_sheet",
                           @"mainPage_control",
                           @"mainPage_sort",
                           @"mainPage_pullDown",
                           @"mainPage_progress",
                           ];
    
    model.sectionCellNames = @[
                               @[@"直角与圆角按钮",@"icon+文字的按钮",@"左滑出现的按钮"],
                               @[@"搜索框的配置"],
                               @[@"选择型弹窗",@"内容型弹窗",@"出错型弹窗"],
                               @[@"Toast",@"条幅式通知",@"icon右上角红点通知",@"弹出式通知"],
                               @[@"工具栏"],
                               @[@"底部标签栏"],
                               @[@"导航栏"],
                               @[@"文本框控件",@"单选框、复选框"],
                               @[@"进步器",@"上拉菜单",@"开关、滑块控件",@"刷新控件"],
                               @[@"选择器控件"],
                               @[@"下拉控件"],
                               @[@"网页加载进度条",@"上传下载进度条"],
                               ];
    
    model.sectionCellUrls = @[
                              @[@"{{args.Prefix}}://buttonCorner",@"{{args.Prefix}}://IconButton",@"{{args.Prefix}}://leftPanButton"],
                              @[@"{{args.Prefix}}://search"],
                              @[@"{{args.Prefix}}://customAlertView",@"{{args.Prefix}}://InputAlertView",@"{{args.Prefix}}://warningAlertView"],
                              @[@"{{args.Prefix}}://toast",@"{{args.Prefix}}://ScrollNotification",@"{{args.Prefix}}://badgeTabBar",@"{{args.Prefix}}://contentAlertView"],
                              @[@"{{args.Prefix}}://ToolTabBar"],
                              @[@"{{args.Prefix}}://IconTabBar"],
                              @[@"{{args.Prefix}}://NaviSegments"],
                              @[@"{{args.Prefix}}://textField",@"{{args.Prefix}}://checkbox"],
                              @[@"{{args.Prefix}}://stepper",@"{{args.Prefix}}://actionSheet",@"{{args.Prefix}}://switch",@"{{args.Prefix}}://refresh"],
                              @[@"{{args.Prefix}}://picker"],
                              @[@"{{args.Prefix}}://drawer"],
                              @[@"{{args.Prefix}}://webProgress",@"{{args.Prefix}}://progress"],

                              ];
    return model;

}

+ ({{args.Prefix}}MainPageModel *)iconsPageModel{
    {{args.Prefix}}MainPageModel *model = [[{{args.Prefix}}MainPageModel alloc] init];
    model.sectionTitles = @[@"图标",
                            ];
    
    model.sectionIcons = @[@"mainPage_icon",
                           ];
    
    model.sectionCellNames = @[@[@"常用图标"],
                               ];
    
    model.sectionCellUrls = @[@[@"{{args.Prefix}}://icons"],
                              ];
    return model;
}

+ ({{args.Prefix}}MainPageModel *)layoutPageModel{
    {{args.Prefix}}MainPageModel *model = [[{{args.Prefix}}MainPageModel alloc] init];
    model.sectionTitles = @[@"页面布局篇"];
    
    model.sectionIcons = @[@"mainPage_pagelayout"];
    
    model.sectionCellNames = @[@[@"注册页面布局",
                                 @"登录页面布局",
                                 @"设置页面布局",
                                 @"开机引导页面布局",
                                 @"个人中心页面布局",
                                 @"空状态页面布局",
                                 @"扫一扫页面布局",
                                 @"分享页面布局",
                                 @"手势密码设置",
                                 @"照片选择页布局",
                                 @"拍照页面布局",
                                 @"列表页面布局"],
                               ];
    
    model.sectionCellUrls = @[@[@"{{args.Prefix}}://register",
                                @"{{args.Prefix}}://login",
                                @"{{args.Prefix}}://setting",
                                @"{{args.Prefix}}://guidepage",
                                @"{{args.Prefix}}://mine",
                                @"{{args.Prefix}}://empty",
                                @"{{args.Prefix}}://qrcodescan",
                                @"{{args.Prefix}}://shareKit",
                                @"{{args.Prefix}}://gesturePassword",
                                @"{{args.Prefix}}://photoChoose",
                                @"{{args.Prefix}}://camera",
                                @"{{args.Prefix}}://listLayout"],
                              ];
    return model;
}

@end
