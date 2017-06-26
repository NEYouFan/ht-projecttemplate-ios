//
//  ___VARIABLE_Prefix:identifier___ImagePickerViewManager.h
//  ___VARIABLE_Prefix:identifier___
//
//  Created by 陶泽宇 on 2017/5/24.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ___VARIABLE_Prefix:identifier___ImagePickerViewController;
@class HTAsset;

typedef void(^ImageChooseFinished)(___VARIABLE_Prefix:identifier___ImagePickerViewController* imagePickerViewController, NSArray<HTAsset*>* assets);
typedef void(^ImageChooseCanceled)(___VARIABLE_Prefix:identifier___ImagePickerViewController* imagePickerViewController);

@interface ___VARIABLE_Prefix:identifier___ImagePickerViewManager : NSObject

+ (instancetype)sharedInstance;

- (void)showImagePickerWithFinishedBlock:(ImageChooseFinished)finishedBlock
                             cancelBlock:(ImageChooseCanceled)canceledBlock;

@end
