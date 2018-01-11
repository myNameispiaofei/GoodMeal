//
//  IKGMStoreViewController.m
//  InkeGM
//
//  Created by mubin on 2018/1/9.
//  Copyright © 2018年 mubin. All rights reserved.
//
#import <Masonry.h>
#import "IKGMRestaurantModel.h"
#import "IKGMTableHeaderView.h"
#import "IKGMDishTableViewCell.h"
#import "IKGMStoreViewController.h"

static NSString *cellIdentifier = @"identifier" ;

@interface IKGMStoreViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *foodListTableView;
@property (nonatomic ,strong) IKGMRestaurantModel *model;

@end

@implementation IKGMStoreViewController

- (instancetype)initWithRestaurantModel:(IKGMRestaurantModel *)model {
    if (self = [super init]) {
        self.model = model;
    }
    return self;
}


- (void)viewDidLoad {
    [self configUI];
    self.foodListTableView.layer.cornerRadius = 6;
    self.foodListTableView.layer.masksToBounds = YES;
    
   
}

#pragma -mark tabelView datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.model.sectionList[0].dishList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IKGMDishTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[IKGMDishTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [cell setDishModel:self.model.sectionList[0].dishList[indexPath.row]];
    return cell;
}

#pragma -mark tableViewDelegate
// 可选 分段数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"Header"];
    if (!header) {
        header = [[IKGMTableHeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    }
    [(IKGMTableHeaderView *)header setStoreName:self.model.restaurantName];
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60;
}



#pragma -mark UI

- (void)configUI {
    [self.view addSubview:self.foodListTableView];
    [self.foodListTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.equalTo(self.view);
        make.left.equalTo(self.view.mas_left).offset(27);
        make.right.equalTo(self.view.mas_right).offset(-27);
    }];
}

- (UITableView *)foodListTableView {
    if (!_foodListTableView) {
        _foodListTableView = [[UITableView alloc]init];
        _foodListTableView.delegate = self;
        _foodListTableView.dataSource = self;
        _foodListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _foodListTableView;
}


@end
