//
//  {{args.Prefix}}ActionSheet.m
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/4/27.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}ActionSheet.h"
#import "UIView+Frame.h"
#import "UIView+{{args.Prefix}}Line.h"

@interface {{args.Prefix}}ActionSheet()<UIGestureRecognizerDelegate>

@property(nonatomic, strong) NSArray <NSString *> * otherButtonTitles;
@property(nonatomic, strong) NSString * cancelButtonTitle;
@property(nonatomic, strong) UIView * container;

@end
@implementation {{args.Prefix}}ActionSheet



- (instancetype)initWithCancelButtonTitle:(NSString *)cancelTitle otherButtonTitles:(NSArray<NSString *> *)otherTitles{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _otherButtonTitles = otherTitles;
        _cancelButtonTitle = cancelTitle;
        
        [self commonInit];
    }
    return self;

}

- (void)commonInit {
    
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.25];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler:)];
    tapGesture.delegate = self;
    [self addGestureRecognizer:tapGesture];
    
    self.container = [UIView new];
    self.container.backgroundColor = [UIColor colorWithRGBValue:kDefaultActionColor];
    self.container.y = SCREEN_HEIGHT;
    self.container.height = 300;
    self.container.width = SCREEN_WIDTH;
    self.container.x = 0;
    
    [self addSubview:self.container];
    
    __block UIButton * lastButton = nil;
    [self.otherButtonTitles enumerateObjectsUsingBlock:^(NSString * _Nonnull title, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton * otherButton = [self creatButtonWithTitle:title];
        [otherButton addTarget:self action:@selector(otherButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        otherButton.tag = 100 + idx;
        
        otherButton.x = 0;
        otherButton.height = 50;
        otherButton.width = SCREEN_WIDTH;
        if (lastButton) {
            otherButton.y = lastButton.bottom;
        }
        [otherButton {{args.CategoryPrefix}}_addHorizontalBottomLineWithLeftMargin:0 rightMargin:0];
        [self.container addSubview:otherButton];
        lastButton = otherButton;
    }];
    
    UIButton * cancelButton = [self creatButtonWithTitle:self.cancelButtonTitle];
    [cancelButton addTarget:self action:@selector(cancelButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    cancelButton.x = 0;
    cancelButton.height = 50;
    cancelButton.width = SCREEN_WIDTH;
    cancelButton.y = lastButton.bottom + 10;
    
    [self.container addSubview:cancelButton];
    

}

#pragma mark - public method

-(void)show{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    self.frame = window.bounds;
    [UIView animateWithDuration:0.25 animations:^{
        self.container.y = SCREEN_HEIGHT - (self.otherButtonTitles.count +1) * 50 - 10 ;
        
    }];
    [window addSubview:self];
}

-(void)hide{
    [UIView animateWithDuration:0.25 animations:^{
        self.container.y = SCREEN_HEIGHT;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

#pragma mark - private method

- (UIButton *)creatButtonWithTitle:(NSString *)title{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:18];

    button.backgroundColor = [UIColor whiteColor];
    return button;
}

#pragma mark - event handler

- (void)otherButtonTapped:(UIButton *)sender {
    [self hide];
    NSInteger index = sender.tag - 100;
    if(self.selectedCallback){
        self.selectedCallback(self, index);
    }
}

- (void)cancelButtonTapped:(UIButton *)sender {
    [self hide];
    if (self.cancelCallBack) {
        self.cancelCallBack(self);
    }
}

- (void)tapHandler:(UITapGestureRecognizer *)tapGesture {
    [self hide];
}

@end
