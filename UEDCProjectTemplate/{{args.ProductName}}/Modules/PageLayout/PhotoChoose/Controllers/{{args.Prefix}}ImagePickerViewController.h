//
//  {{args.Prefix}}ImagePickerViewController.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/24.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HTAsset;
@class HTAssetsPickerView;
@protocol {{args.Prefix}}ImagePickerViewDelegate;

typedef NS_ENUM(NSInteger, {{args.Prefix}}ImagePickerType)
{
//    SpecificImagePickerTypeOrder = 1,    暂时不提供，供之后扩展
    {{args.Prefix}}ImagePickerTypeUnorder
};

@interface {{args.Prefix}}ImagePickerViewController : UIViewController

@property (nonatomic,weak) id<{{args.Prefix}}ImagePickerViewDelegate> delegate;
@property (nonatomic,strong) HTAssetsPickerView* assetsPicker;
- (instancetype)initWithType:({{args.Prefix}}ImagePickerType)type;

@end


@protocol {{args.Prefix}}ImagePickerViewDelegate <NSObject>

- (void)assetsPicker:({{args.Prefix}}ImagePickerViewController *)assetsPicker
    didFinishPickingWithAssets:(NSArray<HTAsset*>*)assets;

- (void)assetsPickerDidCancelPicking:({{args.Prefix}}ImagePickerViewController *)assetsPicker;

@end
