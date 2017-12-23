//
//  IKGMSurplusHeaderView.m
//  AutoLayoutTest
//
//  Created by mubin on 2017/11/17.
//  Copyright © 2017年 inke. All rights reserved.
//

#import <Masonry.h>
#import "IKGMBaseTooL.h"
#import "IKGMSurplusHeaderView.h"

@interface IKGMSurplusHeaderView()

@property (nonatomic ,strong) UILabel *surplusLabel;
@property (nonatomic ,strong) UILabel *providerLabel;
@property (nonatomic ,strong) UILabel *beneficiarybLabel;
@property (nonatomic ,strong) UIView  *divideLine;

@end


@implementation IKGMSurplusHeaderView

- (instancetype)init {
    if(self = [super init] ) {
        [self configUI];
        [self layoutUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self configUI];
        [self layoutUI];
      }
     return self;
}

- (void)configUI {
  
    UILabel *surplusLabel = [[UILabel alloc] init];
    surplusLabel.text = @"备餐";
    surplusLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
    [self addSubview:surplusLabel];
    self.surplusLabel = surplusLabel;

    
    UILabel *providerLabel = [[UILabel alloc] init];
    providerLabel.text = @"提供者";
    providerLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
    [self addSubview:providerLabel];
    self.providerLabel = providerLabel;
    
    UILabel *beneficiarybLabel = [[UILabel alloc] init];
    beneficiarybLabel.text = @"获得者";
    beneficiarybLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
    [self addSubview:beneficiarybLabel];
    self.beneficiarybLabel = beneficiarybLabel;
    
    UIView *divideLine = [[UIView alloc]init];
    divideLine.backgroundColor = k16RGBColor(0x979797);
    [self addSubview:divideLine];
    self.divideLine = divideLine;
}

- (void)layoutUI {
    [self.surplusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(44);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(21);
    }];
    
    [self.providerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.height.width.equalTo(self.surplusLabel);
//        make.width.mas_equalTo(50);
    }];
    
    [self.beneficiarybLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.height.width.equalTo(self.surplusLabel);
        make.right.equalTo(self.mas_right).offset(-44);
    }];
    [self.divideLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.bottom.equalTo(self);
        make.height.mas_equalTo(0.5);
    }];
    
}

        
        
@end
