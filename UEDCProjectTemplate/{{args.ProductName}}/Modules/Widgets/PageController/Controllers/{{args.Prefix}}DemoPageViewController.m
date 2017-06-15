//
//  {{args.Prefix}}DemoPageViewController.m
//
//  Created by {{args.Author}} on 2017/5/12.
//    Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}DemoPageViewController.h"
#import "UIView+Frame.h"

@interface {{args.Prefix}}DemoPageViewController ()
@property (nonatomic, assign) NSUInteger index;

@end

@implementation {{args.Prefix}}DemoPageViewController

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil withIndex:(NSUInteger)index
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        _index = index;
    }
    
    return self;
}


#pragma mark --- Life Cycle ---

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
    
//    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
//    l.text = [NSString stringWithFormat:@"%lud", _index];
//    l.font = [UIFont systemFontOfSize:15];
//    l.textColor = [UIColor redColor];
//    
//    [self.view addSubview:l];

}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    // 若要修改tableview／refreshview／loadmoreview的frame，在这里修改
}

#pragma mark --- loadSubViews ---

- (void)loadSubviews{
    
}


@end

