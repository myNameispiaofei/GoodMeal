//
//  IKCommonDishView.m
//  InkeGM
//
//  Created by mubin on 2018/1/12.
//  Copyright © 2018年 mubin. All rights reserved.
//
#import "IKGMBaseTooL.h"
#import <Masonry.h>
#import "IKCommonDishView.h"

@interface IKCommonDishView ()

@property(nonatomic ,strong) UIImageView *storeBgImageView;

@end


@implementation IKCommonDishView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self layoutUI];
        self.backgroundColor = k16RGBColor(0xffffff);
    }
    return self;
}


- (void)setStoreName:(NSString *)title {
    self.storeNameLabel.text = title;
}



- (UIImageView *)storeBgImageView {
    if(!_storeBgImageView) {
        _storeBgImageView = [[UIImageView alloc]init];
        _storeBgImageView.image = [UIImage imageNamed:@"store_bg"];
    }
    return _storeBgImageView;
}

- (UILabel *)storeNameLabel {
    if (!_storeNameLabel) {
        _storeNameLabel = [[UILabel alloc]init];
        _storeNameLabel.text = @"";
        _storeNameLabel.textColor = k16RGBColor(0xb48300);
        _storeNameLabel.font = [UIFont systemFontOfSize:19];
        _storeNameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _storeNameLabel;
}

- (void)layoutUI {
    [self addSubview:self.storeBgImageView];
    
    [self.storeBgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(15);
        make.left.equalTo(self.mas_left).offset(15);
        make.height.mas_equalTo(23);
    }];
    
    [self addSubview:self.storeNameLabel];
    [self.storeNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.storeBgImageView.mas_left).offset(48);
        make.top.mas_equalTo(self.storeBgImageView);
        make.height.mas_equalTo(18);
        make.right.equalTo(self.mas_right).offset(-27);
    }];
    
    [self addSubview: self.dishTitleLabel];
    [self.dishTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.storeBgImageView).offset(15);
        make.top.equalTo(self).offset(8);
        make.height.mas_equalTo(16);
        make.right.mas_equalTo(self);
    }];
    [self addSubview:self.subTitleLable];
    [self.subTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.dishTitleLabel);
        make.top.equalTo(self.dishTitleLabel.mas_bottom).offset(6);
        make.height.mas_equalTo(13);
    }];
}

- (UILabel *)dishTitleLabel {
    if (!_dishTitleLabel) {
        _dishTitleLabel = [[UILabel alloc]init];
        _dishTitleLabel.text = @"番茄红锅";
        _dishTitleLabel.textAlignment = NSTextAlignmentLeft;
        _dishTitleLabel.font = [UIFont systemFontOfSize:16];
        _dishTitleLabel.textColor = k16RGBColor(0x48371e);
    }
    return _dishTitleLabel;
}

- (UILabel*)subTitleLable {
    if (!_subTitleLable) {
        _subTitleLable = [[UILabel alloc]init];
        _subTitleLable.text = @"原汤／配米饭&巴沙鱼&鱼丸&配菜";
        _subTitleLable.textAlignment = NSTextAlignmentLeft;
        _subTitleLable.font = [UIFont systemFontOfSize:13];
        _subTitleLable.textColor = k16RGBColor(0xc7bcac);
    }
    return _subTitleLable;
}




@end
