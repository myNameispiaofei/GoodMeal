//
//  IKGMDishTableViewCell.m
//  InkeGM
//
//  Created by mubin on 2018/1/9.
//  Copyright © 2018年 mubin. All rights reserved.
//

#import <Masonry.h>
#import "IKGMBaseTooL.h"
#import "IKGMDishTableViewCell.h"
#import "IKGMRestaurantModel.h"
@interface IKGMDishTableViewCell ()
@property(nonatomic ,strong) UILabel *dishTitleLabel;
@property(nonatomic ,strong) UILabel *subTitleLable;

@end

@implementation IKGMDishTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
}


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutUI];
    }
    return self;
}


-(void)layoutUI {
    [self.contentView addSubview: self.dishTitleLabel];
    [self.dishTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(30);
        make.top.equalTo(self.contentView).offset(8);
        make.height.mas_equalTo(16);
        make.right.mas_equalTo(self.contentView);
    }];
    [self.contentView addSubview:self.subTitleLable];
    [self.subTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.dishTitleLabel);
        make.top.equalTo(self.dishTitleLabel).offset(6);
        make.height.mas_equalTo(13);
    }];
}

- (UILabel *)dishTitleLabel {
    if (!_dishTitleLabel) {
        _dishTitleLabel = [[UILabel alloc]init];
        _dishTitleLabel.text = @"";
        _dishTitleLabel.textAlignment = NSTextAlignmentLeft;
        _dishTitleLabel.font = [UIFont systemFontOfSize:16];
        _dishTitleLabel.textColor = k16RGBColor(0x48371e);
    }
    return _dishTitleLabel;
}

- (UILabel*)subTitleLable {
    if (!_subTitleLable) {
        _subTitleLable = [[UILabel alloc]init];
        _subTitleLable.text = @"";
        _subTitleLable.textAlignment = NSTextAlignmentLeft;
        _subTitleLable.font = [UIFont systemFontOfSize:13];
        _subTitleLable.textColor = k16RGBColor(0xc7bcac);
    }
    return _subTitleLable;
}


- (void)setDishModel:(IKGMDishModel *)model {
    if (model) {
        NSRange range = [model.dishName rangeOfString:@"("];
        NSString *dishName = [model.dishName substringToIndex:range.location];
        NSString *subtitle = [model.dishName substringFromIndex:range.location];
        self.dishTitleLabel.text = dishName;
        self.subTitleLable.text = subtitle;
    }
}

@end
