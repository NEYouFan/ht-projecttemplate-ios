//
//  {{args.Prefix}}GuidePageItemView.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/26.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}GuidePageItem.h"
#import "UIView+Frame.h"

const static CGFloat kImageViewWidth = 240;
const static CGFloat kImageViewHeight = 240;

const static CGFloat kButtonWidth = 250;
const static CGFloat kButtonHeight = 45;

static const int kGuidePageTitleFontSize = 18;
static const int kGuidePageSubTitleFontSize = 16;

static const CGFloat kEnterButtonCornerRadius = 4;


@interface {{args.Prefix}}GuidePageItem ()

@property (nonatomic, strong) {{args.Prefix}}GuidePageModel *model;
@property (nonatomic, assign) {{args.Prefix}}GuidePageItemType type;

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;

@property (nonatomic, strong) UIButton *enterButton;

@end

@implementation {{args.Prefix}}GuidePageItem

#pragma mark - Life cycle.

- (instancetype)initWithType:({{args.Prefix}}GuidePageItemType)type model:({{args.Prefix}}GuidePageModel *)model {
    if (self = [super initWithFrame:CGRectZero]) {
        _type = type;
        _model = model;
        
        self.backgroundColor = [UIColor whiteColor];
        [self loadSubViews];
    }
    
    return self;
}


#pragma mark - load Views.

- (void)loadSubViews {
    _imageView = [[UIImageView alloc] init];
    [self addSubview:_imageView];
    if (_model.imageName) {
        _imageView.image = [UIImage imageNamed:_model.imageName];
    }
    _imageView.backgroundColor = [UIColor colorWithRGBValue:0xd8d8d8];
    _imageView.layer.cornerRadius = kImageViewWidth / 2;
    _imageView.layer.masksToBounds = YES;
    
    _titleLabel = [[UILabel alloc] init];
    [self addSubview:_titleLabel];
    _titleLabel.text = _model.title;
    _titleLabel.textColor = [UIColor colorWithRGBValue:kContentTextColor];
    _titleLabel.font = [UIFont systemFontOfSize:kGuidePageTitleFontSize];
    _titleLabel.numberOfLines = 1;
    [_titleLabel sizeToFit];
    
    _subTitleLabel = [[UILabel alloc] init];
    [self addSubview:_subTitleLabel];
    _subTitleLabel.text = _model.subTitle;
    _subTitleLabel.textColor = [UIColor colorWithRGBValue:kLightTextColor];
    _subTitleLabel.font = [UIFont systemFontOfSize:kGuidePageSubTitleFontSize];
    _subTitleLabel.numberOfLines = 1;
    [_subTitleLabel sizeToFit];
    
    _enterButton = [[UIButton alloc] init];
    [self addSubview:_enterButton];
    _enterButton.backgroundColor = [UIColor colorWithRGBValue:kSecondClassTitleTextColor];
    _enterButton.layer.cornerRadius = kEnterButtonCornerRadius;
    _enterButton.layer.masksToBounds = YES;
    [_enterButton setTitle:@"立即进入" forState:UIControlStateNormal];
    [_enterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_enterButton addTarget:self action:@selector(enterButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    _enterButton.hidden = !_model.isShowButton;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _imageView.width = kImageViewWidth;
    _imageView.height = kImageViewHeight;
    _imageView.middleX = self.width / 2;
    _imageView.y = 130;
    
    _titleLabel.y = _imageView.bottom + 70;
    _titleLabel.middleX = self.width / 2;
    
    _subTitleLabel.y = _titleLabel.bottom + 25;
    _subTitleLabel.middleX = self.width / 2;
    
    _enterButton.width = kButtonWidth;
    _enterButton.height = kButtonHeight;
    _enterButton.bottom = self.height - 30;
    _enterButton.middleX = self.width / 2;
}


#pragma mark - Actions.

- (void)enterButtonClick:(id)sender {
    if ([_delegate respondsToSelector:@selector(guidePageButtonClicked:type:)]) {
        [_delegate guidePageButtonClicked:self type:_type];
    }
}

@end
