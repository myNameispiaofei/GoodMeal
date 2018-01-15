//
//  IKGMStoreViewController.h
//  InkeGM
//
//  Created by mubin on 2018/1/9.
//  Copyright © 2018年 mubin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IKGMStoreViewControllerDelegae<NSObject>

- (void)changeStatusForClick:(NSInteger)storeIndex  dishIndex:(NSInteger)dishIndex;

- (void)clickBookDishBtn;

@end


@interface IKGMStoreViewController : UIViewController

@property (nonatomic , weak) id<IKGMStoreViewControllerDelegae>delegate;

- (instancetype)initWithRestaurantModel:(IKGMRestaurantModel *)model index:(NSInteger)index;

- (void)needReloadData;

@end
