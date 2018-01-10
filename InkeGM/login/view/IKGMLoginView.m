//
//  IKGMLoginView.m
//  AutoLayoutTest
//
//  Created by mubin on 2017/11/12.
//  Copyright © 2017年 inke. All rights reserved.
//

#import <Masonry.h>
#import "IKGMBaseTooL.h"
#import "IKGMLoginView.h"

@interface IKGMLoginView()

@property (nonatomic ,strong)UIImageView *accountImageView;
@property (nonatomic ,strong)UIImageView *passWordImageView;

@property (nonatomic ,strong)UIView *accountLineView;
@property (nonatomic ,strong)UIView *passWordLineView;

@end

@implementation IKGMLoginView

- (instancetype)init{
    self = [super init];
    if(self)
    {
        [self configUI];
        [self layoutUI];
        [self.accountTextField resignFirstResponder];
        [self.passWordTextField resignFirstResponder];
        self.passWordTextField.secureTextEntry = YES;
    }
    
    return self;
}

- (void)configUI{
    [self addSubview:self.accountImageView];
    [self addSubview:self.passWordImageView];
    [self addSubview:self.accountTextField];
    [self addSubview:self.passWordTextField];
    [self addSubview:self.accountLineView];
    [self addSubview:self.passWordLineView];
}


- (void)layoutUI{
    [self.accountImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(25);
        make.left.equalTo(self.mas_left).offset(57.5);
        make.width.mas_equalTo(25);
        make.height.mas_equalTo(25);
    }];
    [self.accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.accountImageView.mas_right).offset(15);
        make.right.equalTo(self.mas_right).offset(-47.5);
        make.bottom.top.mas_equalTo(self.accountImageView);
    }];
    [self.accountLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(47.5);
        make.right.equalTo(self.mas_right).offset(-47.5);
        make.top.equalTo(self.accountImageView.mas_bottom).offset(14);
        make.height.mas_equalTo(0.5);
    }];
    [self.passWordImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.accountLineView.mas_bottom).offset(25);
        make.left.width.height.equalTo(self.accountImageView);
    }];
    [self.passWordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.height.equalTo(self.accountTextField);
        make.bottom.mas_equalTo(self.passWordImageView);
    }];
    [self.passWordLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.height.equalTo(self.accountLineView);
        make.top.equalTo(self.passWordImageView.mas_bottom).offset(14);
    }];
  
}

- (UIImageView *)accountImageView {
    if (!_accountImageView) {
        _accountImageView = [[UIImageView alloc]init];
        _accountImageView.image = [UIImage imageNamed:@"account"];
    }
    return _accountImageView;
}

- (UIImageView *)passWordImageView {
    if (!_passWordImageView) {
        _passWordImageView =[[UIImageView alloc]init];
        _passWordImageView.image = [UIImage imageNamed:@"password"];
    }
    return _passWordImageView;
}

- (UITextField *)accountTextField {
    if(!_accountTextField) {
        _accountTextField = [[UITextField alloc]init];
        _accountTextField.placeholder = @"输入映客邮箱";
        [_accountTextField setValue: k16RGBAColor(0xc58f00,0.6) forKeyPath:@"_placeholderLabel.textColor"];
        [ _accountTextField setValue:[UIFont systemFontOfSize:18] forKeyPath:@"_placeholderLabel.font"];
    }
    return _accountTextField;
}

- (UITextField *)passWordTextField {
    if(!_passWordTextField) {
        _passWordTextField = [[UITextField alloc]init];
        _passWordTextField.placeholder = @"输入映客邮箱密码";
        [_passWordTextField setValue:k16RGBAColor(0xc58f00,0.6) forKeyPath:@"_placeholderLabel.textColor"];
        [_passWordTextField setValue:[UIFont systemFontOfSize:18] forKeyPath:@"_placeholderLabel.font"];
        ;
    }
    return _passWordTextField;
}

- (UIView *)passWordLineView {
    if(!_passWordLineView)
    {
        _passWordLineView = [[UIView alloc]init];
        _passWordLineView.backgroundColor = k16RGBColor(0xeaaa00);
    }
    return _passWordLineView;
}

- (UIView *)accountLineView {
    if(!_accountLineView) {
        _accountLineView = [[UIView alloc]init];
        _accountLineView.backgroundColor = k16RGBColor(0xeaaa00);
    }
    return _accountLineView;
}



@end
