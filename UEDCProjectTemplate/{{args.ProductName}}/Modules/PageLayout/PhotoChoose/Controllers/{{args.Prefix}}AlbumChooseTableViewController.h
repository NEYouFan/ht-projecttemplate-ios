//
//  {{args.Prefix}}AlbumChooseTableViewController.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/24.
//  Copyrig{{args.Prefix}} © 2017年 Netease. All rig{{args.Prefix}}s reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "HTAssetsHelper.h"

@protocol {{args.Prefix}}TableAlbumChooserDelegate;


@interface {{args.Prefix}}AlbumChooseTableViewController : UITableViewController

/**
 *  外部可读的资源组们
 */
@property (nonatomic,strong) NSArray* assetsGroups;

/**
 *  所要选择资源类型，支持图片、视频、all，默认{{args.Prefix}}AssetsPickerAssetTypeAll
 */
//@property (nonatomic, assign) {{args.Prefix}}AssetsType assetsType;


/**
 *  代理
 */
@property (nonatomic,weak) id<{{args.Prefix}}TableAlbumChooserDelegate> delegate;

@end


@protocol {{args.Prefix}}TableAlbumChooserDelegate <NSObject>

- (void)tableAlbumChooser:({{args.Prefix}}AlbumChooseTableViewController *)tableAlbumChooser
      didSelectAssetGroup:(ALAssetsGroup*)group;

@end
