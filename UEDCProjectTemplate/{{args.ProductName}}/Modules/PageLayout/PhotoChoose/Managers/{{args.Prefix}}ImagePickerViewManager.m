//
//  {{args.Prefix}}ImagePickerViewManager.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/24.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}ImagePickerViewManager.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "HTAssetsPickerView.h"
#import "{{args.Prefix}}AssetPickerUnorderCell.h"
#import "{{args.Prefix}}CustomAlbumChooseViewController.h"
#import "{{args.Prefix}}ImagePickerViewController.h"
#import <Photos/Photos.h>
#import "HTAsset.h"


@interface {{args.Prefix}}ImagePickerViewManager ()<{{args.Prefix}}ImagePickerViewDelegate,{{args.Prefix}}TableAlbumChooserDelegate>

@property (nonatomic, copy) ImageChooseCanceled canceledBlock;
@property (nonatomic, copy) ImageChooseFinished finishedBlock;
@property (nonatomic, strong) ALAssetsLibrary* library;
@property (nonatomic, strong) {{args.Prefix}}CustomAlbumChooseViewController* albumChooser;
@property (nonatomic, strong) {{args.Prefix}}ImagePickerViewController* imagePickerController;
@property (nonatomic, strong) UINavigationController* navController;
@property (nonatomic, strong) NSMutableArray<HTAsset*>* selectedResult;
@property (nonatomic, strong) UIViewController *currentTopVC;
@end

@implementation {{args.Prefix}}ImagePickerViewManager

+ (instancetype)sharedInstance{
    static {{args.Prefix}}ImagePickerViewManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[{{args.Prefix}}ImagePickerViewManager alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init{
    if (self = [super init]) {
        _selectedResult = [[NSMutableArray alloc]init];
        
        _library = [[ALAssetsLibrary alloc]init];
        [_library enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
            NSLog(@"%li",(long)[group numberOfAssets]);
        } failureBlock:^(NSError *error) {
            if (error.code == ALAssetsLibraryAccessUserDeniedError) {
                NSLog(@"user denied access, code: %li",(long)error.code);
            }else{
                NSLog(@"Other error code: %li",(long)error.code);
            }
        }];
        _albumChooser = [[{{args.Prefix}}CustomAlbumChooseViewController alloc]init];
        _albumChooser.delegate = self;
    }
    return self;
}

- (void)showImagePickerWithFinishedBlock:(ImageChooseFinished)finishedBlock
                             cancelBlock:(ImageChooseCanceled)canceledBlock{
    self.finishedBlock = finishedBlock;
    self.canceledBlock = canceledBlock;
    _imagePickerController = [[{{args.Prefix}}ImagePickerViewController alloc] initWithType:{{args.Prefix}}ImagePickerTypeUnorder];
    _imagePickerController.assetsPicker.assetsType = HTAssetsTypePhoto;
    _imagePickerController.delegate = self;
    
    //ios8+,use photokit
    if (HTASSETSPICKER_USE_PHOTOKIT) {
        PHFetchResult *smartAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum
                                                                              subtype:PHAssetCollectionSubtypeSmartAlbumUserLibrary options:nil];
        if (smartAlbums.count == 1) {
            PHCollection *collection = smartAlbums[0];
            if ([collection isKindOfClass:[PHAssetCollection class]]) {
                PHAssetCollection *assetCollection = (PHAssetCollection *)collection;
                [_imagePickerController.assetsPicker setAssetCollection:assetCollection];
                
            } else {
                NSAssert(NO, @"Fetch collection not PHCollection: %@", collection);
            }
        }
        //相册选择器
        NSMutableArray* assetsGroups = [[NSMutableArray alloc]init];
        [_library enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
            if (group) {
                [group setAssetsFilter:[HTAssetsHelper assetsFilterFromType:HTAssetsTypePhoto]];
                [assetsGroups addObject:group];
                
            }else{
                
            }
            if (stop) {
                [_albumChooser setAssetsGroups:assetsGroups];
            }
        } failureBlock:^(NSError *error) {
            NSLog(@"%@",error);
        }];
    }else{
        //相片选择器
        [_library enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
            if (group) {
                [_imagePickerController.assetsPicker setAssetGroup:group];
            }
            *stop = YES;
        } failureBlock:^(NSError *error) {
            NSLog(@"enumerateGroupsWithTypes failed:%@",error);
        }];
        
        //相册选择器
        NSMutableArray* assetsGroups = [[NSMutableArray alloc]init];
        [_library enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
            if (group) {
                [group setAssetsFilter:[HTAssetsHelper assetsFilterFromType:HTAssetsTypePhoto]];
                [assetsGroups addObject:group];
                
            }else{
                
            }
            if (stop) {
                [_albumChooser setAssetsGroups:assetsGroups];
            }
        } failureBlock:^(NSError *error) {
            NSLog(@"%@",error);
        }];
    }
    _navController = [[UINavigationController alloc]initWithRootViewController:_albumChooser];
    [_navController pushViewController:_imagePickerController animated:NO];
    self.currentTopVC = [self getCurrentTopViewController];
    [self.currentTopVC presentViewController:_navController animated:YES completion:nil];
}

#pragma mark - SpecificImagePickerDelegate

- (void)assetsPicker:({{args.Prefix}}ImagePickerViewController*)assetsPickerController didFinishPickingWithAssets:(NSArray<HTAsset*>*)assets
{
    NSLog(@"选中：%lu张图片",(unsigned long)[assets count]);
    [assets enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [_selectedResult addObject:obj];
    }];
    [self.currentTopVC dismissViewControllerAnimated:YES completion:^{
        if (self.finishedBlock) {
            self.finishedBlock(assetsPickerController, assets);
        }
    }];
}

- (void)assetsPickerDidCancelPicking:({{args.Prefix}}ImagePickerViewController*)assetsPickerController
{
    [self.currentTopVC dismissViewControllerAnimated:YES completion:^{
        if (self.canceledBlock) {
            self.canceledBlock(assetsPickerController);
        }
    }];
}

#pragma mark - HTTableAlbumChooserDelegate

- (void)tableAlbumChooser:({{args.Prefix}}CustomAlbumChooseViewController*)tableAlbumChooser didSelectAssetGroup:(ALAssetsGroup*)group
{
    [_imagePickerController.assetsPicker setAssetGroup:group];
    [_imagePickerController.assetsPicker selectAssets:_selectedResult];
    [_imagePickerController.assetsPicker setCameraItemIndex:-1];
    [_navController pushViewController:_imagePickerController animated:YES];
    
}


#pragma mark --- 获取当前屏幕显示的viewcontroller ---
- (UIViewController *)getCurrentTopViewController
{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    
    return currentVC;
}

- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        rootVC = [rootVC presentedViewController];
    }
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
        
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
        
    } else {
        // 根视图为非导航类
        currentVC = rootVC;
    }
    return currentVC;
}

@end
