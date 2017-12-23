//
//  IKGMAlertView.h
//  AutoLayoutTest
//
//  Created by mubin on 2017/11/17.
//  Copyright © 2017年 inke. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum: NSInteger {
    
    IKGMAlertViewDeflute,
    
    IKGMAlertViewReslute
    
}IKGMAlertViewType;

@protocol IKGMAlertViewDelegate <NSObject>

- (void)clickBookBtnAction;

- (void)clickCancleBtnAction;

@end

@interface IKGMAlertView : UIView

@property(nonatomic , weak) id< IKGMAlertViewDelegate>delegate;

- (instancetype)initWithType:(IKGMAlertViewType)type;

@end
