//
//  IKGMRestaurantCollectionViewCell.m
//  InkeGM
//
//  Created by mubin on 2017/12/17.
//  Copyright © 2017年 mubin. All rights reserved.
//

#import <Masonry.h>
#import "IKGMRestaurantCollectionViewCell.h"
#import "IKGMRestaurantModel.h"

@interface IKGMRestaurantCollectionViewCell ()

@property (nonatomic ,strong) UILabel *restaurantNameLabel;
@property (nonatomic ,strong) UIView  *line;
@end

@implementation IKGMRestaurantCollectionViewCell


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        [self layoutUI];
    }
    return self;
}

-(void)layoutUI {
    self.restaurantNameLabel = [[UILabel alloc]init];
    [self.contentView addSubview: self.restaurantNameLabel];
    [self.restaurantNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.height.top.equalTo(self.contentView);
    }];
    self.restaurantNameLabel.text =  @"";
    self.line = [[UIView alloc]init];
    self.line.backgroundColor  =[UIColor yellowColor];
    [self.contentView addSubview:self.line];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.height.equalTo(self.contentView);
        make.width.mas_equalTo(2);
    }];
}

- (void)setRrestaurantModel:(IKGMRestaurantModel*)model {
    self.restaurantNameLabel.text = model.restaurantName;
}

@end
