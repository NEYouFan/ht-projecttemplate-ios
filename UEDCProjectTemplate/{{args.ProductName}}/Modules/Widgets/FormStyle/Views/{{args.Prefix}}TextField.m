//
//  {{args.Prefix}}TextField.m
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/4/26.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}TextField.h"

@implementation {{args.Prefix}}TextField

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {

        [self commonInit];
        
    }
    return self;
}

-(void)commonInit{
    self.textColor = [UIColor blackColor];
    self.textAlignment = NSTextAlignmentLeft;
    self.font = [UIFont systemFontOfSize:14];
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.backgroundColor = [UIColor whiteColor];
    
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 2;
    self.layer.borderWidth = 0.6;
    self.layer.borderColor = [UIColor colorWithRGBValue:kTextBorderColor].CGColor;
    
}

//控制placeholder的位置
-(CGRect)placeholderRectForBounds:(CGRect)bounds{
    CGRect inset = CGRectMake(bounds.origin.x+10, bounds.origin.y, bounds.size.width -10, bounds.size.height);
    return inset;
}

//控制显示文本的位置
-(CGRect)textRectForBounds:(CGRect)bounds{
    CGRect inset = CGRectMake(bounds.origin.x+10, bounds.origin.y, bounds.size.width -10, bounds.size.height);
    return inset;
}

//控制编辑文本的位置
-(CGRect)editingRectForBounds:(CGRect)bounds{
    CGRect inset = CGRectMake(bounds.origin.x +10, bounds.origin.y, bounds.size.width -10, bounds.size.height);
    return inset;
}

-(void)setDefaultPlaceholder:(NSString *)defaultPlaceholder{
    
    _defaultPlaceholder = defaultPlaceholder;
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:defaultPlaceholder attributes:@{NSForegroundColorAttributeName: [UIColor colorWithRGBValue:kPlaceholderTextColor]}];
}
@end
