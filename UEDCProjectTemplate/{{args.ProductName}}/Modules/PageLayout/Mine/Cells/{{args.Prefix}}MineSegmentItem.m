//
//  {{args.Prefix}}MineSegmentItem.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 25/05/2017.
//  Copyright © 2017 Netease. All rights reserved.
//

#import "{{args.Prefix}}MineSegmentItem.h"
#import "UIView+Frame.h"

@interface {{args.Prefix}}MineSegmentItem ()

@property (nonatomic, strong) UIImageView *segmentImageView;
@property (nonatomic, strong) UIButton *segmentButton;

@property (nonatomic, assign) {{args.Prefix}}MineSegmentItemType type;
@property (nonatomic, copy) NSString *iconName;

@end

@implementation {{args.Prefix}}MineSegmentItem

#pragma mark - Life cycle.

- (instancetype)initWithType:({{args.Prefix}}MineSegmentItemType)type iconName:(NSString *)iconName {
    if (self = [super initWithFrame:CGRectZero]) {
        _type = type;
        _iconName = [iconName copy];
        [self loadSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [self initWithType:{{args.Prefix}}MineSegmentItemTypeInvalid iconName:nil]) {
        
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














