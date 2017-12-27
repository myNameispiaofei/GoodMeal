//
//  IKGMHeaderCollectionViewCell.m
//  AutoLayoutTest
//
//  Created by mubin on 2017/11/21.
//  Copyright © 2017年 inke. All rights reserved.
//

#import <Masonry.h>
#import "IKGMHeaderCollectionViewCell.h"

@interface IKGMHeaderCollectionViewCell ()

@property (nonatomic ,strong) UILabel *numLabel;
@property (nonatomic ,strong) UILabel *dateLabel;
@property (nonatomic ,strong) UIView  *lineView;
@end

@implementation IKGMHeaderCollectionViewCell


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self layoutUI];
    }
    return self;
}

-(void)layoutUI {
    self.numLabel = [[UILabel alloc]init];
    [self.contentView addSubview: self.numLabel];
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.top.equalTo(self.contentView);
        make.height.mas_equalTo(27);
    }];
    self.dateLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.dateLabel];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.bottom.equalTo(self.contentView);
        make.top.equalTo(self.numLabel.mas_bottom);
    }];
    self.numLabel.text =  @"一";
    self.dateLabel.text = @"13";
    self.lineView = [[UIView alloc]init];
    self.lineView.backgroundColor  =[UIColor yellowColor];
    [self.contentView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.height.equalTo(self.contentView);
        make.width.mas_equalTo(2);
    }];
}

@end
