//
//  {{args.Prefix}}IconViewController.m
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/5/2.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}IconViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"
#import "UIView+{{args.Prefix}}Line.h"
#import "{{args.Prefix}}IconCell.h"
#import "{{args.Prefix}}IconCellModel.h"

@interface {{args.Prefix}}IconViewController ()<HTRouteTargetProtocol,HTContainerViewControllerProtocol,HTNavigationBackPanGestureProtocol,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) UICollectionView * collectionView;
@property(nonatomic, strong) NSArray <{{args.Prefix}}IconCellModel *> *models;
@end

@implementation {{args.Prefix}}IconViewController

@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://icons";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark - Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"常用图标";
    self.models = [{{args.Prefix}}IconCellModel iconCellModels];
    [self loadSubviews];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    
}

#pragma mark UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.models.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    {{args.Prefix}}IconCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"{{args.Prefix}}IconCell" forIndexPath:indexPath];
    {{args.Prefix}}IconCellModel * model = self.models[indexPath.row];
    model.index = indexPath.row;
    cell.model = model;
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    NSInteger numberOfSections = 1;
    return numberOfSections;
}




//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}



#pragma mark - Init View

- (void)loadSubviews{
    
    self.view.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
    
    [self.view addSubview:self.collectionView];
    
    
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}
#pragma mark - getter

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(60.0, 70.0);
        layout.minimumLineSpacing = 20.0;
        layout.minimumInteritemSpacing = 3.0;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                                                  collectionViewLayout:layout];
        collectionView.backgroundColor= [UIColor clearColor];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        [collectionView registerClass:[{{args.Prefix}}IconCell class] forCellWithReuseIdentifier:@"{{args.Prefix}}IconCell"];
        _collectionView = collectionView;
    }
    return _collectionView;
}


@end
