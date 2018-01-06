//
//  IKMGAlertViewController.h
//  AutoLayoutTest
//
//  Created by mubin on 2017/11/17.
//  Copyright © 2017年 inke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IKGMAlertView.h"

@protocol IKMGAlertViewControllerDelegate

- (void)clickBookBtn;

- (void)clickCancleBtn;

@end

@interface IKMGAlertViewController : UIViewController

@property (nonatomic , strong) IKGMAlertView * tipsAlertView;
@property (nonatomic ,weak) id <IKMGAlertViewControllerDelegate>delegate;

- (instancetype)initWithType :(IKGMAlertViewType) type;
- (void)setTitel:(NSString *)resName ;

@end
