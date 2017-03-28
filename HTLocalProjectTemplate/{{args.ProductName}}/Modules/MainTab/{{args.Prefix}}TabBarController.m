//
//  {{args.Prefix}}TabBarController.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 12/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}TabBarController.h"
#import "HTSegmentsView.h"
#import "MCBlurView.h"
#import "{{args.Prefix}}TabBarItem.h"
#import "UIImage+ImageWithColor.h"
#import "{{args.Prefix}}DemoViewController.h"
#import "{{args.Prefix}}PagingListController.h"
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
    _titles = [NSMutableArray arrayWithArray:@[@"列表1",
                                               @"列表2",
                                               @"列表3",
                                               @"我的"]];
    _icons = [NSMutableArray arrayWithArray:@[@"tab_list",
                                              @"tab_list",
                                              @"tab_list",
                                              @"tab_mine"]];
    _selectedIcons = [NSMutableArray arrayWithArray:@[@"tab_list_hl",
                                                      @"tab_list_hl",
                                                      @"tab_list_hl",
                                                      @"tab_mine_hl"]];
    
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
    _segmentsTabbar.backgroundColor = [UIColor clearColor];
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
    
    // Paging list tab
    {{args.Prefix}}DemoViewController *pagingListController = [[{{args.Prefix}}DemoViewController alloc] init];
    HTContainerViewController *containerController = [[HTContainerViewController alloc] initWithRootViewController:pagingListController];
    [tabViewControllers addObject:containerController];
    
    // Paging list 2 tab
    {{args.Prefix}}PagingListController *pagingListController2 = [[{{args.Prefix}}PagingListController alloc] init];
    containerController = [[HTContainerViewController alloc] initWithRootViewController:pagingListController2];
    [tabViewControllers addObject:containerController];

    // Paging list 3 tab
    {{args.Prefix}}PagingListController *pagingListController3 = [[{{args.Prefix}}PagingListController alloc] init];
    containerController = [[HTContainerViewController alloc] initWithRootViewController:pagingListController3];
    [tabViewControllers addObject:containerController];
    
    // Mine tab
    {{args.Prefix}}MineController *mineController = [[{{args.Prefix}}MineController alloc] init];
    containerController = [[HTContainerViewController alloc] initWithRootViewController:mineController];
    [tabViewControllers addObject:containerController];
    
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
