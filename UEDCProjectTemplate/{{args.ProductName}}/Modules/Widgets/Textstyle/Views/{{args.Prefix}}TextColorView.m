//
//  {{args.Prefix}}TextColorView.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/20.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}TextColorView.h"
#import "{{args.Prefix}}TextColorViewModel.h"
#import "UIView+Frame.h"

@interface {{args.Prefix}}TextColorView ()

@property (nonatomic, strong) {{args.Prefix}}TextColorViewModel *model;

@end

@implementation {{args.Prefix}}TextColorView

- (instancetype)initWithFrame:(CGRect)frame
                        model:({{args.Prefix}}TextColorViewModel *)model{
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
    titleLabel.font = [UIFont systemFontOfSize:kFirstClassContentFontSize];
    titleLabel.textColor = [UIColor colorWithRGBValue:self.model.colorValue];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [titleLabel sizeToFit];
    titleLabel.x = 17;
    titleLabel.middleY = self.height/2;
    [self addSubview:titleLabel];
    
    
    UILabel *tailLabel = [[UILabel alloc] init];
    tailLabel.text = self.model.colorString;
    tailLabel.font = [UIFont systemFontOfSize:kFirstClassContentFontSize];
    tailLabel.textColor = [UIColor colorWithRGBValue:self.model.colorValue];
    tailLabel.textAlignment = NSTextAlignmentRight;
    [tailLabel sizeToFit];
    tailLabel.tail = self.width - 12;
    tailLabel.middleY = titleLabel.middleY;
    [self addSubview:tailLabel];
    
    UIView *colorBlockView = [[UIView alloc] init];
    colorBlockView.width = 16;
    colorBlockView.height = 16;
    colorBlockView.tail = tailLabel.x - 8;
    colorBlockView.middleY = titleLabel.middleY;
    colorBlockView.backgroundColor = [UIColor colorWithRGBValue:self.model.colorValue];
    colorBlockView.layer.cornerRadius = 2;
    [self addSubview:colorBlockView];
    
}
@end
