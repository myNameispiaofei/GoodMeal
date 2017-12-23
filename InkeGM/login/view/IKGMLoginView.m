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

@property (nonatomic ,strong)UILabel *accountLable;
@property (nonatomic ,strong)UILabel *passWordLable;

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
    [self addSubview:self.accountLable];
    [self addSubview:self.passWordLable];
    [self addSubview:self.accountTextField];
    [self addSubview:self.passWordTextField];
    [self addSubview:self.accountLineView];
    [self addSubview:self.passWordLineView];
}


- (void)layoutUI{
    [self.accountLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(25);
        make.left.equalTo(self.mas_left).offset(39);
        make.width.mas_equalTo(73/2);
        make.height.mas_equalTo(25);
    }];
    [self.accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.accountLable.mas_right).offset(3);
        make.right.equalTo(self.mas_right).offset(-19);
        make.bottom.top.mas_equalTo(self.accountLable);
    }];
    [self.accountLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.accountLable);
        make.width.equalTo(self.accountTextField);
        make.top.equalTo(self.accountLable.mas_bottom).offset(4.5);
        make.height.mas_equalTo(0.5);
    }];
    [self.passWordLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.accountLineView.mas_bottom).offset(25);
        make.left.width.height.equalTo(self.accountLable);
    }];
    [self.passWordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.height.equalTo(self.accountTextField);
        make.bottom.mas_equalTo(self.passWordLable);
    }];
    [self.passWordLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.height.equalTo(self.accountLineView);
        make.top.equalTo(self.passWordLable.mas_bottom).offset(4.5);
    }];
  
}

- (UILabel *)accountLable {
    if(!_accountLable)
    {
        _accountLable =[[UILabel alloc]init];
        _accountLable.text = @"账户";
        _accountLable.textColor = [UIColor whiteColor];
    }
    return _accountLable;
}

- (UILabel *)passWordLable {
    if(!_passWordLable)
    {
        _passWordLable =[[UILabel alloc]init];
        _passWordLable.text = @"密码";
        _passWordLable.textColor = [UIColor whiteColor];
    }
    return _passWordLable;
}

- (UITextField *)accountTextField {
    if(!_accountTextField) {
        _accountTextField = [[UITextField alloc]init];
    }
    return _accountTextField;
}

- (UITextField *)passWordTextField {
    if(!_passWordTextField) {
        _passWordTextField = [[UITextField alloc]init];
    }
    return _passWordTextField;
}

- (UIView *)passWordLineView {
    if(!_passWordLineView)
    {
        _passWordLineView = [[UIView alloc]init];
        _passWordLineView.backgroundColor = k16RGBColor(0x979797);
    }
    return _passWordLineView;
}

- (UIView *)accountLineView {
    if(!_accountLineView) {
        _accountLineView = [[UIView alloc]init];
        _accountLineView.backgroundColor = k16RGBColor(0x979797);
    }
    return _accountLineView;
}



@end
