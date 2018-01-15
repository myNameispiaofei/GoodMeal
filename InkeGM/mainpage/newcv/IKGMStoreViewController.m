//
//  IKGMStoreViewController.m
//  InkeGM
//
//  Created by mubin on 2018/1/9.
//  Copyright © 2018年 mubin. All rights reserved.
//
#import <Masonry.h>
#import "IKGMBaseTooL.h"
#import "IKGMRestaurantModel.h"
#import "IKGMTableHeaderView.h"
#import "IKGMDishTableViewCell.h"
#import "IKGMStoreViewController.h"

static NSString *cellIdentifier = @"identifier" ;

@interface IKGMStoreViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *foodListTableView;
@property (nonatomic ,strong) IKGMRestaurantModel *model;
@property (nonatomic ,assign) NSInteger indexAtStoreList;
@property (nonatomic ,strong) UIButton *bookDishBtn;
@property (nonatomic ,strong) UIView *contentView;

@end

@implementation IKGMStoreViewController

- (instancetype)initWithRestaurantModel:(IKGMRestaurantModel *)model index:(NSInteger)index {
    if (self = [super init]) {
        self.model = model;
        self.indexAtStoreList = index;
    }
    return self;
}


- (void)viewDidLoad {
    [self configUI];
   
    self.contentView.layer.cornerRadius = 6;
    self.contentView.layer.masksToBounds = YES;
    
   
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self showBookbutton];
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
    switch (self.model.type) {
        case IKGMStoreClickType:
        {
            if(indexPath.row == self.model.clickDishIndex){
               [cell setCellStyle:IKGMDishCellClickStyle];
            }else{
              [cell setCellStyle:IKGMDishCellForbidClickStyle];
            }
        }
        break;
        case IKGMStoreForbidClickType :
        {
            [cell setCellStyle:IKGMDishCellForbidClickStyle];
        }
        break;
        case IKGMStoreNormalType:
        {
            [cell setCellStyle:IKGMDishCellNormalStyle];
        }
        break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(self.delegate &&[self.delegate respondsToSelector:(@selector(changeStatusForClick:dishIndex:))]) {
        [self.delegate changeStatusForClick:self.indexAtStoreList dishIndex:indexPath.row];
    }
    
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


- (void)clickBookBtn {
    if(self.delegate && [self.delegate respondsToSelector:@selector(clickBookDishBtn)]) {
        [self.delegate clickBookDishBtn];
    }
}


#pragma -mark UI

- (void)configUI {
    [self.view addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.equalTo(self.view);
        make.left.equalTo(self.view.mas_left).offset(27);
        make.right.equalTo(self.view.mas_right).offset(-27);
        
    }];
    [self.contentView addSubview:self.foodListTableView];
    [self.foodListTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.mas_equalTo(self.contentView);
    }];
    [self.contentView addSubview:self.bookDishBtn];
    [self.bookDishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-15);
        make.height.mas_equalTo(49);
    }];
    self.bookDishBtn.hidden = YES;
}

- (UIView *)contentView {
    if( !_contentView) {
        _contentView = [[UIView alloc]init];
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
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

- (UIButton *)bookDishBtn {
    if (!_bookDishBtn) {
        _bookDishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bookDishBtn setTitle:@"下单" forState:UIControlStateNormal];
        [_bookDishBtn setTitleColor:k16RGBColor(0xffffff) forState:UIControlStateNormal];
        _bookDishBtn.backgroundColor = k16RGBColor(0x9d7200);
        _bookDishBtn.layer.cornerRadius = 6;
        _bookDishBtn.layer.masksToBounds = YES;
        [_bookDishBtn addTarget:self action:@selector(clickBookBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bookDishBtn;
}


- (void)needReloadData {
    if(self.foodListTableView) {
        [self showBookbutton];
        [self.foodListTableView reloadData];
    }
}

- (void)showBookbutton {
    
    if( IKGMStoreClickType == self.model.type) {
        CGRect frame = self.foodListTableView.frame;
        frame.size.height = self.contentView.frame.size.height - 65;
        [self.foodListTableView setFrame:frame];
        _bookDishBtn.hidden = NO;
    }
    else{
         CGRect frame = self.foodListTableView.frame;
        frame.size.height = self.contentView.frame.size.height;
        [self.foodListTableView setFrame:frame];
        _bookDishBtn.hidden = YES;
    }

}

@end
