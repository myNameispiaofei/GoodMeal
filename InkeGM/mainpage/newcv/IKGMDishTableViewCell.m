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
@property(nonatomic ,strong) UIImageView *clickImageView;

@end

@implementation IKGMDishTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if( self) {
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
        make.top.equalTo(self.dishTitleLabel.mas_bottom).offset(6);
        make.height.mas_equalTo(13);
    }];
    [self.contentView addSubview:self.clickImageView];
    [self.clickImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-25);
        make.width.height.mas_equalTo(16.25);
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

- (UIImageView *)clickImageView {
    if (!_clickImageView) {
        _clickImageView = [[UIImageView alloc]init];
        _clickImageView.image = [UIImage imageNamed:@"check_mark"];
    }
    return _clickImageView;
}


- (void)setDishModel:(IKGMDishModel *)model  {
    if (model) {
        NSRange range = [model.dishName rangeOfString:@"("];
        NSString *dishName = [model.dishName substringToIndex:range.location];
        NSString *subtitle = [model.dishName substringFromIndex:range.location+1];
        range = [subtitle  rangeOfString:@"/映客"];
        subtitle = [subtitle substringToIndex:range.location];
        self.dishTitleLabel.text = dishName;
        self.subTitleLable.text = subtitle;
    }
}

- (void)setCellStyle: (IKGMDishTableViewCellStyle) type {
    switch (type) {
        case IKGMDishCellNormalStyle :
        {
            _subTitleLable.textColor = k16RGBColor(0xc7bcac);
            _dishTitleLabel.textColor = k16RGBColor(0x48371e);
            _clickImageView.hidden = YES;
        }
        break;
        case IKGMDishCellClickStyle :
        {
            _subTitleLable.textColor = k16RGBColor(0xddb856);
            _dishTitleLabel.textColor = k16RGBColor(0xb48300);
            _clickImageView.hidden = NO;
        }
        break;
        case IKGMDishCellForbidClickStyle :
        {
            _subTitleLable.textColor = k16RGBColor(0x999999 );
            _dishTitleLabel.textColor = k16RGBColor(0x121203);
            _clickImageView.hidden = YES;
        }
        break;
            
        default:
            break;
    }
}

@end
