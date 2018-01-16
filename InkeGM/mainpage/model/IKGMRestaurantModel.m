//
//  IKGMRestaurantModel.m
//  InkeGM
//
//  Created by mubin on 2017/12/17.
//  Copyright © 2017年 mubin. All rights reserved.
//

#import "IKGMRestaurantModel.h"
#import <YYModel.h>

@implementation IKGMRestaurantModel


+(NSDictionary *) modelCustomPropertyMapper {
    return @{
             @"restaurantName":@"restaurantName",
             @"minDeliveryAmountInCent":@"minDeliveryAmountInCent",
             @"freightInCent":@"freightInCent",
             @"restaurantId":@"restaurantId",
             @"sectionList":@"sectionList",
             @"restaurantTel":@"restaurantTel",
             @"restaurantLongitude":@"restaurantLongitude",
             @"restaurantLatitude":@"restaurantLatitude"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"sectionList":[IKGMRestaurantSectionList class],
            };
}


@end


@implementation IKGMRestaurantSectionList

+(NSDictionary *) modelCustomPropertyMapper {
    return @{
             @"sectionName":@"sectionName",
             @"dishList":@"dishList",
             @"sectionId":@"sectionId"
            };
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"dishList":[IKGMDishModel class],
             };
}

@end

@implementation IKGMDishModel

+(NSDictionary *) modelCustomPropertyMapper {
    return @{
            @"dishName":@"dishName",
            @"dishId":@"dishId",
            @"boxPriceInCent":@"boxPriceInCent",
            @"priceInCent":@"priceInCent"
            };
}


@end

@implementation IKGMOrderModel

@end
