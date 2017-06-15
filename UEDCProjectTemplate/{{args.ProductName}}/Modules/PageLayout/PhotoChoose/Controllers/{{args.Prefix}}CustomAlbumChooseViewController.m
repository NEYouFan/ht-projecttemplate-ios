//
//  {{args.Prefix}}CustomAlbumChooseViewController.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/24.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}CustomAlbumChooseViewController.h"

@interface {{args.Prefix}}CustomAlbumChooseViewController ()

@end

@implementation {{args.Prefix}}CustomAlbumChooseViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"照片";
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"返回";
    self.navigationItem.backBarButtonItem = backItem;
    self.navigationItem.backBarButtonItem.tintColor = [UIColor colorWithRGBValue:kNaviForegroundColor];
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:19]};
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRGBValue:kNaviBackgroundColor];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

- (void)cancel:(id)sender{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
