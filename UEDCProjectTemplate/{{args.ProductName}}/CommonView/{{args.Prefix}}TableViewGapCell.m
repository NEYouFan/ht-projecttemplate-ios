//
//  {{args.Prefix}}TableViewGapCell.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 09/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}TableViewGapCell.h"

@implementation {{args.Prefix}}TableViewGapCell

#pragma mark - Life cycle.

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return self;
}

- (CGFloat)cellHeight {
    return kTableViewCellGap;
}

@end
