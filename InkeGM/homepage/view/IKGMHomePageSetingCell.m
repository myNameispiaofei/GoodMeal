//
//  IKGMHomePageSetingCell.m
//  AutoLayoutTest
//
//  Created by mubin on 2017/11/16.
//  Copyright © 2017年 inke. All rights reserved.
//
#import <Masonry.h>
#import "IKGMBaseTooL.h"
#import "IKGMHomePageSetingCell.h"

@interface IKGMHomePageSetingCell ()

@property (nonatomic ,strong) UILabel  *booklMealLabel;
@property (nonatomic ,strong) UILabel  *obtainMealLabel;
@property (nonatomic ,strong) UISwitch *booklMealSwitch;
@property (nonatomic ,strong) UISwitch *obtainMealSwitch;
@property (nonatomic ,strong) UIButton *changePassWordBtn;

@end

@implementation IKGMHomePageSetingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        [self configUI];
        [self layoutUI];
    }
    return self;
}


- (void)configUI {
    self.contentView.backgroundColor = k16RGBColor(0xD8D8D8);
    UILabel  *booklMealLabel = [[UILabel alloc]init];
    booklMealLabel.text = @"点餐提醒通知";
    booklMealLabel.textColor = k16RGBColor(0x747274);
    booklMealLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview: booklMealLabel];
    self.booklMealLabel = booklMealLabel;
    
    UILabel  *obtainMealLabel = [[UILabel alloc]init];
    obtainMealLabel.text = @"到餐提醒通知";
    obtainMealLabel.textColor = k16RGBColor(0x747274);
    obtainMealLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:obtainMealLabel];
    self.obtainMealLabel = obtainMealLabel;
    
    UISwitch *booklMealSwitch  = [[UISwitch alloc]init];
    [self.contentView addSubview:booklMealSwitch];
    self.booklMealSwitch = booklMealSwitch;
    
    
    UISwitch *obtainMealSwitch = [[UISwitch alloc]init];
    [self.contentView addSubview:obtainMealSwitch];
    self.obtainMealSwitch = obtainMealSwitch;
    
    
    UIButton *changePassWordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [changePassWordBtn setTitle:@"修改密码" forState:UIControlStateNormal];
    changePassWordBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [changePassWordBtn setTitleColor:k16RGBColor(0x747274) forState:UIControlStateNormal];
    changePassWordBtn.contentEdgeInsets = UIEdgeInsetsMake(0,-10, 0, 0);
    changePassWordBtn.backgroundColor= [UIColor clearColor];
    [changePassWordBtn addTarget:self action:@selector(clickChangePwdBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:changePassWordBtn];
    self.changePassWordBtn = changePassWordBtn;
    
    
    
}

- (void)layoutUI {
    [self.changePassWordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(22.5);
        make.height.mas_equalTo(21);
        make.width.mas_equalTo(70);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-11.5);
    }];
    [self.booklMealLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(14.5);
        make.left.equalTo(self.contentView.mas_left).offset(22.5);
        make.height.mas_equalTo(21);
        make.right.equalTo(self.booklMealSwitch.mas_left).offset(-10);
    }];
    [self.booklMealSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-19.5);
        make.width.mas_equalTo(53.5);
        make.height.mas_equalTo(27.5);
        make.centerY.equalTo(self.booklMealLabel.mas_centerY);
    }];
    [self.obtainMealLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.booklMealLabel.mas_bottom).offset(13);
        make.width.height.left.equalTo(self.booklMealLabel);
    }];
    [self.obtainMealSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.right.equalTo(self.booklMealSwitch);
        make.centerY.equalTo(self.obtainMealLabel.mas_centerY);
    }];
    
   
    
    
    
    
}

- (void)clickChangePwdBtn {
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
