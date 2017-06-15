//
//  {{args.Prefix}}PickerView.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/27.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}PickerView.h"
#import "{{args.Prefix}}PickerModel.h"
#import "UIView+Frame.h"
#import "UIView+{{args.Prefix}}Line.h"

@interface {{args.Prefix}}PickerView () <UIPickerViewDelegate,
                              UIPickerViewDataSource>

@property (nonatomic, strong) {{args.Prefix}}PickerModel *model;
@property (nonatomic, strong) NSMutableArray *allProvince;
@property (nonatomic, assign) NSInteger selectRowWithProvince;
@property (nonatomic, assign) NSInteger selectRowWithCity;
@property (nonatomic, assign) NSInteger selectRowWithTown;

@property (nonatomic, strong) UIPickerView *pickerView;

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIButton *sureButton;
@property (nonatomic, strong) UIButton *cancelButton;

@end

@implementation {{args.Prefix}}PickerView

#pragma mark - Life cycle.

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadData];
        [self loadSubviews];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _pickerView.width = SCREEN_WIDTH;
    _pickerView.height = 235;
    _pickerView.x = 0;
    _pickerView.bottom = self.height;
    
    _headerView.width = SCREEN_WIDTH;
    _headerView.height = 44;
    _headerView.x = 0;
    _headerView.bottom = _pickerView.y;
    
    _sureButton.width = 41;
    _sureButton.height = 23;
    _sureButton.middleY = _headerView.height / 2;
    _sureButton.tail = SCREEN_WIDTH - kRightMargin;
    
    _cancelButton.width = 41;
    _cancelButton.height = 23;
    _cancelButton.middleY = _headerView.height / 2;
    _cancelButton.x = kLeftMargin;
}


#pragma mark - load data.

- (void)loadData {
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"location.json" ofType:nil];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:jsonPath];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    _model = [{{args.Prefix}}PickerModel mj_objectWithKeyValues:dic];
    _allProvince= [self.model.province mutableCopy];
}


#pragma mark - load views.

- (void)loadSubviews {
    _pickerView = [[UIPickerView alloc] init];
    [self addSubview:_pickerView];
    _pickerView.backgroundColor = [UIColor whiteColor];
    _pickerView.dataSource = self;
    _pickerView.delegate = self;
    _pickerView.showsSelectionIndicator = NO;
    [_pickerView selectRow:0 inComponent:0 animated:YES];
    
    _headerView = [[UIView alloc] init];
    [self addSubview:_headerView];
    _headerView.backgroundColor = [UIColor whiteColor];
    [_headerView {{args.CategoryPrefix}}_addHorizontalBottomLineWithLeftMargin:0 rightMargin:0];
    
    _sureButton = [[UIButton alloc] init];
    [_headerView addSubview:_sureButton];
    [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
    [_sureButton setTitleColor:[UIColor colorWithRGBValue:kFisrtClassTitleTextColor] forState:UIControlStateNormal];
    _sureButton.titleLabel.font = [UIFont systemFontOfSize:14];
    _sureButton.layer.cornerRadius = 2;
    _sureButton.layer.masksToBounds = YES;
    _sureButton.layer.borderWidth = 1;
    _sureButton.layer.borderColor = [UIColor colorWithRGBValue:kLightTextColor].CGColor;
    
    _cancelButton = [[UIButton alloc] init];
    [_headerView addSubview:_cancelButton];
    [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [_cancelButton setTitleColor:[UIColor colorWithRGBValue:kLightTextColor] forState:UIControlStateNormal];
    _cancelButton.titleLabel.font = [UIFont systemFontOfSize:14];
    _cancelButton.layer.cornerRadius = 2;
    _cancelButton.layer.masksToBounds = YES;
    _cancelButton.layer.borderWidth = 1;
    _cancelButton.layer.borderColor = [UIColor colorWithRGBValue:kDefaultInputViewBackgroundColor].CGColor;
}


#pragma mark - UIPickerViewDelegate.

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:18];
    label.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    
    return label;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0){
        {{args.Prefix}}Province *province = self.allProvince[row];
        return province.name;
    }
    
    if (component == 1){
        {{args.Prefix}}Province *province = self.allProvince[self.selectRowWithProvince];
        {{args.Prefix}}City *city = province.city[row];
        return city.name;
    }
    if (component==2) {
        {{args.Prefix}}Province *province = self.allProvince[self.selectRowWithProvince];
        {{args.Prefix}}City *city = province.city[self.selectRowWithCity];
        {{args.Prefix}}District *dictrictObj=city.district[row];
        return dictrictObj.name;
    }
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        self.selectRowWithProvince = row;
        self.selectRowWithCity=0;
        [pickerView reloadComponent:1];
        [pickerView reloadComponent:2];
        [pickerView selectRow:0 inComponent:1 animated:YES];
        [pickerView selectRow:0 inComponent:2 animated:YES];
    } else if(component == 1){
        self.selectRowWithCity = row;
        [pickerView reloadComponent:2];
        [pickerView selectRow:0 inComponent:2 animated:YES];
    } else if(component == 2){
        self.selectRowWithTown = row;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return (SCREEN_WIDTH - 30)/3.0;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 50;
}


#pragma mark - UIPickerViewDataSource.

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    {{args.Prefix}}Province *province = self.allProvince[self.selectRowWithProvince];
    {{args.Prefix}}City *city = province.city[self.selectRowWithCity];
    if (component==0)
        return self.allProvince.count;
    if (component==1)
        return province.city.count;
    if (component==2)
        return city.district.count;
    
    return 0;
}

@end
