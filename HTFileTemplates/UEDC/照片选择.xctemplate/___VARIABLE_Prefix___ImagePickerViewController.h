//
//  ___VARIABLE_Prefix:identifier___ImagePickerViewController.h
//  ___VARIABLE_Prefix:identifier___
//
//  Created by 陶泽宇 on 2017/5/24.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HTAsset;
@class HTAssetsPickerView;
@protocol ___VARIABLE_Prefix:identifier___ImagePickerViewDelegate;

typedef NS_ENUM(NSInteger, ___VARIABLE_Prefix:identifier___ImagePickerType)
{
//    SpecificImagePickerTypeOrder = 1,    暂时不提供，供之后扩展
    ___VARIABLE_Prefix:identifier___ImagePickerTypeUnorder
};

@interface ___VARIABLE_Prefix:identifier___ImagePickerViewController : UIViewController

@property (nonatomic,weak) id<___VARIABLE_Prefix:identifier___ImagePickerViewDelegate> delegate;
@property (nonatomic,strong) HTAssetsPickerView* assetsPicker;
- (instancetype)initWithType:(___VARIABLE_Prefix:identifier___ImagePickerType)type;

@end


@protocol ___VARIABLE_Prefix:identifier___ImagePickerViewDelegate <NSObject>

- (void)assetsPicker:(___VARIABLE_Prefix:identifier___ImagePickerViewController *)assetsPicker
    didFinishPickingWithAssets:(NSArray<HTAsset*>*)assets;

- (void)assetsPickerDidCancelPicking:(___VARIABLE_Prefix:identifier___ImagePickerViewController *)assetsPicker;

@end
