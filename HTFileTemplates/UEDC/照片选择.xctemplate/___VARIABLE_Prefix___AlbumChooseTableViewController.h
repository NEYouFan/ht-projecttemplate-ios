//
//  ___VARIABLE_Prefix:identifier___AlbumChooseTableViewController.h
//  ___VARIABLE_Prefix:identifier___
//
//  Created by 陶泽宇 on 2017/5/24.
//  Copyrig___VARIABLE_Prefix:identifier___ © 2017年 Netease. All rig___VARIABLE_Prefix:identifier___s reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "HTAssetsHelper.h"

@protocol ___VARIABLE_Prefix:identifier___TableAlbumChooserDelegate;


@interface ___VARIABLE_Prefix:identifier___AlbumChooseTableViewController : UITableViewController

/**
 *  外部可读的资源组们
 */
@property (nonatomic,strong) NSArray* assetsGroups;

/**
 *  所要选择资源类型，支持图片、视频、all，默认___VARIABLE_Prefix:identifier___AssetsPickerAssetTypeAll
 */
//@property (nonatomic, assign) ___VARIABLE_Prefix:identifier___AssetsType assetsType;


/**
 *  代理
 */
@property (nonatomic,weak) id<___VARIABLE_Prefix:identifier___TableAlbumChooserDelegate> delegate;

@end


@protocol ___VARIABLE_Prefix:identifier___TableAlbumChooserDelegate <NSObject>

- (void)tableAlbumChooser:(___VARIABLE_Prefix:identifier___AlbumChooseTableViewController *)tableAlbumChooser
      didSelectAssetGroup:(ALAssetsGroup*)group;

@end
