//
//  IKGMCommonAlertHeaderView.m
//  InkeGM
//
//  Created by mubin on 2018/1/12.
//  Copyright © 2018年 mubin. All rights reserved.
//

#import "IKGMBaseTooL.h"
#import <Masonry.h>
#import "IKGMCommonAlertHeaderView.h"

@interface IKGMCommonAlertHeaderView ()

@property (nonatomic ,strong) UIImageView * tipIconImageView;
@property (nonatomic ,strong) UILabel * titleLabel;
@property (nonatomic ,strong) UILabel * subTitleLabel;

@end



@implementation IKGMCommonAlertHeaderView


- (instancetype)init {
    if (self = [super init]) {
        [self layoutUI];
    }
    return self;
}

- (void)layoutUI {
    [self addSubview:self.tipIconImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.subTitleLabel];
    [self.tipIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(self.mas_top).offset(40);
        make.width.height.mas_equalTo(60);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.tipIconImageView.mas_bottom).offset(20);
        make.left.right.mas_equalTo(self);
        make.height.mas_equalTo(16);
    }];
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(6);
        make.left.right.mas_equalTo(self);
        make.height.mas_equalTo(13);
    }];
}


- (UIImageView *)tipIconImageView {
    if(!_tipIconImageView) {
        _tipIconImageView = [[UIImageView alloc]init];
        _tipIconImageView.image = [UIImage imageNamed:@"success"];
    }
    return _tipIconImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"下单成功";
        _titleLabel.textColor = k16RGBColor(0x9d7200);
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc]init];
        _subTitleLabel.text = @"预计下午七点半到达";
        _subTitleLabel.textColor = k16RGBColor(0xddb856);
        _subTitleLabel.font = [UIFont systemFontOfSize:13];
        _subTitleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _subTitleLabel;
}

- (void)setStyle:(IKGMCommonHeaderStyle)type {
    if(type == IKGMCommonHeaderOrderType) {
       _subTitleLabel.text = @"预计下午七点半到达";
       _titleLabel.text = @"下单成功";
    }
    if(type == IKGMCommonHeaderSurplusType) {
        _subTitleLabel.text = @"请去三楼取餐";
        _titleLabel.text = @"餐已到达";
    }
}

@end
