//
//  {{args.Prefix}}ImagePickerViewManager.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/24.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

@class {{args.Prefix}}ImagePickerViewController;
@class HTAsset;

typedef void(^ImageChooseFinished)({{args.Prefix}}ImagePickerViewController* imagePickerViewController, NSArray<HTAsset*>* assets);
typedef void(^ImageChooseCanceled)({{args.Prefix}}ImagePickerViewController* imagePickerViewController);

@interface {{args.Prefix}}ImagePickerViewManager : NSObject

+ (instancetype)sharedInstance;

- (void)showImagePickerWithFinishedBlock:(ImageChooseFinished)finishedBlock
                             cancelBlock:(ImageChooseCanceled)canceledBlock;

@end
