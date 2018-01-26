//
//  IKGMHomeHeaderView.m
//  InkeGM
//
//  Created by mubin on 2018/1/11.
//  Copyright © 2018年 mubin. All rights reserved.
//
#import "IKGMUserManager.h"
#import "IKGMBaseTooL.h"
#import <Masonry.h>
#import "IKGMHomeHeaderView.h"
#import "IKGMMeWaveAnimationView.h"

@interface IKGMHomeHeaderView ()
@property (nonatomic ,strong) UIImageView *portraitImageView;
@property (nonatomic ,strong) UILabel *nickNameLabel;
@property (nonatomic ,strong) UILabel *emailLable;


@property (nonatomic, strong) CADisplayLink *waveDisplaylink;
@property (nonatomic, strong) CAShapeLayer *firstWaveLayer;
@property (nonatomic, strong) CAShapeLayer *secondWaveLayer;








@end

@implementation IKGMHomeHeaderView

- (instancetype)init {
    if (self = [super init]) {
        [self layoutUI];
        self.backgroundColor = k16RGBColor(0xfdd93c);
    }
    return self;
}

- (void)startWave {
    IKGMMeWaveAnimationView *waveView = [IKGMMeWaveAnimationView new];
    [waveView setClipsToBounds:YES];
    
    [self addSubview:waveView];
    
    [waveView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).offset(30);
        make.height.equalTo(@100);
        make.width.mas_equalTo(300);
    }];
    
    [self layoutIfNeeded];
    [self setNeedsLayout];
    
    [waveView setUp];
    
}

- (void)layoutUI {
    [self addSubview:self.portraitImageView];
    [self addSubview:self.nickNameLabel];
    [self addSubview:self.emailLable];
    [self.portraitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(44);
        make.left.mas_equalTo(self.mas_left).offset(18);
        make.width.height.mas_equalTo(80);
    }];
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.portraitImageView.mas_right).offset(18);
        make.top.equalTo(self.mas_top).offset(60);
        make.height.mas_equalTo(23);
        make.right.mas_equalTo(self.mas_right).offset(-18);
    }];
    [self.emailLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.nickNameLabel);
        make.top.mas_equalTo(self.nickNameLabel.mas_bottom).offset(8);
        make.height.mas_equalTo(15);
    }];
}








#pragma  -mark UI

- (UILabel *)emailLable {
    if (!_emailLable) {
        _emailLable = [[UILabel alloc]init];
        _emailLable.textColor = k16RGBColor(0x48371e);
        _emailLable.font = [UIFont systemFontOfSize:15];
        _emailLable.textAlignment = NSTextAlignmentLeft;
        _emailLable.text = [[IKGMUserManager sharedInstance].userName stringByAppendingString:@"@inke.cn"];
    }
    return  _emailLable;
}

- (UIImageView *)portraitImageView {
    if (!_portraitImageView) {
        _portraitImageView = [[UIImageView alloc]init];
        _portraitImageView.backgroundColor = k16RGBColor(0x00d8c9);
        _portraitImageView.layer.cornerRadius = 40;
        _portraitImageView.layer.masksToBounds = YES;
    }
    return  _portraitImageView;
}

- (UILabel *)nickNameLabel {
    if (!_nickNameLabel) {
        _nickNameLabel = [[UILabel alloc]init];
        _nickNameLabel.textColor = k16RGBColor(0x48371e);
        _nickNameLabel.font = [UIFont systemFontOfSize:23];
        _nickNameLabel.textAlignment = NSTextAlignmentLeft;
        _nickNameLabel.text = [IKGMUserManager sharedInstance].userName;
    }
    return _nickNameLabel;
}











@end
