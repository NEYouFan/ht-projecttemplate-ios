//
//  {{args.Prefix}}QRCodeScanViewController.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/18.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}QRCodeScanViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "LBXScanNative.h"
#import "LBXScanView.h"
#import "LBXScanViewStyle.h"
#import "UIView+HTToast.h"
#import "UIView+Frame.h"

static const CGFloat CenterUpOffset = 90.f;
static const CGFloat XScanRetangleOffset = 80.f;
static const CGFloat PhotoframeAngleW = 18.f;
static const CGFloat PhotoframeAngleH = 18.f;

@interface {{args.Prefix}}QRCodeScanViewController () <HTRouteTargetProtocol,
                                            HTContainerViewControllerProtocol,
                                            HTNavigationBackPanGestureProtocol,
                                            UINavigationControllerDelegate>

@property (nonatomic, strong) LBXScanView *qRScanView;
@property (nonatomic, strong) LBXScanViewStyle *style;
@property (nonatomic, strong) LBXScanNative *scanObj;

@property (nonatomic, strong) UILabel *instructionLabel;

@property (nonatomic, assign) BOOL isShowPhotoframeAngle;

@end

@implementation {{args.Prefix}}QRCodeScanViewController
@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://qrcodescan";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark --- Life Cycle ---

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"扫一扫页面布局";
    
    self.isShowPhotoframeAngle = YES;
    
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    
    [self loadSubViews];
    
    [_qRScanView startDeviceReadyingWithText:@"相机启动中"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self startScan];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    _qRScanView.frame = self.view.bounds;
    
    [_instructionLabel sizeToFit];
    _instructionLabel.middleX = _qRScanView.width / 2;
    _instructionLabel.y = _qRScanView.height / 2 - CenterUpOffset + (_qRScanView.width - XScanRetangleOffset * 2) / 2 + 15;
}


#pragma mark --- Load Views ---

- (void)loadSubViews {
    _style = [[LBXScanViewStyle alloc]init];
    _style.centerUpOffset = CenterUpOffset;
    _style.xScanRetangleOffset = XScanRetangleOffset;
    _style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle_On;
    _style.photoframeLineW = self.isShowPhotoframeAngle ? 2 : 0;
    _style.photoframeAngleW = PhotoframeAngleW;
    _style.photoframeAngleH = PhotoframeAngleH;
    _style.photoframeLineW = 2;
    _style.isNeedShowRetangle = YES;
    _style.anmiationStyle = LBXScanViewAnimationStyle_LineMove;//动画选择LBXScanViewAnimationStyle_None
    _style.colorAngle = [UIColor colorWithRed:0./255 green:200./255. blue:20./255. alpha:1.0];
    _style.notRecoginitonArea = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    UIImage *imgLine = [UIImage imageNamed:@"CodeScan.bundle/qrcode_Scan_weixin_Line"];
    _style.animationImage = imgLine;
    
    _qRScanView = [[LBXScanView alloc] initWithFrame:CGRectZero style:_style];
    [self.view addSubview:_qRScanView];
    
    _instructionLabel = [[UILabel alloc] init];
    [_qRScanView addSubview:_instructionLabel];
    _instructionLabel.text = @"将二维码放入框中，即可自动扫描";
    _instructionLabel.textColor = [UIColor whiteColor];
    _instructionLabel.font = [UIFont systemFontOfSize:15];
}


#pragma mark --- Start Scan ---

- (void)startScan {
    if (![self cameraPemission]) {
        [_qRScanView stopDeviceReadying];
        
        NSLog(@"请到设置隐私中开启本程序相机权限");
        return;
    }
    
    UIView *videoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    videoView.backgroundColor = [UIColor clearColor];
    [self.view insertSubview:videoView atIndex:0];
    __weak __typeof(self) weakSelf = self;
    
            
    if (!_scanObj) {
        CGRect cropRect = CGRectZero;
        
        cropRect = [LBXScanView getScanRectWithPreView:self.view style:_style];
        
        NSString *strCode = AVMetadataObjectTypeQRCode;
        self.scanObj = [[LBXScanNative alloc] initWithPreView:videoView ObjectType:@[strCode] cropRect:cropRect success:^(NSArray<LBXScanResult *> *array) {
            [weakSelf scanResultWithArray:array];
        }];
        
        [_scanObj setNeedCaptureImage:NO];
    }
    [_scanObj startScan];
    
    [_qRScanView stopDeviceReadying];
    [_qRScanView startScanAnimation];
    
    self.view.backgroundColor = [UIColor clearColor];
}


#pragma mark --- Private method ---

- (BOOL)cameraPemission {
    BOOL isHavePemission = YES;
    if ([AVCaptureDevice respondsToSelector:@selector(authorizationStatusForMediaType:)]) {
        AVAuthorizationStatus permission =
        [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        
        switch (permission) {
            case AVAuthorizationStatusAuthorized:
                isHavePemission = YES;
                break;
            case AVAuthorizationStatusDenied:
            case AVAuthorizationStatusRestricted:
                isHavePemission = NO;
                break;
            case AVAuthorizationStatusNotDetermined:
                isHavePemission = YES;
                break;
        }
    }
    
    return isHavePemission;
}

- (void)scanResultWithArray:(NSArray<LBXScanResult*>*)array {
    if (array.count < 1) {
        [self.view makeToast:@"识别失败" duration:0.25 position:HTToastPositionCenter];
        [self startScan];
        return;
    }
    
    for (LBXScanResult *result in array) {
        NSLog(@"scanResult:%@",result.strScanned);
    }
    
    LBXScanResult *scanResult = array[0];
    NSString *strResult = scanResult.strScanned;
    
    if (strResult) {
        [self.view makeToast:strResult duration:2 position:HTToastPositionCenter];
        [self startScan];
        return;
    }
}

@end
