//
//  {{args.Prefix}}PageControllerViewController.m
//
//  Created by {{args.Author}} on 2017/5/12.
//    Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}PageControllerViewController.h"
#import "UIView+Frame.h"
#import "HTPageControllerView.h"
#import "HTSegmentsView.h"
#import "HTSegmentsViewAnimator.h"
#import "{{args.Prefix}}DemoPageViewController.h"

@interface {{args.Prefix}}PageControllerViewController () <
                                                HTPageControllerViewDataSource,
                                                HTPageControllerViewDelegate,
                                                HTSegmentsViewDelegate>

@property (nonatomic, strong) HTPageControllerView *pageControllerView;
@property (nonatomic, strong) HTStringToLabelDataSource *dataSource;
@property (nonatomic, strong) HTSegmentsView *segmentsView;
@property (nonatomic, strong) HTSublineSegmentViewAnimator *animator;
@property (nonatomic, strong) NSArray *segmentTitles;

@end

@implementation {{args.Prefix}}PageControllerViewController

- (instancetype)initWithSegmentsTitles:(NSArray <NSString *> *)titles{
    self = [super init];
    if (self){
        _segmentTitles = titles;
    }
    
    return self;
}


#pragma mark --- View data ---


#pragma mark --- Life Cycle ---

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSubviews];
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
    HTStringToLabelDataSource *dataSource = [[HTStringToLabelDataSource alloc] initWithArray:self.segmentTitles segmentCellClass:nil];
    dataSource.fontSize = kPageControllerViewFont;
    dataSource.selectedFontSize = kPageControllerViewFont;
    dataSource.textColor = [UIColor colorWithRGBValue:kpageControllerTextColor];
    dataSource.selectedTextColor = [UIColor colorWithRGBValue:kpageControllerSelectedTextColor];
    dataSource.cellWidth = CGRectGetWidth([UIScreen mainScreen].bounds)/self.segmentTitles.count;
    dataSource.cellHeight = kPageControllerViewHeight;
    
    _dataSource = dataSource;
    
    HTSegmentsView *segmentsView = [[HTHorizontalSegmentsView alloc] initWithSelectedIndex:0];
    segmentsView.segmentsDelegate = self;
    segmentsView.segmentsDataSource = dataSource;
    segmentsView.backgroundColor = [UIColor colorWithRGBValue:kpageControllerBackgroundColor];
    segmentsView.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), kPageControllerViewHeight);

    
    _segmentsView = segmentsView;
    _segmentsView.needAdjustToCenter = YES;
    
    [self.view addSubview:segmentsView];
    
    HTSublineSegmentViewAnimator *animator = [[HTSublineSegmentViewAnimator alloc] initWithSegmentsView:_segmentsView
                                                                                        backgroundColor:[UIColor clearColor]
                                                                                              lineColor:[UIColor colorWithRGBValue:kpageControllerSublineColor]
                                                                                             lineHeight:1.5];
    animator.cellContentPadding = 8;
    animator.lineWidthEqualToCellContent = YES;
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
    return self.segmentTitles.count;
}

- (UIViewController*)pageControllerView:(HTPageControllerView*)pageControllerView viewControllerForIndex:(NSUInteger)index
{
    {{args.Prefix}}DemoPageViewController *vc = [[{{args.Prefix}}DemoPageViewController alloc] initWithNibName:nil bundle:nil withIndex:index];
    return vc;
}


#pragma mark --- HTPageControllerViewDelegate ---
- (void)pageControllerViewDidScroll:(HTPageControllerView *)pageControllerView
{
    CGFloat pageWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat contentOffset = pageControllerView.contentOffset.x;
    NSUInteger currentIndex = contentOffset/pageWidth;
    CGFloat percent = (contentOffset - currentIndex * pageWidth)/pageWidth;
    
    if (contentOffset < 0 || contentOffset > pageWidth * self.segmentTitles.count)
        return;
    
    if (pageControllerView.isDragging || pageControllerView.decelerating)
        [_segmentsView moveFrom:currentIndex to:currentIndex+1 percent:percent];
}

- (void)pageControllerViewDidSelectedIndex:(NSUInteger)index
{
    [_segmentsView setSelectedIndex:index animated:YES];
}


@end

