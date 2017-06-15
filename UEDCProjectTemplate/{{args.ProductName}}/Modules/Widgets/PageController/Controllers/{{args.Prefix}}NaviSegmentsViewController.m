//
//  {{args.Prefix}}NaviSegmentsViewController.m
//
//  Created by {{args.Author}} on 2017/5/12.
//    Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}NaviSegmentsViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "UIView+Frame.h"
#import "HTPageControllerView.h"
#import "HTSegmentsView.h"
#import "HTSegmentsViewAnimator.h"
#import "{{args.Prefix}}PageControllerViewController.h"

@interface {{args.Prefix}}NaviSegmentsViewController () <HTRouteTargetProtocol,
                                                HTContainerViewControllerProtocol,
                                                HTNavigationBackPanGestureProtocol,
                                                HTPageControllerViewDataSource,
                                                HTPageControllerViewDelegate,
                                                HTSegmentsViewDelegate>

@property (nonatomic, strong) HTPageControllerView *pageControllerView;
@property (nonatomic, strong) HTStringToLabelDataSource *dataSource;
@property (nonatomic, strong) HTSegmentsView *segmentsView;
@property (nonatomic, strong) HTSublineSegmentViewAnimator *animator;

@end

@implementation {{args.Prefix}}NaviSegmentsViewController

@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://NaviSegments";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark --- Life Cycle ---

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSubviews];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    self.navigationItem.titleView = self.segmentsView;
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [_pageControllerView viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [_pageControllerView viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [_pageControllerView viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [_pageControllerView viewDidDisappear:animated];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
    return  YES;
}

- (void)viewWillLayoutSubviews {
    _pageControllerView.frame = self.view.bounds;
    [super viewWillLayoutSubviews];
}

#pragma mark --- View data ---

- (NSArray *)segmentTitles{
    return @[@"市场",@"交易"];
}

#pragma mark --- loadSubViews ---

- (void)loadSubviews{
    _pageControllerView = [[HTPageControllerView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    _pageControllerView.pageDataSource = self;
    _pageControllerView.pageDelegate = self;
    _pageControllerView.alwaysBounceVertical = NO;
    [self.view addSubview:_pageControllerView];
    [self addSegmentsView];
}

- (void)addSegmentsView
{
    HTStringToLabelDataSource *dataSource = [[HTStringToLabelDataSource alloc] initWithArray:[self segmentTitles] segmentCellClass:nil];
    dataSource.fontSize = kNaviSegmentsCellTextFont;
    dataSource.selectedFontSize = kNaviSegmentsCellTextFont;
    dataSource.textColor = [UIColor colorWithRGBValue:kNaviSegmentsTextColor];
    dataSource.selectedTextColor = [UIColor colorWithRGBValue:kNaviSegmentsSelectedTextColor];
    dataSource.cellWidth = kNaviSegmentsCellWitdh;
    dataSource.cellHeight = kNaviSegmentsCellHeight;
    
    _dataSource = dataSource;
    
    HTSegmentsView *segmentsView = [[HTHorizontalSegmentsView alloc] initWithSelectedIndex:0];
    segmentsView.segmentsDelegate = self;
    segmentsView.segmentsDataSource = dataSource;
    segmentsView.backgroundColor = [UIColor colorWithRGBValue:kNaviBackgroundColor];
    segmentsView.frame = CGRectMake(0, 0, [self segmentTitles].count * kNaviSegmentsCellWitdh, kNaviSegmentsCellHeight);
    segmentsView.layer.cornerRadius = 5;
    segmentsView.layer.borderColor = [UIColor colorWithRGBValue:kNaviForegroundColor].CGColor;
    segmentsView.layer.borderWidth = 1;
    _segmentsView = segmentsView;
    _segmentsView.needAdjustToCenter = YES;
    
    [self.view addSubview:segmentsView];
    
    HTSublineSegmentViewAnimator *animator = [[HTSublineSegmentViewAnimator alloc] initWithSegmentsView:_segmentsView
                                                                                        backgroundColor:[UIColor colorWithRGBValue:kNaviForegroundColor]
                                                                                              lineColor:[UIColor clearColor]
                                                                                             lineHeight:0];
    animator.animationDuration = .25;
    segmentsView.animator = animator;
    _animator = animator;
    
    [_segmentsView moveFrom:0 to:0 percent:1];
}




#pragma mark --- HTSegmentsView delegate ---
- (void)segmentsView:(HTSegmentsView *)segmentsView didSelectedAtIndex:(NSUInteger)index
{
    [_pageControllerView scrollToPageIndex:index animated:NO];
}

- (BOOL)segmentsView:(HTSegmentsView *)segmentsView shouldSelectedAtIndex:(NSUInteger)index
{
    return YES;
}

#pragma mark --- HTPageControllerViewDataSource ---
- (NSUInteger)numberOfControllersInPageControllerView
{
    return [self segmentTitles].count;
}

- (UIViewController*)pageControllerView:(HTPageControllerView*)pageControllerView viewControllerForIndex:(NSUInteger)index
{
    if (index == 0) {
        return [[{{args.Prefix}}PageControllerViewController alloc] initWithSegmentsTitles:@[@"收藏",@"历史",@"推荐",@"下载",@"市场"]];
    }else{
        return [[{{args.Prefix}}PageControllerViewController alloc] initWithSegmentsTitles:@[@"交易",@"记录",@"查账"]];
    }
}


#pragma mark --- HTPageControllerViewDelegate ---
- (void)pageControllerViewDidScroll:(HTPageControllerView *)pageControllerView
{
    CGFloat pageWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat contentOffset = pageControllerView.contentOffset.x;
    NSUInteger currentIndex = contentOffset/pageWidth;
    CGFloat percent = (contentOffset - currentIndex * pageWidth)/pageWidth;
    
    if (contentOffset < 0 || contentOffset > pageWidth * [self segmentTitles].count)
        return;
    
    if (pageControllerView.isDragging || pageControllerView.decelerating)
        [_segmentsView moveFrom:currentIndex to:currentIndex+1 percent:percent];
}

- (void)pageControllerViewDidSelectedIndex:(NSUInteger)index
{
    [_segmentsView setSelectedIndex:index animated:YES];
}

@end

