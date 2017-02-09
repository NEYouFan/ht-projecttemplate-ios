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
static NSString * const CellReuseIdentifier = @"CollectionViewCellIdentifier";


#pragma mark - Class Extension

@interface ___FILEBASENAMEASIDENTIFIER___ ()

@property (nonatomic, strong) UICollectionView *collectionView;

@end


#pragma mark - Class Variables


#pragma mark - Class Definition

@implementation ___FILEBASENAMEASIDENTIFIER___
{
}


#pragma mark - Properties


#pragma mark - Constructors


#pragma mark - Destructor

- (void)dealloc 
{
	// nil out delegates of any instance variables.
	_collectionView.delegate = nil;
	_collectionView.dataSource = nil;
}


#pragma mark - Public Methods


#pragma mark - Life Cycle

- (void)viewDidLoad
{
	// Call base implementation.
	[super viewDidLoad];
    [self _initializeCollectionView];

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
    _collectionView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    
    // arrange view layout
}

- (void)didReceiveMemoryWarning
{
	// Call base implementation.
	[super didReceiveMemoryWarning];
	
	// Free up any memory that can be recreated easily.
}


#pragma mark - Private Methods

- (void)_initializeCollectionView
{
    // Initialize tableview here.
    //following are example tableview initialization codes, change it by your case
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init]; // 自定义的布局对象
    
    layout.itemSize = CGSizeMake(100, 100);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                         collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerClass: [UICollectionViewCell class] forCellWithReuseIdentifier: CellReuseIdentifier];
    [self.view addSubview:_collectionView];
}


#pragma mark - UICollectionViewDataSource Methods

- (NSInteger)collectionView: (UICollectionView *)collectionView 
	numberOfItemsInSection: (NSInteger)section
{
	NSInteger numberOfItems = 0;
	
	if (collectionView == _collectionView)
	{
		// TODO: Return the correct number of items for the collection view.
	}
	
	return numberOfItems;
}

- (UICollectionViewCell *)collectionView: (UICollectionView *)collectionView 
	cellForItemAtIndexPath: (NSIndexPath *)indexPath
{
	UICollectionViewCell *cell = nil;
	
	if (collectionView == _collectionView)
	{
        cell = [collectionView dequeueReusableCellWithReuseIdentifier: CellReuseIdentifier
                                                         forIndexPath: indexPath];
	}
	
	return cell;
}


#pragma mark - UICollectionViewDelegate Methods

- (void)collectionView: (UICollectionView *)collectionView 
	didSelectItemAtIndexPath: (NSIndexPath *)indexPath
{
	if (collectionView == _collectionView)
	{
	}
}

#pragma mark - UICollectionViewDelegateFlowLayout Methods

- (CGSize)collectionView: (UICollectionView *)collectionView 
	layout: (UICollectionViewLayout *)collectionViewLayout 
	sizeForItemAtIndexPath: (NSIndexPath *)indexPath
{
	CGSize itemSize = CGSizeMake(collectionView.bounds.size.width, 44.0f);
	
	if (collectionView == _collectionView)
	{
	}
	
	return itemSize;
}

- (CGFloat)collectionView: (UICollectionView *)collectionView 
	layout: (UICollectionViewLayout*)collectionViewLayout 
	minimumLineSpacingForSectionAtIndex: (NSInteger)section
{
	CGFloat minimumLineSpacing = 0.0f;
	
	if (collectionView == _collectionView)
	{
	}
	
	return minimumLineSpacing;
}

- (CGFloat)collectionView: (UICollectionView *)collectionView 
	layout: (UICollectionViewLayout *)collectionViewLayout 
	minimumInteritemSpacingForSectionAtIndex: (NSInteger)section
{
	CGFloat minimumInteritemSpacing = 0.0f;
	
	if (collectionView == _collectionView)
	{
	}
	
	return minimumInteritemSpacing;
}


@end
