//
//  IKGMRestaurantModel.h
//  InkeGM
//
//  Created by mubin on 2017/12/17.
//  Copyright © 2017年 mubin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IKGMRestaurantSectionList ;

//
@interface IKGMRestaurantModel : NSObject

@property (nonatomic ,copy)    NSString *restaurantName;
@property (nonatomic ,assign)  NSInteger minDeliveryAmountInCent;
@property (nonatomic ,assign)  NSInteger freightInCent;
@property (nonatomic ,assign)  NSString *restaurantId;
@property (nonatomic ,strong)  NSArray <IKGMRestaurantSectionList *>* sectionList;
@property (nonatomic ,copy)    NSString *restaurantTel;
@property (nonatomic ,strong ) NSString *restaurantLongitude;
@property (nonatomic ,strong ) NSString *restaurantLatitude;

@end

//
@class IKGMDishModel;

@interface IKGMRestaurantSectionList : NSObject

@property (nonatomic ,copy)   NSString *sectionName;
@property (nonatomic ,strong) NSArray<IKGMDishModel*>* dishList;
@property (nonatomic ,strong) NSString *sectionId;

@end

@interface IKGMDishModel : NSObject

@property (nonatomic ,copy)   NSString * dishName;
@property (nonatomic ,assign) NSInteger dishId;
@property (nonatomic ,assign) NSInteger boxPriceInCent;
@property (nonatomic ,assign) NSInteger priceInCent;

@end

