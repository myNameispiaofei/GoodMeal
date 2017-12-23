//
//  IKGMMainPageDateButton.m
//  AutoLayoutTest
//
//  Created by mubin on 2017/11/17.
//  Copyright © 2017年 inke. All rights reserved.
//
#import <Masonry.h>
#import "IKGMBaseTooL.h"
#import "IKGMMainPageDateButton.h"
@interface IKGMMainPageDateButton ()
@property (nonatomic ,strong) UILabel *dateLabel;
@property (nonatomic ,strong) UILabel *numLabel;
@property (nonatomic ,assign) NSUInteger *index;
@end


@implementation IKGMMainPageDateButton

- (instancetype)init {
    if(self = [super init])
    {
        [self configUI];
        [self layoutUI];
    }
    return  self;
}

- (void)configUI {
    UILabel *dateLabel = [[UILabel alloc]init];
   dateLabel.text =@"";
    [self addSubview:dateLabel];
    self.dateLabel = dateLabel;
    
    UILabel *numLabel =[[UILabel alloc]init];
    numLabel.text = @"";
    [self addSubview:numLabel];
    self.numLabel = numLabel;
    
    
}

- (void)layoutUI {
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.height.mas_equalTo(21);
        make.centerY.equalTo(self.mas_centerX).offset(-2);
    }];
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerX.equalTo(self.mas_centerX);
        make.width.height.equalTo(self.dateLabel);
        make.centerY.equalTo(self.mas_centerY).offset(2);
    }];
    [self setstyle];
}

- (void)setstyle {
    self.dateLabel.font = [UIFont systemFontOfSize:15];
    self.dateLabel.textColor = k16RGBColor(0xbbbbbb);
    self.numLabel.font = [UIFont systemFontOfSize:15];
    self.numLabel.textColor = k16RGBColor(0xbbbbbb);
    self.backgroundColor = [UIColor whiteColor];
}

- (void) setDateAndNum:(NSString *)date num:(NSString *)num{
    self.dateLabel.text = date;
    self.numLabel.text = num;
}

-(void)changeStype {
    self.dateLabel.font = [UIFont systemFontOfSize:15];
    self.dateLabel.textColor = [UIColor whiteColor];
    self.numLabel.font = [UIFont systemFontOfSize:15];
    self.numLabel.textColor = [UIColor whiteColor];
    self.backgroundColor = k16RGBColor(0xf5a54e);
}

//- (NSInteger)getIndex{
//    return  index;
//}
//
//- (void)setIndex :(NSInteger)index{
//    self.index = index;
//}
@end
