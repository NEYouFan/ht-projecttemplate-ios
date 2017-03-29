//
//  ___FILEBASENAMEASIDENTIFIER___.m
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//


#import "___FILEBASENAME___.h"
#import "___VARIABLE_CellModel:identifier___.h"


@interface ___FILEBASENAMEASIDENTIFIER___ ()

@end

@implementation ___FILEBASENAMEASIDENTIFIER___


#pragma mark --- init ---
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadSubviews];
    }
    return self;
}

#pragma mark  --- Load Subviews ---
- (void)loadSubviews{
    //加载subviews
}

#pragma mark --- layout Subviews ---
- (void)layoutSubviews{
    //layout subviews
}

#pragma mark --- Model binding ---
- (void)setModel:(___VARIABLE_CellModel:identifier___ *)model{
    //layout if cell data changes
    [self setNeedsLayout];
}


#pragma mark --- Overridden Methods ---

- (CGSize)sizeThatFits:(CGSize)size{
    //如果cell.fd_enforceFrameLayout设置为yes的话，需要重写sizeThatFits方法来确定cell的大小
}

- (void)setHighlighted: (BOOL)highlighted 
	animated: (BOOL)animated
{
	// Call the base implementation.
	[super setHighlighted: highlighted animated: animated];
	
	// Configure the table view cell for the highlighted state.
}

- (void)setSelected: (BOOL)selected 
	animated: (BOOL)animated
{
	// Call the base implementation.
	[super setSelected: selected animated: animated];
	
	// Configure the table view cell for the selected state.
}

@end
