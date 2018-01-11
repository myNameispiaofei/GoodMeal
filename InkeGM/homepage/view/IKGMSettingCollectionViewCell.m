//
//  IKGMSettingCollectionViewCell.m
//  InkeGM
//
//  Created by mubin on 2018/1/11.
//  Copyright © 2018年 mubin. All rights reserved.
//
#import <Masonry.h>
#import "IKGMBaseTooL.h"
#import "IKMeCollectionViewItem.h"
#import "IKGMPushInfoManager.h"
#import "IKGMSettingCollectionViewCell.h"



@interface IKGMSettingCollectionViewCell ()

@property (nonatomic ,strong) UIImageView *leftIconImageView;
@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) UILabel *subTitleLabel;
@property (nonatomic ,strong) UILabel *centerLabel;
@property (nonatomic ,strong) UIButton *switchBtn;
@property (nonatomic ,strong) UIImageView *rightIconImageView;
@property (nonatomic ,strong) IKMeCollectionViewItem *currentModel;
@end
                                          



@implementation IKGMSettingCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (void)setSettingItem:(IKMeCollectionViewItem *)item {
    if (item) {
        self.currentModel = item;
        [self m_configUI];
    }
}



- (void)m_configUI {
    switch (self.currentModel.type) {
        case IKMeSettingBookRemind:
        case IKMeSettingReachRemind:
        {
            [self layouSwitchStyle];
        }
        break;
        
        case IKMeSettingRule:
        case IKMeSettingAdministrator: {
            [self layoutNormalStyle];
            
        }
        case IKMeSettingSignout:
        {
            [self layoutSingountStyle];
        }
        default:
            break;
    }
    
}
- (void)layoutLeftIconImageView {
    [self.leftIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(15);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.width.height.mas_equalTo(24);
    }];
    self.leftIconImageView.image = [UIImage imageNamed:self.currentModel.leftIconImageName];
}

- (void)layouSwitchStyle {
    [self.contentView addSubview:self.leftIconImageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.subTitleLabel];
    [self.contentView addSubview:self.switchBtn];
    [self layoutLeftIconImageView];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftIconImageView.mas_right).offset(10);
        make.top.mas_equalTo(self.contentView.mas_top).offset(10);
        make.height.mas_equalTo(16);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-60);
    }];
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.titleLabel);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(5);
        make.height.mas_equalTo (13);
    }];
    [self.switchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-15);
        make.centerY.mas_equalTo(self.contentView);
        make.width.mas_equalTo(45);
        make.height.mas_equalTo(25);
    }];
    self.titleLabel.text = self.currentModel.title;
    self.subTitleLabel.text = self.currentModel.subTitle;
    [self.switchBtn setBackgroundImage:[UIImage imageNamed:self.currentModel.righticonImageView] forState:UIControlStateNormal];
    
}

- (void)layoutNormalStyle {
    [self.contentView addSubview:self.leftIconImageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.rightIconImageView];
    [self layoutLeftIconImageView];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftIconImageView.mas_right).offset(10);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.height.mas_equalTo(16);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-60);
    }];
    [self.rightIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-15);
        make.centerY.mas_equalTo(self.contentView);
        make.width.mas_equalTo(11.5);
        make.height.mas_equalTo(11.5);
    }];
    self.titleLabel.text = self.currentModel.title;
    self.rightIconImageView.image = [UIImage imageNamed:self.currentModel.righticonImageView];
}

- (void)layoutSingountStyle {
    [self.contentView addSubview:self.centerLabel];
    [self.centerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.centerY.mas_equalTo(self.contentView);
        make.height.mas_equalTo(16);
    }];
    self.centerLabel.text = self.currentModel.centerTitle;
}



// 点击 事
- (void)clickSwitch {
    switch (self.currentModel.type) {
        case IKMeSettingBookRemind: {
            if(self.delegate &&[self.delegate respondsToSelector:(@selector(clikBookRemind))]) {
                [self.delegate clikBookRemind];
                NSString *imageName  =  [IKGMPushInfoManager sharedInstance].isBookRemain ? @"switch_on" : @"switch_off" ;
                [self.switchBtn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
            }
        }
        break;
        case IKMeSettingReachRemind:
        {
            if(self.delegate &&[self.delegate respondsToSelector:(@selector(clickReachRemind))]) {
                [self.delegate clickReachRemind];
                [self.delegate clikBookRemind];
                NSString *imageName  =  [IKGMPushInfoManager sharedInstance].isReachRemain ? @"switch_on" : @"switch_off" ;
                [self.switchBtn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
            }
        }
        break;
        case IKMeSettingRule :
        case IKMeSettingAdministrator :
        case IKMeSettingSignout :
        default:
            break;
    }
}



#pragma  - mark UI
- (UIButton *)switchBtn {
    if (!_switchBtn) {
        _switchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_switchBtn addTarget:self action:@selector(clickSwitch) forControlEvents:UIControlEventTouchUpInside];
    }
    return _switchBtn;
}

- (UIImageView *)rightIconImageView {
    if (!_rightIconImageView) {
        _rightIconImageView = [[UIImageView alloc]init];
    }
    return _rightIconImageView;
}

- (UIImageView *)leftIconImageView {
    if (!_leftIconImageView) {
        _leftIconImageView = [[UIImageView alloc]init];
    }
    return _leftIconImageView;
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = k16RGBColor(0x48371e);
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.text = @"";
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if(!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc]init];
        _subTitleLabel.font = [UIFont systemFontOfSize:13];
        _subTitleLabel.textColor = k16RGBColor(0x999999);
        _subTitleLabel.textAlignment = NSTextAlignmentLeft;
        _subTitleLabel.text = @"";
    }
    return _subTitleLabel;
}
- (UILabel *)centerLabel {
    if(!_centerLabel) {
        _centerLabel = [[UILabel alloc]init];
        _centerLabel.font = [UIFont systemFontOfSize:16];
        _centerLabel.textColor = k16RGBColor(0x48371e);
        _centerLabel.textAlignment = NSTextAlignmentCenter;
        _centerLabel.text = @"";
    }
    return _centerLabel;
}

@end
