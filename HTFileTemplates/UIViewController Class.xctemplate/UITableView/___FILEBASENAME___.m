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

// change the CellReuseIdentifier as you wanted
static NSString * const CellReuseIdentifier = @"TableViewCellIdentifier";

#pragma mark - Class Extension

@interface ___FILEBASENAMEASIDENTIFIER___ ()

@property (nonatomic, strong) UITableView *tableView;

@end


#pragma mark - Class Variables


#pragma mark - Class Definition

@implementation ___FILEBASENAMEASIDENTIFIER___


#pragma mark - Properties


#pragma mark - Constructors


#pragma mark - Destructor

- (void)dealloc 
{
	// nil out delegates of any instance variables.
	_tableView.delegate = nil;
	_tableView.dataSource = nil;
}

#pragma mark - Public Methods


#pragma mark - Life Cycle

- (void)viewDidLoad
{
	// Call base implementation.
	[super viewDidLoad];
    [self _initializeTableView];
}

- (void)viewWillAppear: (BOOL)animated
{
	// Call base implementation.
	[super viewWillAppear: animated];

	// Prepare view to be displayed onscreen.
}

- (void)viewDidAppear: (BOOL)animated
{
	// Call base implementation.
	[super viewDidAppear: animated];
	
	// Perform any actions required when the view is displayed onscreen.
}

- (void)viewWillDisappear: (BOOL)animated
{
	// Call base implementation.
	[super viewWillDisappear: animated];

	// Prepare view to be moved offscreen.
}

- (void)viewDidDisappear: (BOOL)animated
{
	// Call base implementation.
	[super viewDidDisappear: animated];
	
	// Perform any actions required when the view has been moved offscreen.
}

- (void)viewWillLayoutSubviews {
    // Call base implementation.
    [super viewWillLayoutSubviews];
    //belowing is the default frame of tableview, for a VC which contains NavigationBar but no TabBar, adjust the frame by yourself if this is not your case
    _tableView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);

    // arrange view layout
}


- (void)didReceiveMemoryWarning
{
	// Call base implementation.
	[super didReceiveMemoryWarning];
	
	// Free up any memory that can be recreated easily.
}


#pragma mark - Private Methods

- (void)_initializeTableView
{
	// Initialize tableview here.
    //belowing are example tableview initialization codes, change it by your case
    _tableView = [[UITableView alloc] init];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellReuseIdentifier];
    [self.view addSubview:_tableView];
}


#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView: (UITableView *)tableView 
	numberOfRowsInSection: (NSInteger)section
{
	NSInteger numberOfRows = 0;
	
	if (tableView == _tableView)
	{
		// TODO: Return the correct number of rows for the table view.
	}
	
	return numberOfRows;
}

- (UITableViewCell *)tableView: (UITableView *)tableView 
	cellForRowAtIndexPath: (NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;

	if (tableView == _tableView)
	{
		// TODO: Re-use or instantiate a UITableViewCell
        cell = [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifier
                                        forIndexPath:indexPath];
	}
	
	return cell;
}


#pragma mark - UITableViewDelegate Methods

- (void)tableView: (UITableView *)tableView 
	didSelectRowAtIndexPath: (NSIndexPath *)indexPath
{
	if (tableView == _tableView)
	{
	}
}


@end
