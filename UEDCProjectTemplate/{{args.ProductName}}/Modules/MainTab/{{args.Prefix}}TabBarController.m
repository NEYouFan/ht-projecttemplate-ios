//
//  {{args.Prefix}}TabBarController.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 12/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}TabBarController.h"
#import "HTSegmentsView.h"
#import "MCBlurView.h"
#import "{{args.Prefix}}TabBarItem.h"
#import "UIImage+ImageWithColor.h"
#import "{{args.Prefix}}MainPageViewController.h"
#import "{{args.Prefix}}MainPageModel.h"
#import "{{args.Prefix}}MineController.h"
#import "HTControllerRouter.h"

@interface {{args.Prefix}}TabBarController () <HTSegmentsViewDelegate, HTSegmentsViewDatasource>

@property (nonatomic, strong) HTSegmentsView *segmentsTabbar;
@property (nonatomic, strong) MCBlurView *bgView;

@property (nonatomic, strong) NSMutableArray *icons;
@property (nonatomic, strong) NSMutableArray *selectedIcons;
@property (nonatomic, strong) NSMutableArray *titles;

@end

@implementation {{args.Prefix}}TabBarController

#pragma mark - Life cycle.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self loadTabBar];
        [self loadControllers];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [self clearUITabbarItem]; // Should be called after viewDidload.
    [super viewDidAppear:animated];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    _segmentsTabbar.frame = self.tabBar.bounds;
    _bgView.frame = self.tabBar.bounds;
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [super setSelectedIndex:selectedIndex];
    [_segmentsTabbar setSelectedIndex:selectedIndex animated:NO];
}


#pragma mark - Load views.

- (void)loadTabBar {
    // 用户在此自定义产品对应的 tab。
    _titles = [NSMutableArray arrayWithArray:@[@"字体篇",
                                               @"控件篇",
                                               @"图标篇",
                                               @"页面布局篇"
                                               ]];
    _icons = [NSMutableArray arrayWithArray:@[@"tabbar_textstyle",
                                              @"tabbar_widgets",
                                              @"tabbar_icons",
                                              @"tabbar_pagelayout"]];
    _selectedIcons =  [NSMutableArray arrayWithArray:@[@"tabbar_textstyle_hl",
                                                       @"tabbar_widgets_hl",
                                                       @"tabbar_icons_hl",
                                                       @"tabbar_pagelayout_hl"]];
    // Load tabbar item.
    [self loadSegmentsView];
}

- (void)loadSegmentsView {
    // 毛玻璃效果
    _bgView = [[MCBlurView alloc] initWithStyle:MCBlurStyleWhite];
    [self.tabBar addSubview:_bgView];
    
    _segmentsTabbar = [[HTHorizontalSegmentsView alloc] initWithSelectedIndex:0];
    _segmentsTabbar.segmentsDataSource = self;
    _segmentsTabbar.segmentsDelegate = self;
    _segmentsTabbar.backgroundColor = [UIColor colorWithRGBValue:kTabBarbackgroundColor];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
    line.backgroundColor = [UIColor colorWithRGBValue:0xcccccc];
    [_segmentsTabbar addSubview:line];

    [self.tabBar addSubview:_segmentsTabbar];
}

- (void)clearUITabbarItem {
    //清理原来的tabbar的内容
    for (UIView *subView in self.tabBar.subviews) {
        if ([subView isKindOfClass:MCBlurView.class] ||
            [subView isKindOfClass:HTHorizontalSegmentsView.class] ||
            [subView isKindOfClass:[UIImageView class]]) {
            continue;
        }
        
        subView.hidden = YES;
        subView.alpha = 0;
    }
    
    self.tabBar.backgroundImage = [UIImage imageWithColor:[UIColor clearColor]];
}


#pragma mark - Load Tabs.

