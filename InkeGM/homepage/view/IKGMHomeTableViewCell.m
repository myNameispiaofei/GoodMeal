//
//  IKGMHomeTableViewCell.m
//  AutoLayoutTest
//
//  Created by mubin on 2017/11/12.
//  Copyright © 2017年 inke. All rights reserved.
//

#import <Masonry.h>
#import "IKGMBaseTooL.h"
#import "IKGMHomeTableViewCell.h"
@interface IKGMHomeTableViewCell ()

@property(nonatomic ,strong) UILabel     *titleLabel;
@property(nonatomic ,strong) UIImageView *markIconImage;
@property(nonatomic ,assign) BOOL         expand;
@property(nonatomic ,strong) UIView      *divideLine;
@property(nonatomic ,strong) UIView      *divideTopLine;
@end

@implementation IKGMHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
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
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textColor = k16RGBColor(0x333333);
    titleLabel.text = @"";
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UIImageView *markIconImage = [[UIImageView alloc]init];
    markIconImage.image = [UIImage imageNamed:@""];
    markIconImage.backgroundColor = [UIColor redColor];
    [self.contentView addSubview: markIconImage];
    self.markIconImage = markIconImage;
    
    UIView *divideLine = [[UIView alloc]init];
    divideLine.backgroundColor = k16RGBColor(0x979797);
    [self.contentView addSubview:divideLine];
    self.divideLine = divideLine;
    
    UIView *divideTopLine = [[UIView alloc]init];
    divideTopLine.backgroundColor = k16RGBColor(0x979797);
    [self.contentView addSubview:divideTopLine];
    self.divideTopLine = divideTopLine;
    self.divideTopLine.hidden =YES;
}

- (void)layoutUI{
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(100);
        make.left.equalTo(self.contentView.mas_left).offset(22.5);
    }];
    
    [self.markIconImage  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-16);
        make.width.height.mas_equalTo(15);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    [self.divideLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.divideTopLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.top.equalTo(self.contentView);
        make.height.mas_equalTo(0.5);
    }];
}



-(void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
}



-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    
}


- (void)setContentTitle:(NSString *)title{
    self.textLabel.text = title;
}

- (void)changeMarkIcon:(BOOL)expand {
    if(expand) {
        self.markIconImage.backgroundColor = [UIColor orangeColor];
    }else {
        self.markIconImage.backgroundColor = [UIColor redColor];
    }
}



- (void)showTopLine {
    self.divideTopLine.hidden = NO;
}



@end
