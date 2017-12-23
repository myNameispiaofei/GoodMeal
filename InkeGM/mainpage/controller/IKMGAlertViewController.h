//
//  IKMGAlertViewController.h
//  AutoLayoutTest
//
//  Created by mubin on 2017/11/17.
//  Copyright © 2017年 inke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IKGMAlertView.h"

@interface IKMGAlertViewController : UIViewController

@property (nonatomic , strong) IKGMAlertView * tipsAlertView;

- (instancetype)initWithType :(IKGMAlertViewType) type;
@end
