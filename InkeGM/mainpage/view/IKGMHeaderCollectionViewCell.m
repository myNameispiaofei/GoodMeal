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

@property (nonatomic ,strong) UILabel *num;
@property (nonatomic ,strong) UIView  *line;
@end

@implementation IKGMHeaderCollectionViewCell


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        [self layoutUI];
    }
    return self;
}

-(void)layoutUI {
    self.num = [[UILabel alloc]init];
    [self.contentView addSubview: self.num];
    [self.num mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.height.top.equalTo(self.contentView);
    }];
    self.num.text =  @"QA";
    self.line = [[UIView alloc]init];
    self.line.backgroundColor  =[UIColor yellowColor];
    [self.contentView addSubview:self.line];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.height.equalTo(self.contentView);
        make.width.mas_equalTo(2);
    }];
}

@end
