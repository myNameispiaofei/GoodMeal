//
//  IKGMSurplusCollectionViewCell.m
//  InkeGM
//
//  Created by mubin on 2018/1/12.
//  Copyright © 2018年 mubin. All rights reserved.
//

#import "IKGMBaseTooL.h"
#import <Masonry.h>
#import "IKCommonDishView.h"
#import "IKGMSurplusCollectionViewCell.h"
#import "IKGMSurplusModel.h"

@interface IKGMSurplusCollectionViewCell ()

@property (nonatomic ,strong) IKCommonDishView * surplusDishView;
@property (nonatomic ,strong) UILabel *providerNameLabel;
@property (nonatomic ,strong) UIButton *surplusBtn;
@property (nonatomic ,strong) IKGMSurplusModel *surplusModel;

@end

@implementation IKGMSurplusCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
   
    }
    return self;
}

- (void)layoutUI {
    [self.contentView addSubview:self.surplusDishView];
    [self.surplusDishView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.contentView);
    }];
    [self.contentView addSubview:self.providerNameLabel];
    [self.providerNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(15);
        make.height.mas_equalTo(13);
        make.right.mas_equalTo(self.contentView.mas_centerX);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-23.5);
    }];
    [self.contentView addSubview:self.surplusBtn];
    [self.surplusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-15);
        make.centerY.mas_equalTo(self.providerNameLabel.mas_centerY);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
    }];
    [self.surplusBtn addTarget:self action:@selector(clickSurplusBtn) forControlEvents:UIControlEventTouchUpInside];
    self.surplusBtn.layer.cornerRadius = 3;
    self.surplusBtn.layer.masksToBounds = YES;
}

#pragma  - clickBtn action

- (void)clickSurplusBtn {
    if(self.surplusModel.type == IKGMSurplusModelGetStyle) {
        [self _clickGetSurplusBtn];
    }
    if(self.surplusModel.type == IKGMSurplusModelGiveupType) {
        [self _clickGiveupBtn];
    }
}

- (void) _clickGetSurplusBtn {
    if (self.delegate &&[self.delegate respondsToSelector:@selector(clickGetSurplusBtn)]) {
        [self.delegate clickGetSurplusBtn];
    }
}

- (void) _clickGiveupBtn {
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickGiveupSurplusBtn)]) {
        [self.delegate clickGiveupSurplusBtn];
    }
    
}



# pragma  - mark UI

- (UILabel *)providerNameLabel {
    if (!_providerNameLabel) {
        _providerNameLabel = [[UILabel alloc]init];
        _providerNameLabel.text = @"提供者: 安慕锦";
        _providerNameLabel.textColor = k16RGBColor(0xc7bcac);
        _providerNameLabel.font = [UIFont systemFontOfSize:13];
        _providerNameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _providerNameLabel;
}

- (IKCommonDishView *)surplusDishView {
    if (!_surplusDishView) {
        _surplusDishView = [[IKCommonDishView alloc]init];
    }
    return  _surplusDishView;
}

- (UIButton *)surplusBtn {
    if (!_surplusBtn) {
        _surplusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _surplusBtn;;
}

- (void)setStyle {
    switch (self.surplusModel.type) {
        case IKGMSurplusModelGiveupType:
        {
            [self.surplusBtn setTitle:@"放弃备餐" forState: UIControlStateNormal];
            self.surplusBtn.backgroundColor = k16RGBColor(0xfdd93c);
            [self.surplusBtn setTitleColor:k16RGBColor(0x48371e) forState:UIControlStateNormal];
        }
        break;
        case IKGMSurplusModelGetStyle:
        {
            [self.surplusBtn setTitle:@"抢备餐" forState: UIControlStateNormal];
            self.surplusBtn.backgroundColor = k16RGBColor(0xfdd93c);
            [self.surplusBtn setTitleColor:k16RGBColor(0x48371e) forState:UIControlStateNormal];
        }
        break;
        case IKGMSurplusModelGaryTyep:
        {
            [self.surplusBtn setTitle:@"抢备餐" forState: UIControlStateNormal];
            self.surplusBtn.backgroundColor = k16RGBColor(0xe2e0d6);
            [self.surplusBtn setTitleColor:k16RGBColor(0x948b79) forState:UIControlStateNormal];
            
        }
        break;
        default:
            break;
    }
    
}


- (void)setModel:(IKGMSurplusModel *)model {
    self.surplusModel = model;
    if(self.surplusModel) {
        self.contentView.backgroundColor = k16RGBColor(0xf5f4f0);
        [self layoutUI];
        [self initContent];
        [self setStyle];
    }
    
}

- (void)initContent {
    self.surplusDishView.storeNameLabel.text = self.surplusModel.storeName;
    self.surplusDishView.dishTitleLabel.text = self.surplusModel.dishName;
    self.surplusDishView.subTitleLable.text = self.surplusModel.subTitle;
    NSString *privoderName = [NSString stringWithFormat:@"提供者: %@",self.surplusModel.privoderName];
    self.providerNameLabel.text = privoderName;
}



@end
