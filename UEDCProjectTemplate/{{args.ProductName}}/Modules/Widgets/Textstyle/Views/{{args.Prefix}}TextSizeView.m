//
//  {{args.Prefix}}TextSizeView.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/20.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}TextSizeView.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}TextSizeViewModel.h"

@interface {{args.Prefix}}TextSizeView ()

@property (nonatomic, strong) {{args.Prefix}}TextSizeViewModel *model;

@end

@implementation {{args.Prefix}}TextSizeView

- (instancetype)initWithFrame:(CGRect)frame
                        model:({{args.Prefix}}TextSizeViewModel *)model{
    if (self = [super initWithFrame:frame]) {
        self.model = model;
        [self loadSubViews];
    }
    return self;
}

-(void)loadSubViews{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 2;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = self.model.title;
    titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:self.model.size];
    titleLabel.textColor = [UIColor colorWithRGBValue:kFisrtClassTitleTextColor];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [titleLabel sizeToFit];
    titleLabel.x = 17;
    titleLabel.middleY = self.height/2;
    [self addSubview:titleLabel];
    
    
    UILabel *tailLabel = [[UILabel alloc] init];
    tailLabel.text = self.model.tail;
    tailLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
    tailLabel.textColor = [UIColor colorWithRGBValue:kFisrtClassTitleTextColor];
    tailLabel.textAlignment = NSTextAlignmentRight;
    [tailLabel sizeToFit];
    tailLabel.tail = self.width - 17;
    tailLabel.middleY = titleLabel.middleY;
    [self addSubview:tailLabel];
}

@end
