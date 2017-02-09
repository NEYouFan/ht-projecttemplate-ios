//
//  __   __      __________
// |  | |  |    |___    ___|
// |  |_|  |        |  |
// |   _   |        |  |
// |  | |  |        |  |
// |__| |__|        |__|
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//


#import "___FILEBASENAME___.h"


#pragma mark Constants


#pragma mark - Class Extension

@interface ___FILEBASENAMEASIDENTIFIER___ ()

- (void)_initialize___VARIABLE_className:identifier___;


@end


#pragma mark - Class Variables


#pragma mark - Class Definition

@implementation ___FILEBASENAMEASIDENTIFIER___


#pragma mark - Properties


#pragma mark - Constructors

- (id)initWithFrame: (CGRect)frame
{
	// Abort if base initializer fails.
	if ((self = [super initWithFrame: frame]) == nil)
	{
		return nil;
	}
	
	// Initialize collection view cell.
	[self _initialize___VARIABLE_className:identifier___];
	
	// Return initialized instance.
	return self;
}

- (id)initWithCoder: (NSCoder *)coder
{
	// Abort if base initializer fails.
	if ((self = [super initWithCoder: coder]) == nil)
	{
		return nil;
	}
	
	// Initialize collection view cell.
	[self _initialize___VARIABLE_className:identifier___];
	
	// Return initialized instance.
	return self;
}


#pragma mark - Public Methods


#pragma mark - Overridden Methods

- (void)setHighlighted: (BOOL)highlighted
{
	// Call the base implementation.
	[super setHighlighted: highlighted];
	
	// Configure the collection view cell for the highlighted state.
}

- (void)setSelected: (BOOL)selected
{
	// Call the base implementation.
	[super setSelected: selected];
	
	// Configure the table view cell for the selected state.
}


#pragma mark - Private Methods

- (void)_initialize___VARIABLE_className:identifier___
{
	// Initialize instance variables.
    [self loadSubviews];
}


#pragma mark - SubViews

- (void)loadSubviews
{
    //Initialize subviews
}

- (void)layoutSubviews
{
    //layout subviews
}


#pragma mark - data binding

- (void)setData:(id)data{
    //layout if cell data changes
    [self setNeedsLayout];
}

@end