- (void)loadControllers {
    NSMutableArray *tabViewControllers = [[NSMutableArray alloc] init];
    
    // text tab
    {{args.Prefix}}MainPageViewController *pagingListController = [[{{args.Prefix}}MainPageViewController alloc] init];
    [pagingListController setModel:[{{args.Prefix}}MainPageModelGenerator textPageModel]];
    HTContainerViewController *containerController = [[HTContainerViewController alloc] initWithRootViewController:pagingListController];
    [tabViewControllers addObject:containerController];
    
    // widget tab
    {{args.Prefix}}MainPageViewController *pagingListController2 = [[{{args.Prefix}}MainPageViewController alloc] init];
    [pagingListController2 setModel:[{{args.Prefix}}MainPageModelGenerator widgetsPageModel]];
    HTContainerViewController *containerController2 = [[HTContainerViewController alloc] initWithRootViewController:pagingListController2];
    [tabViewControllers addObject:containerController2];

    // icon tab
    {{args.Prefix}}MainPageViewController *pagingListController3 = [[{{args.Prefix}}MainPageViewController alloc] init];
    [pagingListController3 setModel:[{{args.Prefix}}MainPageModelGenerator iconsPageModel]];
    HTContainerViewController *containerController3 = [[HTContainerViewController alloc] initWithRootViewController:pagingListController3];
    [tabViewControllers addObject:containerController3];

    
    // layout tab
    {{args.Prefix}}MainPageViewController *pagingListController4 = [[{{args.Prefix}}MainPageViewController alloc] init];
    [pagingListController4 setModel:[{{args.Prefix}}MainPageModelGenerator layoutPageModel]];
    HTContainerViewController *containerController4 = [[HTContainerViewController alloc] initWithRootViewController:pagingListController4];
    [tabViewControllers addObject:containerController4];
    
    self.viewControllers = tabViewControllers;
}


#pragma mark - HTSegmentsViewDelegate

- (BOOL)segmentsView:(HTSegmentsView*)segmentsView shouldSelectedAtIndex:(NSUInteger)index {
    BOOL shouldSelected = YES;
    
    if ([self.delegate respondsToSelector:@selector(tabBarController:shouldSelectViewController:)]) {
        shouldSelected = [self.delegate tabBarController:self shouldSelectViewController:self.viewControllers[index]];
    }
    return shouldSelected;
}

- (void)segmentsView:(HTSegmentsView*)segmentsView didSelectedAtIndex:(NSUInteger)index {
    [super setSelectedIndex:index];
    
    if ([self.delegate respondsToSelector:@selector(tabBarController:didSelectViewController:)]) {
        [self.delegate tabBarController:self didSelectViewController:self.viewControllers[index]];
    }
}


#pragma mark - HTSegmentsViewDatasource

- (NSUInteger)numberOfCellsInSegementsView:(HTSegmentsView*)segmentsView {
    return _icons.count;
}

- (HTSegmentsCellView*)segmentsView:(HTSegmentsView*)segmentsView cellForIndex:(NSUInteger)index {
    {{args.Prefix}}TabBarItem *itemCell = [[{{args.Prefix}}TabBarItem alloc] initWithTitle:_titles[index] icon:_icons[index] selectedIcon:_selectedIcons[index]];
    return itemCell;
}

- (CGSize)segmentsView:(HTSegmentsView*)segmentsView cellSizeForIndex:(NSUInteger)index {
    CGFloat screenWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
    return CGSizeMake(screenWidth/_icons.count, CGRectGetHeight(self.tabBar.bounds));
}


#pragma mark - badge

- (void)showBadge:({{args.Prefix}}BadgeType)badgeType text:(NSString*)text atIndex:(NSUInteger)index {
    {{args.Prefix}}TabBarItem *item = ({{args.Prefix}}TabBarItem *)_segmentsTabbar.segmentCells[index];
    [item showBadge:badgeType text:text];
}

- (void)hideBadge:(NSUInteger)index {
    {{args.Prefix}}TabBarItem *item = ({{args.Prefix}}TabBarItem *)_segmentsTabbar.segmentCells[index];
    [item hideBadge];
}


#pragma mark - Public methods.

+ (void)selectTabbarIndex:(NSInteger)index {
    if (APPDELEGATE().tabBarController) {
        [APPDELEGATE().tabBarController setSelectedIndex:index];
    }
}

+ (void)showTabBadgeAtIndex:(NSInteger)index text:(NSString *)text {
    if (APPDELEGATE().tabBarController) {
        [APPDELEGATE().tabBarController showBadge:{{args.Prefix}}BadgeTypeText text:text atIndex:index];
    }
}

+ (void)hideTabBadgeAtIndex:(NSInteger)index {
    if (APPDELEGATE().tabBarController) {
        [APPDELEGATE().tabBarController hideBadge:index];
    }
}

@end
