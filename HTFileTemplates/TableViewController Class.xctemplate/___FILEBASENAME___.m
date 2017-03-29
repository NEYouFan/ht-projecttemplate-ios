//
//  ___VARIABLE_ControllerName:identifier___.m
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import "___VARIABLE_ControllerName:identifier___.h"
#import "___VARIABLE_CellModelClass:identifier___.h"
#import "___VARIABLE_CellType:identifier___.h"
#import "UITableView+FDTemplateLayoutCell.h"

@implementation ___VARIABLE_ControllerName:identifier___

#pragma mark --- Life Cycle ---

- (void)viewDidLoad {
    [super viewDidLoad];
    //to do: 设置页面title
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    // 若要修改tableview／refreshview／loadmoreview的frame，在这里修改
}

#pragma mark --- Override BaseTableViewController Methods ---

/**
 初始化HTTableViewDataSourceDelegate配置，tableview注册cell。 （refreshView/loadmoreView/statusView均已由基类完成）
 */
- (void)loadSubviews{
    [super loadSubviews];
    
    // HTTableViewDataSourceDelegate 的详细使用请参考模板说明文档
    self.dataSource =
    [HTTableViewDataSourceDelegate dataSourceWithModel:self.listDatas
                                           cellTypeMap:@{NSStringFromClass([___VARIABLE_CellModelClass:identifier___ class]): NSStringFromClass([___VARIABLE_CellType:identifier___ class])}
                                     tableViewDelegate:self
                                     cellConfiguration:^(___VARIABLE_CellType:identifier___ *cell, id model, NSIndexPath *indexPath) {
                                         cell.fd_enforceFrameLayout = YES;
                                         cell.model = model;
                                     }];
    [self.tableView registerClass:[___VARIABLE_CellType:identifier___ class] forCellReuseIdentifier:NSStringFromClass([___VARIABLE_CellType:identifier___ class])];
    self.tableView.delegate = self.dataSource;
    self.tableView.dataSource = self.dataSource;
}

- (HTBaseRequest *)configRequest{
   //to do: 初始化该页面对应的请求接口
}

- (void)onSuccessResponseWithData:(RKMappingResult *)mappingResult
                    withOperation:(RKObjectRequestOperation *)opration{
   //to do: 处理成功回调的数据
}

#pragma mark --- UITableViewDelegate ---

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // to do: cell clicked handle
}
@end

