//
//  {{args.Prefix}}DrawerView.m
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/5/2.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}DrawerView.h"
#import "UIView+Frame.h"
#import "UIView+{{args.Prefix}}Line.h"
@interface {{args.Prefix}}DrawerView()<UIGestureRecognizerDelegate>
@property(nonatomic, copy) NSArray <NSString *> * titles;
@property(nonatomic, strong) UIView * container;
@property(nonatomic, assign) NSInteger currentIndex;
@property(nonatomic, copy) NSString * currentTitle;
@property(nonatomic, assign) CGFloat containerHeight;
@property(nonatomic, strong) UIImageView *selectedImageView;

@end
@implementation {{args.Prefix}}DrawerView

-(instancetype)initWithDefaultIndex:(NSInteger)defaultIndex titles:(NSArray <NSString*>*)titles{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _titles = titles;
        self.currentIndex = defaultIndex;
        
        [self commonInit];
    }
    return self;
}
- (void)commonInit {
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler:)];
    tapGesture.delegate = self;
    [self addGestureRecognizer:tapGesture];
    
    self.container = [UIView new];
    self.container.backgroundColor = [UIColor colorWithRGBValue:kDefaultActionColor];
    self.container.y = 44+20;
    self.container.width = SCREEN_WIDTH;
    self.container.x = 0;
    self.container.clipsToBounds = YES;
    
    [self addSubview:self.container];
    __block UIButton * lastButton = nil;
    [self.titles enumerateObjectsUsingBlock:^(NSString * _Nonnull title, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton * otherButton = [self creatButtonWithTitle:title];
        [otherButton addTarget:self action:@selector(otherButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        otherButton.tag = 100 + idx;
        
        otherButton.x = 0;
        otherButton.height = 40;
        otherButton.width = SCREEN_WIDTH;
        if (lastButton) {
            otherButton.y = lastButton.bottom;
        }
        [otherButton {{args.CategoryPrefix}}_addHorizontalBottomLineWithLeftMargin:0 rightMargin:0];
        
        
        [self.container addSubview:otherButton];
        lastButton = otherButton;
    }];
    
    self.containerHeight = lastButton.bottom;
    
    [self.container addSubview:self.selectedImageView];
    
}
#pragma mark - public method

-(void)show{
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    self.frame = window.bounds;
    [UIView animateWithDuration:0.3 animations:^{
        self.container.height = self.containerHeight;
        
    }];
    
    [window addSubview:self];
    
    UIImage * image = [UIImage imageNamed:@"widget_arrow_up"];
    [self.titleButton setImage:image forState:UIControlStateNormal];
    [self.titleButton setImage:image forState:UIControlStateHighlighted];
}

-(void)hide{
    [UIView animateWithDuration:0.3 animations:^{
        self.container.height = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    UIImage * image = [UIImage imageNamed:@"widget_arrow_down"];
    [self.titleButton setImage:image forState:UIControlStateNormal];
    [self.titleButton setImage:image forState:UIControlStateHighlighted];
}

#pragma mark - private method

- (UIButton *)creatButtonWithTitle:(NSString *)title{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    button.backgroundColor = [UIColor whiteColor];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    return button;
}
-(void)adjustButtonTitleAndIcon{
    self.titleButton.titleLabel.backgroundColor = self.titleButton.backgroundColor;
    self.titleButton.imageView.backgroundColor = self.titleButton.backgroundColor;
    CGFloat padding = 5;
    [self.titleButton setTitleEdgeInsets:UIEdgeInsetsMake(0, - (self.titleButton.imageView.bounds.size.width+ padding), 0, self.titleButton.imageView.bounds.size.width + padding)];
    [self.titleButton setImageEdgeInsets:UIEdgeInsetsMake(0, self.titleButton.titleLabel.bounds.size.width  + padding, 0, - (self.titleButton.titleLabel.bounds.size.width + padding))];
}

#pragma mark - event handler

- (void)otherButtonTapped:(UIButton *)sender {
    [self hide];
    NSInteger index = sender.tag - 100;
    self.currentIndex = index;
    if(self.selectedCallback){
        self.selectedCallback(self, index);
    }
}

- (void)tapHandler:(UITapGestureRecognizer *)tapGesture {
    [self hide];
}
- (void)currentButtonTapped:(UIButton *)sender {
    [self show];
}

#pragma mark - getter

-(UIButton *)titleButton{
    if (!_titleButton) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(currentButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        UIImage * image = [UIImage imageNamed:@"widget_arrow_down"];
        [button setImage:image forState:UIControlStateNormal];
        [button setImage:image forState:UIControlStateHighlighted];

        button.height = 30;
        button.width = 250;
        _titleButton = button;
    }
    return _titleButton;
}

-(void)setCurrentIndex:(NSInteger)currentIndex{
    _currentIndex = currentIndex;
    [self.titleButton setTitle:self.titles[_currentIndex] forState:UIControlStateNormal];
    [self adjustButtonTitleAndIcon];
    
    self.selectedImageView.middleY = _currentIndex * 40 +20;

}


-(UIImageView *)selectedImageView{
    if (!_selectedImageView) {
        _selectedImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"widget_selected"]];
        _selectedImageView.tail =  SCREEN_WIDTH - 15;
    }
    return _selectedImageView;
}
@end
