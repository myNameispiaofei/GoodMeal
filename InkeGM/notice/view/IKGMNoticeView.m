//
//  IKGMNoticeView.m
//  AutoLayoutTest
//
//  Created by mubin on 2017/11/17.
//  Copyright © 2017年 inke. All rights reserved.
//

#import <Masonry.h>
#import "IKGMBaseTooL.h"
#import "IKGMNoticeView.h"

@interface IKGMNoticeView ()
@property (nonatomic , strong) UILabel  * tipsLabel;
@property (nonatomic , strong) UIButton * bookBtn;

@end

@implementation IKGMNoticeView

- (instancetype)init {
    if(self =[super init]) {
        self.backgroundColor = k16RGBColor(0xf5a54e);
        [self configUI];
        [self layoutUI];
    }
    return self;
}

- (void)configUI {
    UILabel * tipsLabel = [[UILabel alloc]init];
    tipsLabel.text = @"宝宝距离订餐截止还剩xx:xx:xx";
    tipsLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
    tipsLabel.textColor = [UIColor whiteColor];
    tipsLabel.backgroundColor =[UIColor clearColor];
    tipsLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview: tipsLabel];
    self.tipsLabel = tipsLabel;
    
    UIButton *bookBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [bookBtn setTitle:@"马上订餐" forState:UIControlStateNormal];
    bookBtn.backgroundColor = [UIColor clearColor];
    bookBtn.layer.borderWidth = 1;
    bookBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    bookBtn.layer.cornerRadius = 20;
    [self addSubview:bookBtn];
    self.bookBtn = bookBtn;
}

- (void)layoutUI {
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(62);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(21);
    }];
    
    [self.bookBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.equalTo(self.mas_bottom).offset(-24.5);
        make.width.mas_equalTo(147.5);
        make.height.mas_equalTo(40);
    }];
    
}



@end
