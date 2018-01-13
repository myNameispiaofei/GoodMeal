//
//  IKGMSurplusCollectionViewCell.h
//  InkeGM
//
//  Created by mubin on 2018/1/12.
//  Copyright © 2018年 mubin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IKGMSurplusModel;
typedef NS_ENUM(NSInteger ,IKGMSurplusCellType ){
    IKGSurplusCellGrayStyle = 0,
    IKGSurplusCellGetStyle,
    IKGSurplusCellGiveupStyle
};

@protocol IKGMSurplusCellDelegate <NSObject>

- (void)clickGetSurplusBtn;

- (void)clickGiveupSurplusBtn;

@end


@interface IKGMSurplusCollectionViewCell : UICollectionViewCell

@property (nonatomic,weak) id<IKGMSurplusCellDelegate>delegate;

- (void)setModel:(IKGMSurplusModel *)model;

@end
