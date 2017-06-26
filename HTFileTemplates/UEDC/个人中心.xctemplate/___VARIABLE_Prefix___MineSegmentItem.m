//
//  ___VARIABLE_Prefix:identifier___MineSegmentItem.m
//  ___VARIABLE_Prefix:identifier___
//
//  Created by Baitianyu on 25/05/2017.
//  Copyright © 2017 Netease. All rights reserved.
//

#import "___VARIABLE_Prefix:identifier___MineSegmentItem.h"
#import "UIView+Frame.h"

@interface ___VARIABLE_Prefix:identifier___MineSegmentItem ()

@property (nonatomic, strong) UIImageView *segmentImageView;
@property (nonatomic, strong) UIButton *segmentButton;

@property (nonatomic, assign) ___VARIABLE_Prefix:identifier___MineSegmentItemType type;
@property (nonatomic, copy) NSString *iconName;

@end

@implementation ___VARIABLE_Prefix:identifier___MineSegmentItem

#pragma mark - Life cycle.

- (instancetype)initWithType:(___VARIABLE_Prefix:identifier___MineSegmentItemType)type iconName:(NSString *)iconName {
    if (self = [super initWithFrame:CGRectZero]) {
        _type = type;
        _iconName = [iconName copy];
        [self loadSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [self initWithType:___VARIABLE_Prefix:identifier___MineSegmentItemTypeInvalid iconName:nil]) {
        
    }
    return self;
}


#pragma mark - Load views.

- (void)loadSubviews {
    _segmentImageView = [[UIImageView alloc] init];
    _segmentImageView.image = [UIImage imageNamed:_iconName];
    [self addSubview:_segmentImageView];
    
    _segmentButton = [[UIButton alloc] init];
    _segmentButton.backgroundColor = [UIColor clearColor];
    [_segmentButton addTarget:self action:@selector(segmentButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_segmentButton];
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];
    _segmentImageView.size = CGSizeMake(20, 31.5);
    _segmentImageView.middleX = self.width / 2;
    _segmentImageView.middleY = self.height / 2;
    
    _segmentButton.frame = self.bounds;
}


#pragma mark - Actions.

- (void)segmentButtonClicked:(id)button {
    if ([_delegate respondsToSelector:@selector(segmentItemSelected:type:)]) {
        [_delegate segmentItemSelected:self type:_type];
    }
}

@end














