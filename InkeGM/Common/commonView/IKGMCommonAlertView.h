//
//  IKGMCommonAlertView.h
//  InkeGM
//
//  Created by mubin on 2018/1/12.
//  Copyright © 2018年 mubin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  IKGMOrderModel;

typedef NS_ENUM(NSInteger,IKGMCommonAlertType) {
    IKGMCommonAlertSurplus = 0,
    IKGMCommonAlertCancelDish
} ;

@protocol IKGMCommonAlertViewDelegate<NSObject>

- (void)clickCancelDishButton;

- (void)clickProvideDishbutton;

@end


@interface IKGMCommonAlertView : UIView

@property (nonatomic , weak) id<IKGMCommonAlertViewDelegate>delegate;


- (void)setOrderModel:(IKGMOrderModel *)orderModel;

- (void)setAlertType :(IKGMCommonAlertType)type;


@end
