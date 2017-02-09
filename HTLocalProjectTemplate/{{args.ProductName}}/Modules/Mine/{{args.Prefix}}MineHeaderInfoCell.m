//
//  {{args.Prefix}}MineHeaderInfoCell.m
//  TestNei
//
//  Created by {{args.Author}} on 19/10/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}MineHeaderInfoCell.h"
#import "{{args.Prefix}}MineCellDescribeData.h"
#import "UIView+Frame.h"
#import "UIImage+ImageWithColor.h"
#import "{{args.Prefix}}UserDataManager.h"

static const int kLoginButtonBorderColor = 0xffffff;
static const int kHeaderIconWidth = 69;
static const int kLoginButtonWidth = 130;
static const int kLoginButtonHeight = 45;
static const int kTitleIconGap = 10;

@interface {{args.Prefix}}MineHeaderInfoCell ()

@property (nonatomic, strong) UIView *bgView; // 用于保持个人页面最顶部的背景色
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation {{args.Prefix}}MineHeaderInfoCell

#pragma mark - Life cycle.
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self loadSubviews];
    }

    return self;
}


#pragma mark - Load views.

- (void)loadSubviews {
    _bgView = [[UIView alloc] init];
    _bgView.backgroundColor = [UIColor colorWithRGBValue:kDefaultColor];
    [self.contentView addSubview:_bgView];
    
    _loginButton = [[UIButton alloc] init];
    [_loginButton setTitle:@"登陆/注册" forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(loginClicked:) forControlEvents:UIControlEventTouchUpInside];
    _loginButton.layer.cornerRadius = kCornerRadiusSize;
    _loginButton.layer.borderWidth = LINE_WIDTH;
    _loginButton.layer.borderColor = [UIColor colorWithRGBValue:kLoginButtonBorderColor].CGColor;
    _loginButton.layer.masksToBounds = YES;
    [_loginButton setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRGBValue:kDefaultButtonColor]] forState:UIControlStateNormal];
    [_loginButton setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRGBValue:kDefaultButtonHighlightColor]] forState:UIControlStateHighlighted];
    [self.contentView addSubview:_loginButton];

    _headerImageView = [[UIImageView alloc] init];
    _headerImageView.layer.cornerRadius = kHeaderIconWidth / 2;
    [self.contentView addSubview:_headerImageView];

    _nameLabel = [[UILabel alloc] init];
    _nameLabel.textColor = [UIColor colorWithRGBValue:kDefaultTextColor];
    _nameLabel.font = [UIFont systemFontOfSize:kDefaultFontSize];
    [self.contentView addSubview:_nameLabel];
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];

    _bgView.width = self.contentView.width;
    _bgView.height = SCREEN_HEIGHT;
    _bgView.x = 0;
    _bgView.bottom = self.contentView.height;
    
    _headerImageView.width = kHeaderIconWidth;
    _headerImageView.height = kHeaderIconWidth;
    _headerImageView.center = self.contentView.center;

    _loginButton.size = CGSizeMake(kLoginButtonWidth, kLoginButtonHeight);
    _loginButton.center = self.contentView.center;

    [_nameLabel sizeToFit];
    _nameLabel.middleX = self.contentView.width / 2;
    _nameLabel.y = _headerImageView.bottom + kTitleIconGap;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(size.width, 244);
}


#pragma mark - Actions.

- (void)loginClicked:(id)sender {
    if ([_delegate respondsToSelector:@selector(loginOrRegister:)]) {
        [_delegate loginOrRegister:self];
    }
}


#pragma mark - Setter.

- (void)setDescribeData:(MCTableBaseDescribeData *)describeData {
    if ([describeData isKindOfClass:[{{args.Prefix}}MineCellDescribeData class]]) {
        {{args.Prefix}}MineCellDescribeData *data = ({{args.Prefix}}MineCellDescribeData *)describeData;
        _delegate = data.delegate;
        if ([{{args.Prefix}}UserDataManager sharedInstance].alreadyLogin) {
            _headerImageView.hidden = NO;
            _loginButton.hidden = YES;
            _nameLabel.hidden = NO;
            _headerImageView.image = [UIImage imageNamed:data.iconName];
            _nameLabel.text = [[{{args.Prefix}}UserDataManager sharedInstance] userName];
        } else {
            _headerImageView.hidden = YES;
            _nameLabel.hidden = YES;
            _loginButton.hidden = NO;
        }
        [self setNeedsLayout];
    }
}

@end
