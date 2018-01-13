//
//  IKGMDishTableViewCell.h
//  InkeGM
//
//  Created by mubin on 2018/1/9.
//  Copyright © 2018年 mubin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger,IKGMDishTableViewCellStyle) {
    IKGMDishCellNormalStyle = 0 ,
    IKGMDishCellClickStyle,
    IKGMDishCellForbidClickStyle
};

@class IKGMDishModel;

@interface IKGMDishTableViewCell : UITableViewCell

- (void)setDishModel:(IKGMDishModel *)model;
- (void)setCellStyle:(IKGMDishTableViewCellStyle)type;

@end
