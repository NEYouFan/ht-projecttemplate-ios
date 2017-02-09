//
//  {{args.Prefix}}MineSettingFeedbackController.m
//  TestNei
//
//  Created by {{args.Author}} on 21/10/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}MineSettingFeedbackController.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}RefreshView.h"

static const int kIndicationTopMargin = 20;
static const int kTextViewTopMargin = 43;
static const int kTextViewHeight = 134;
static const int kTextViewSendButtonGap = 38;

@interface {{args.Prefix}}MineSettingFeedbackController ()

// 对于这种基本不太会变化且控件比较少的页面，可以直接将子view添加到一个 scrollview 中
@property (nonatomic, strong) UIScrollView *backScrollView;
@property (nonatomic, strong) UILabel *indicationLabel;
@property (nonatomic, strong) UITextView *inputTextView;
@property (nonatomic, strong) UIButton *sendButton;

@end

@implementation {{args.Prefix}}MineSettingFeedbackController

#pragma mark - Life cycle.

- (void)viewDidLoad {
    [super viewDidLoad];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    self.title = @"反馈";
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self loadSubviews];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    _backScrollView.frame = self.view.bounds;
    _backScrollView.contentSize = CGSizeMake(_backScrollView.frame.size.width,
                                             _backScrollView.frame.size.height + 1);

    _indicationLabel.x = kLeftMargin;
    _indicationLabel.y = kIndicationTopMargin;

    _inputTextView.x = kLeftMargin;
    _inputTextView.y = kTextViewTopMargin;
    _inputTextView.width = SCREEN_WIDTH - kLeftMargin - kRightMargin;
    _inputTextView.height = kTextViewHeight;

    _sendButton.tail = SCREEN_WIDTH - kRightMargin;
    _sendButton.y = _inputTextView.bottom + kTextViewSendButtonGap;
}


#pragma mark - Load views.

- (void)loadSubviews {
    _backScrollView = [[UIScrollView alloc] init];
    _backScrollView.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
    [self.view addSubview:_backScrollView];

    _indicationLabel = [[UILabel alloc] init];
    _indicationLabel.text = @"写点什么给我们";
    _indicationLabel.font = [UIFont systemFontOfSize:kDefaultFontSize];
    _indicationLabel.textColor = [UIColor colorWithRGBValue:kDefaultTextColor];
    [_indicationLabel sizeToFit];
    [_backScrollView addSubview:_indicationLabel];

    _inputTextView = [[UITextView alloc] init];
    _inputTextView.layer.masksToBounds = YES;
    _inputTextView.textColor = [UIColor colorWithRGBValue:kDefaultTextColor];
    _inputTextView.font = [UIFont systemFontOfSize:kDefaultFontSize];
    _inputTextView.layer.cornerRadius = kCornerRadiusSize;
    _inputTextView.layer.borderColor = [UIColor colorWithRGBValue:kDefaultLineColor].CGColor;
    _inputTextView.layer.borderWidth = LINE_WIDTH;
    [_backScrollView addSubview:_inputTextView];

    // 发送按钮
    _sendButton = [[UIButton alloc] init];
    [_sendButton setImage:[UIImage imageNamed:@"setting_feedback"] forState:UIControlStateNormal];
    [_sendButton setImage:[UIImage imageNamed:@"setting_feedback_hl"] forState:UIControlStateHighlighted];
    [_sendButton addTarget:self action:@selector(sendFeedback:) forControlEvents:UIControlEventTouchUpInside];
    [_sendButton sizeToFit];
    [_backScrollView addSubview:_sendButton];
}


#pragma mark - Actions.

- (void)sendFeedback:(id)sender {

    // 通过网络发送反馈，可以添加一些正在发送的效果
}

@end
