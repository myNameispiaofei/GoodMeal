//
//  IKGMCommonAlertView.m
//  InkeGM
//
//  Created by mubin on 2018/1/12.
//  Copyright © 2018年 mubin. All rights reserved.
//


#import <Masonry.h>
#import "IKGMRestaurantModel.h"
#import "IKGMBaseTooL.h"
#import "IKCommonDishView.h"
#import "IKGMCommonAlertView.h"
#import "IKGMCommonAlertHeaderView.h"



@interface IKGMCommonAlertView ()

@property (nonatomic ,strong)IKGMCommonAlertHeaderView *headerView;
@property (nonatomic ,strong)IKCommonDishView *dishView;
@property (nonatomic ,strong)UIButton *commonBtn;
@property (nonatomic ,assign)IKGMCommonAlertType type;


@end


@implementation IKGMCommonAlertView

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        [self layoutUI];
    }
    return self;
}

- (void)setOrderModel:(IKGMOrderModel *)orderModel {
    [self.headerView setStyle:IKGMCommonHeaderOrderType];
    [self.dishView setOrderModel:orderModel];
    [self setAlertType:IKGMCommonAlertCancelDish];
}


- (void)setAlertType :(IKGMCommonAlertType)type {
    self.type = type;
    if(IKGMCommonAlertSurplus == type) {
        [_commonBtn setTitle:@"贡献为备餐" forState:UIControlStateNormal];
    }
    if(IKGMCommonAlertCancelDish == type) {
        [_commonBtn setTitle:@"取消订单" forState:UIControlStateNormal];
    }
}


#pragma  -mark  ButtonAction

- (void)clickCommonBtn {
    if(self.type == IKGMCommonAlertSurplus) {
        [self _clickSurplusBtn];
    }
    if(self.type == IKGMCommonAlertCancelDish) {
        [self _clickCancelDishBtn];
    }
}

- (void)_clickSurplusBtn {
    if(self.delegate && [self.delegate respondsToSelector:@selector(clickProvideDishbutton)]){
        [self.delegate clickProvideDishbutton];
    }
}

- (void)_clickCancelDishBtn {
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickCancelDishButton)]) {
        [self.delegate clickCancelDishButton];
    }
}

#pragma  - mark UI



- (void)layoutUI {
    [self addSubview:self.headerView];
    [self addSubview:self.dishView];
    [self addSubview:self.commonBtn];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.height.mas_equalTo(160);
    }];
    [self.dishView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(15);
        make.right.mas_equalTo(self.mas_right).offset(-15);
        make.height.mas_equalTo(103.5);
        make.top.mas_equalTo(self.headerView.mas_bottom).offset(30);
    }];
    [self.commonBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.dishView);
        make.top.mas_equalTo(self.dishView.mas_bottom).offset(40);
        make.height.mas_equalTo(49);
    }];
    [self.commonBtn addTarget:self action:@selector(clickCommonBtn) forControlEvents:UIControlEventTouchUpInside];
}


- (IKGMCommonAlertHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[IKGMCommonAlertHeaderView alloc]init];
    }
    return _headerView;
}

- (IKCommonDishView *)dishView {
    if (!_dishView) {
        _dishView = [[IKCommonDishView alloc]init];
        _dishView.layer.cornerRadius = 4;
        _dishView.layer.masksToBounds = YES;
    }
    return _dishView;
}

- (UIButton *)commonBtn {
    if (!_commonBtn) {
        _commonBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commonBtn setTitle:@"取消订单" forState:UIControlStateNormal];
        [_commonBtn setBackgroundColor:k16RGBColor(0x9d7200)];
        _commonBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _commonBtn.layer.cornerRadius = 6;
        _commonBtn.layer.masksToBounds = YES;
    }
    
    return _commonBtn;
}

@end
