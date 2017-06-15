//
//  {{args.Prefix}}DemoTableViewCell.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/3/24.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}DemoTableViewCell.h"
#import "{{args.Prefix}}Product.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+{{args.Prefix}}Line.h"
#import "Masonry.h"
#import <HTImageView/HTImageView.h>
#import <HTCommonUtility/UIImage+ImageWithColor.h>
#import <HTCommonUtility/UIView+Frame.h>

@interface {{args.Prefix}}DemoTableViewCell ()

@property(nonatomic, strong)HTImageView *productView;
@property(nonatomic, strong)UILabel *headerLabel;
@property(nonatomic, strong)UILabel *priceLabel;

@end

@implementation {{args.Prefix}}DemoTableViewCell

# pragma mark -init
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadSubviews];
    }
    return self;
}

#pragma mark  -Load Subviews
- (void)loadSubviews{
    [self.contentView {{args.CategoryPrefix}}_addHorizontalBottomLineWithLeftMargin:0 rightMargin:0];
    self.contentView.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
    
    self.productView = [[HTImageView alloc] init];
    [self.productView setNormalImageContentMode:UIViewContentModeScaleToFill
                               placeHodlerImage:[UIImage imageWithColor:[UIColor lightGrayColor]]
                                    contentMode:UIViewContentModeScaleToFill
                                     errorImage:nil
                                    contentMode:UIViewContentModeScaleToFill];
    [self.contentView addSubview:self.productView];
    
    self.headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.headerLabel.textColor = [UIColor colorWithRGBValue:kDefaultTextColor];
    self.headerLabel.font = [UIFont systemFontOfSize:kDefaultFontSize];
    self.headerLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.headerLabel];
    
    self.priceLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.priceLabel.textColor = [UIColor colorWithRGBValue:kLightTextColor];
    self.priceLabel.font = [UIFont systemFontOfSize:kDefaultFontSize];
    self.priceLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.priceLabel];
    
}

#pragma mark -layout Subviews
- (void)layoutSubviews{
    [self.productView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(@80);
        make.top.bottom.equalTo(self.contentView);
        make.left.equalTo(self.contentView);
    }];
    
    [self.headerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.productView.mas_right).with.offset(20);
        make.right.equalTo(self.contentView).with.offset(-kRightMargin);
        make.top.equalTo(self.contentView).with.offset(20);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerLabel);
        make.right.equalTo(self.headerLabel);
        make.top.equalTo(self.headerLabel.mas_bottom).with.offset(15);
    }];

}

- (void)setModel:({{args.Prefix}}Product *)model{
    [self.productView setImageWithUrl:[NSURL URLWithString:model.pic]];
    self.headerLabel.text = model.name;
    self.priceLabel.text = [NSString stringWithFormat:@"¥  %ld", (long)model.price];
    [self setNeedsLayout];
}

//如果cell.fd_enforceFrameLayout设置为yes的话，需要重写sizeThatFits方法来确定cell的大小
- (CGSize)sizeThatFits:(CGSize)size{
    return CGSizeMake(size.width, 80);
}

@end
