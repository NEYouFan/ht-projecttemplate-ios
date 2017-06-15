//
//  {{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 05/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "ColorUtils.h"
#import "UIViewController+HTRouterUtils.h"
#import "{{args.Prefix}}ImageTextButton.h"
#import "UIView+Frame.h"

@implementation {{args.Prefix}}BaseViewController ({{args.Prefix}}CustomNavigationBar)

- (void){{args.CategoryPrefix}}_applyDefaultNavigationBarStyle {
    // 设置状态栏样式
    self.statusBarStyle = {{args.Prefix}}StatusBarStyleLightContent;
    // 设置导航栏背景色
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRGBValue:kNaviBackgroundColor]];
    // 设置导航栏是否需要混色
    self.navigationController.navigationBar.translucent = NO;
    // 设置导航栏字体颜色、字体样式
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRGBValue:kNaviForegroundColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:kNaviTitleFontSize], NSFontAttributeName, nil]];
}

- (void){{args.CategoryPrefix}}_applyTransparentNavigationBarWhiteStatus {
    // 设置状态栏样式
    self.statusBarStyle = {{args.Prefix}}StatusBarStyleLightContent;
    // 设置导航栏背景色为透明
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    // 隐藏设置导航栏最下面的一条线
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    // 不让导航栏自动调整 scrollView 的 contentInset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 设置导航栏字体颜色、字体样式
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRGBValue:kNaviTransparentForgroundColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:kNaviTitleFontSize], NSFontAttributeName, nil]];
}

- (void){{args.CategoryPrefix}}_applyTransparentNavigationBarDarkStatus {
    [self {{args.CategoryPrefix}}_applyTransparentNavigationBarWhiteStatus];
    self.statusBarStyle = {{args.Prefix}}StatusBarStyleDefault;
}

- (UIButton *){{args.CategoryPrefix}}_addNavigationLeftBackItem {
    {{args.Prefix}}ImageTextButton *backButton = ({{args.Prefix}}ImageTextButton *)[self {{args.CategoryPrefix}}_addNavigationLeftItem];
    [backButton addTarget:self action:@selector(ht_back) forControlEvents:UIControlEventTouchUpInside];
    
    // 导航栏左侧按钮背景图片(根据视觉需求自定义)
    UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 6.5, 13, 21)];
    iconView.image = backButton.normalImage = [UIImage imageNamed:@"navi_back"];
    backButton.highlightedImage = [UIImage imageNamed:@"navi_back_hl"];
    backButton.iconView = iconView;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.textColor = backButton.normalTextColor = [UIColor colorWithRGBValue:kNaviForegroundColor];
    backButton.highlightedTextColor = [UIColor colorWithRGBValue:kNaviForegroundHighlightedColor];
    label.text = @"返回";
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:kNaviLeftButtonTextFontSize];
    [label sizeToFit];
    backButton.textLabel = label;
    backButton.textLabel.x = backButton.iconView.tail + 6.5;
    backButton.textLabel.middleY = backButton.iconView.middleY;
    
    [backButton sizeToFit];
    return backButton;
}

- (UIButton *){{args.CategoryPrefix}}_addNavigationLeftItem {
    // 新建导航栏左侧按钮
    {{args.Prefix}}ImageTextButton *leftButton = [[{{args.Prefix}}ImageTextButton alloc] initWithFrame:CGRectZero];
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:leftButton]];

    return leftButton;
}

- (UIButton *){{args.CategoryPrefix}}_addNavigationRightSettingItem {
    UIButton *settingButton = [self {{args.CategoryPrefix}}_addNavigationRightItem];
    
    // 导航栏右侧按钮背景图片(根据视觉需求自定义)
    UIImage *settingImage = [UIImage imageNamed:@"navi_setting"];
    // 导航栏右侧按钮高亮时的背景图片(根据视觉需求自定义)
    UIImage *settingHighlightImage = [UIImage imageNamed:@"navi_setting_hl"];
    
    [settingButton setBackgroundImage:settingImage forState:UIControlStateNormal];
    [settingButton setBackgroundImage:settingHighlightImage forState:UIControlStateHighlighted];
    [settingButton sizeToFit];
    
    return settingButton;
}


