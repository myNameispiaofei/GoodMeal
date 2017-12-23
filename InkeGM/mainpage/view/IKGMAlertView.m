//
//  IKGMAlertView.m
//  AutoLayoutTest
//
//  Created by mubin on 2017/11/17.
//  Copyright © 2017年 inke. All rights reserved.
//

#import <Masonry.h>
#import "IKGMBaseTooL.h"
#import "IKGMAlertView.h"


@interface IKGMAlertView ()
@property (nonatomic ,strong) UIButton *bookBtn ;
@property (nonatomic ,strong) UIButton *cancleBtn;
@property (nonatomic ,strong) UILabel  *tipsLabel;

@property (nonatomic ,strong) UILabel  *timeLable;
@property (nonatomic ,strong) UILabel  *goodmealLabel;
@property (nonatomic ,strong) UILabel  *numLable;


@end



@implementation IKGMAlertView

- (instancetype)initWithType:(IKGMAlertViewType)type {
    if(self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        [self configUI:type];
        [self layoutUI:type];
        
    }
    return  self;
    
}

- (void)configUI:(IKGMAlertViewType)type
{
    
    
    NSString *text = type ==IKGMAlertViewDeflute ? @"确认下单吗？" :@"宇宙卷饼～";
    UILabel  *tipsLabel = [[UILabel alloc]init];
    tipsLabel.text = text ;
    tipsLabel.font = [UIFont systemFontOfSize:18];
    tipsLabel.textColor = k16RGBColor(0x514f51);
    tipsLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:tipsLabel];
    self.tipsLabel = tipsLabel;
    if (type == IKGMAlertViewDeflute) {
        UIButton *bookBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
        [bookBtn setTitle:@"下单"forState:UIControlStateNormal];
        [bookBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        bookBtn.backgroundColor = k16RGBColor(0xf5a54e);
        bookBtn.layer.cornerRadius = 20;
        [bookBtn addTarget:self action:@selector(clickBookBtn) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview: bookBtn];
        self.bookBtn = bookBtn;
        
        UIButton *cancleBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
        [cancleBtn setTitle:@"取消"forState:UIControlStateNormal];
        [cancleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [cancleBtn addTarget:self action:@selector(clickCancleBtn) forControlEvents:UIControlEventTouchUpInside];
        cancleBtn.backgroundColor = k16RGBColor(0x3c5267);
        cancleBtn.layer.cornerRadius = 20;
        [self addSubview:cancleBtn];
        self.cancleBtn = cancleBtn;
        return;
    }
    if(type == IKGMAlertViewReslute) {
        UILabel  *timeLabel = [[UILabel alloc]init];
        timeLabel.text = @"19:30";
        timeLabel.font = [UIFont systemFontOfSize:24];
        [self addSubview:timeLabel];
        self.timeLable = timeLabel;
        
        UILabel  *goodmealLabel = [[UILabel alloc]init];
        goodmealLabel.text = @"映客直播晚餐";
        goodmealLabel.textAlignment = NSTextAlignmentRight;
        goodmealLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:goodmealLabel];
        self.goodmealLabel = goodmealLabel;
        
        UILabel  *numLable = [[UILabel alloc]init];
        numLable.text = @"";
        numLable.font = [UIFont systemFontOfSize:12];
        [self addSubview:numLable];
        self.numLable = numLable ;
        return;
    }
}

- (void)layoutUI:(IKGMAlertViewType)type {
    
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.left.equalTo(self.mas_left).offset(40);
        make.right.equalTo(self.mas_right).offset(-40);
        make.height.mas_equalTo(32.5);
        make.top.equalTo(self.mas_top).offset(67);
    }];
    if(type == IKGMAlertViewDeflute){
        [self.bookBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_centerX).offset(-6.25);
            make.bottom.equalTo(self.mas_bottom).offset(-22);
            make.width.mas_equalTo(115.5);
            make.height.mas_equalTo(40);
        }];
        [self.cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_centerX).offset(6.25);
            make.bottom.equalTo(self.mas_bottom).offset(-22);
            make.width.mas_equalTo(115.5);
            make.height.mas_equalTo(40);
        }];
        
        return;
    }
    if(type == IKGMAlertViewReslute) {
        [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(17.5);
            make.top.equalTo(self.mas_top).offset(15);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(33.5);
        }];
        
        [self.goodmealLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-20.5);
            make.centerY.equalTo(self.timeLable.mas_centerY);
            make.height.mas_equalTo(21);
            make.left.equalTo(self.timeLable.mas_right).offset(10);
        }];
    }
    
}

- (void)clickBookBtn {
    if(RES_OK(@selector(clickBookBtnAction))){
        [self.delegate clickBookBtnAction];
    }
}


- (void)clickCancleBtn {
    if(RES_OK(@selector(clickCancleBtnAction))) {
        [self.delegate clickCancleBtnAction];
    }
   
}

@end
