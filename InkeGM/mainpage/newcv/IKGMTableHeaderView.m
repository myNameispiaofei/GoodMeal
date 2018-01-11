//
//  IKGMTableHeaderView.m
//  InkeGM
//
//  Created by mubin on 2018/1/9.
//  Copyright © 2018年 mubin. All rights reserved.
//

#import <Masonry.h>
#import "IKGMBaseTooL.h"
#import "IKGMTableHeaderView.h"

@interface IKGMTableHeaderView()

@property(nonatomic ,strong) UIImageView *storeBgImageView;
@property(nonatomic ,strong) UILabel     *storeNameLabel;

@end

@implementation IKGMTableHeaderView

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
    [self addSubview:self.storeNameLabel];
    [self.storeBgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.equalTo(self.mas_left).offset(20);
        make.height.mas_equalTo(26.5);
    }];
    [self.storeNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.storeBgImageView.mas_left).offset(43);
        make.top.mas_equalTo(self.storeBgImageView);
        make.height.mas_equalTo(18);
        make.right.equalTo(self.mas_right).offset(-27);
    }];
}




@end
