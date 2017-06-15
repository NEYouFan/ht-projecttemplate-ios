//
//  {{args.Prefix}}ImagePickerViewController.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/24.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}ImagePickerViewController.h"
#import "HTAssetsPickerView.h"
#import "{{args.Prefix}}AssetPickerUnorderCell.h"

@interface {{args.Prefix}}ImagePickerViewController ()<HTAssetsPickerDelegate>

@property (nonatomic,weak) UIButton *numberButton;
@property (nonatomic,weak) UIButton *previewButton;
@property (nonatomic,weak) UIButton *sendPictureButton;

@end

@implementation {{args.Prefix}}ImagePickerViewController

- (instancetype)initWithType:({{args.Prefix}}ImagePickerType)type{
    self = [super init];
    if (self) {
        if (type == {{args.Prefix}}ImagePickerTypeUnorder) {
            _assetsPicker = [[HTAssetsPickerView alloc]initWithCellClass:[{{args.Prefix}}AssetPickerUnorderCell class]];
        }
        _assetsPicker.assetsPickerDelegate = self;
        _assetsPicker.interItemSpacing = 2;
        _assetsPicker.lineSpacing = 2;
        _assetsPicker.itemsCountEachRow = 4;
        _assetsPicker.inset = UIEdgeInsetsMake(2, 2, 2, 2);
        _assetsPicker.maxSelectedCount = 3;
        _assetsPicker.assetsType = HTAssetsTypePhoto;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
    self.title = @"相机胶卷";
    [self.view addSubview:_assetsPicker];
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancleButtonClicked:)];
    self.navigationItem.rightBarButtonItem = cancelButton;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRGBValue:kNaviBackgroundColor];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRGBValue:kNaviForegroundColor];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithRGBValue:kNaviForegroundColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithRGBValue:kNaviForegroundColor],NSFontAttributeName:[UIFont systemFontOfSize:19]};
    [self setupUnorderBottomBar];

}

- (void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

- (void)setupUnorderBottomBar
{
    UIView *bottomBar = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 49, [UIScreen mainScreen].bounds.size.width, 49)];
    bottomBar.backgroundColor = [UIColor whiteColor];
    CGRect barFrame = bottomBar.frame;
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, barFrame.size.width, 1)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [bottomBar addSubview:lineView];
    UIButton *previewButton = [[UIButton alloc] initWithFrame:CGRectMake(12, 0, 30, 49)];
    _previewButton = previewButton;
    [previewButton setTitle:@"预览" forState:UIControlStateNormal];
    previewButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [previewButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [previewButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [previewButton setEnabled:NO];
    [bottomBar addSubview:previewButton];
    
    UIButton *sendPictureButton = [[UIButton alloc] initWithFrame:CGRectMake(barFrame.size.width - 67, 0, 30, 49)];
    _sendPictureButton = sendPictureButton;
    [sendPictureButton setTitle:@"发送" forState:UIControlStateNormal];
    sendPictureButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [sendPictureButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [sendPictureButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [sendPictureButton addTarget:self action:@selector(sendButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [sendPictureButton setEnabled:NO];
    [bottomBar addSubview:sendPictureButton];
    
    UIButton *numberButton = [[UIButton alloc] initWithFrame:CGRectMake(barFrame.size.width - 32, 14, 20, 20)];
    _numberButton = numberButton;
    [numberButton setTitle:@"0" forState:UIControlStateNormal];
    numberButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [numberButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    numberButton.layer.cornerRadius = 10;
    numberButton.layer.masksToBounds = YES;
    [numberButton setBackgroundColor:[UIColor colorWithRGBValue:0x666666]];
    [numberButton setEnabled:NO];
    numberButton.hidden = YES;
    [bottomBar addSubview:numberButton];
    
    [self.view addSubview:bottomBar];
}

- (void)transformWithButton:(UIButton *)button
{
    button.alpha = 0;
    CGAffineTransform transform = button.transform;
    button.transform = CGAffineTransformScale(transform, 0.1, 0.1);
    [UIView animateWithDuration:0.2 animations:^{
        button.transform = CGAffineTransformScale(transform, 1.2, 1.2);
        button.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            button.transform = CGAffineTransformScale(transform, 0.9, 0.9);;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 animations:^{
                button.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
}

//selectedAssents变化后设置底部栏的变化
- (void)selectedAssetsChangeConfig:(HTAssetsPickerView*)assetsPicker
{
    if (assetsPicker.selectedAssets.count > 0) {
        _numberButton.hidden = NO;
        _previewButton.enabled = YES;
        _sendPictureButton.enabled = YES;
        [_previewButton setTitleColor:[UIColor colorWithRGBValue:0x333333] forState:UIControlStateNormal];
        [_sendPictureButton setTitleColor:[UIColor colorWithRGBValue:0x333333] forState:UIControlStateNormal];
        [_numberButton setTitle:[NSString stringWithFormat:@"%@",@(assetsPicker.selectedAssets.count)] forState:UIControlStateNormal];
        [self transformWithButton:_numberButton];
    }
    else
    {
        _numberButton.hidden = YES;
        _previewButton.enabled = NO;
        _sendPictureButton.enabled = NO;
        [_previewButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_sendPictureButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    }
}


- (void)sendButtonClicked:(id)sender
{
    [_assetsPicker finishSelection];
}

- (void)cancleButtonClicked:(id)sender
{
    [_assetsPicker cancelSelection];
}

- (void)viewWillLayoutSubviews
{
    _assetsPicker.frame = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height -50 - 64);
    
}


#pragma mark - HTAssetsPickerDelegate

- (void)assetsPicker:(HTAssetsPickerView*)assetsPicker didFinishPickingWithAssets:(NSArray<HTAsset*>*)assets
{
    [_delegate assetsPicker:self didFinishPickingWithAssets:assets];
}

- (void) assetsPickerDidCancelPicking:(HTAssetsPickerView*)assetsPicker
{
    [_delegate assetsPickerDidCancelPicking:self];
}

- (void)assetsPicker:(HTAssetsPickerView*)assetsPicker didSelectAsset:(HTAsset*)asset
{
    [self selectedAssetsChangeConfig:assetsPicker];
}

- (void)assetsPicker:(HTAssetsPickerView *)assetsPicker didDeselectAsset:(HTAsset *)asset
{
    [self selectedAssetsChangeConfig:assetsPicker];
}

- (void)assetsPickerSwitchAssetsGroup:(HTAssetsPickerView*)assetsPicker
{
    
}

- (void)assetsPickerDidExceedMaxSelectedCount:(HTAssetsPickerView*)assetsPicker
{
    UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"" message:[NSString stringWithFormat:@"最多选择%ld张",(long)_assetsPicker.maxSelectedCount] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alertView show];
}


- (void)assetsPickerCameraClicked:(HTAssetsPickerView *)assetsPicker
{
    NSLog(@"camera");
}


@end