- (UIButton *){{args.CategoryPrefix}}_addNavigationRightCloseItem {
    UIButton *closeButton = [self {{args.CategoryPrefix}}_addNavigationRightItem];
    
    // 导航栏右侧按钮背景图片(根据视觉需求自定义)
    UIImage *closeImage = [UIImage imageNamed:@"navi_close"];
    // 导航栏右侧按钮高亮时的背景图片(根据视觉需求自定义)
    UIImage *closeHighlightImage = [UIImage imageNamed:@"navi_close_hl"];
    
    [closeButton setBackgroundImage:closeImage forState:UIControlStateNormal];
    [closeButton setBackgroundImage:closeHighlightImage forState:UIControlStateHighlighted];
    [closeButton sizeToFit];

    return closeButton;
}

- (UIButton *){{args.CategoryPrefix}}_addNavigationRightItemWithTitle:(NSString *)title {
    UIButton *rightButton = [self {{args.CategoryPrefix}}_addNavigationRightItem];
    
    // 导航栏右侧按钮背景图片(根据视觉需求自定义)
    [rightButton setTitle:title forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor colorWithRGBValue:kNaviForegroundColor] forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor colorWithRGBValue:kNaviForegroundHighlightedColor] forState:UIControlStateHighlighted];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:kNaviRightButtonTextFontSize];
    rightButton.layer.borderWidth = 1;
    rightButton.layer.borderColor = [UIColor colorWithRGBValue:kNaviForegroundColor].CGColor;
    rightButton.layer.cornerRadius = 2;
    rightButton.width = 52;
    rightButton.height = 29;
    
    return rightButton;
}

- (UIButton *){{args.CategoryPrefix}}_addNavigationRightItem {
    // 新建导航栏右侧按钮，并设置背景图(可根据需要修改 button 样式)
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:rightButton]];

    return rightButton;
}

- (UISearchBar *){{args.CategoryPrefix}}_addNavigationSearchItem {
    UISearchBar *searchBar = [[UISearchBar alloc]init];
    searchBar.searchBarStyle = UISearchBarStyleDefault;
    [searchBar setShowsCancelButton:NO]; //显示右侧取消按钮
    searchBar.backgroundColor = [UIColor colorWithRGBValue:kNaviBackgroundColor];
    [searchBar setBarTintColor:[UIColor colorWithRGBValue:kNaviBackgroundColor]];
    [searchBar setImage:[UIImage imageNamed:@"navi_search"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    
    searchBar.delegate = (id<UISearchBarDelegate>)self;
    [searchBar setPlaceholder:@"搜索商品，共100件好物"];
    [searchBar sizeToFit];
    //将搜索条放在一个UIView上
    UIView *searchView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kNavigationBarHeight)];
    searchView.backgroundColor = [UIColor colorWithRGBValue:kNaviBackgroundColor];
    [searchView addSubview:searchBar];
    
    [self setTextColor:[UIColor colorWithRGBValue:kContentTextColor]
     placeHolderTextColor:[UIColor colorWithRGBValue:kPlaceholderTextColor]
                  font:[UIFont systemFontOfSize:kDefaultFontSize]
                  with:searchBar.subviews];
    searchBar.width = SCREEN_WIDTH - 66;
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchView addSubview:backButton];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont systemFontOfSize:kNaviLeftButtonTextFontSize];
    [backButton setTitleColor:[UIColor colorWithRGBValue:kNaviForegroundColor] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor colorWithRGBValue:kNaviForegroundHighlightedColor] forState:UIControlStateHighlighted];
    [backButton addTarget:self action:@selector(ht_back) forControlEvents:UIControlEventTouchUpInside];
    [backButton sizeToFit];
    backButton.x = searchBar.tail + 10;
    backButton.middleY = searchView.middleY;

    
    self.navigationItem.titleView = searchView;
    return searchBar;
}

#pragma mark - Private Methods.

- (void)setTextColor:(UIColor *)textColor
placeHolderTextColor:(UIColor *)placeHolderTextColor
                font:(UIFont *)font
                with:(NSArray *)subviews {
    for (UIView *v in subviews) {
        for(id subview in v.subviews) {
            if ([subview isKindOfClass:[UITextField class]]) {
                ((UITextField *)subview).textColor = textColor;
                ((UITextField *)subview).font = font;
                [subview setValue:placeHolderTextColor forKeyPath:@"_placeholderLabel.textColor"];
                [subview setValue:font forKeyPath:@"_placeholderLabel.font"];
            }
        }
    }
}


@end
