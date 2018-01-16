//
//  IKGMCommonAlertHeaderView.h
//  InkeGM
//
//  Created by mubin on 2018/1/12.
//  Copyright © 2018年 mubin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger ,IKGMCommonHeaderStyle) {
    IKGMCommonHeaderOrderType = 0,
    IKGMCommonHeaderSurplusType
};


@interface IKGMCommonAlertHeaderView : UIView

- (void)setStyle:(IKGMCommonHeaderStyle)type;


@end
