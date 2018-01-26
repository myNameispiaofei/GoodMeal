//
//  IKGMHttpRequsetManager.h
//  AutoLayoutTest
//
//  Created by mubin on 2017/12/2.
//  Copyright © 2017年 inke. All rights reserved.
//

#import <Foundation/Foundation.h>
@class IKGMLoginModel;
@class IKGMLogoutModel;
@class IKGMOrderModel;

typedef NS_ENUM(NSInteger,IKGMErrorCode){
    IKGMSUCCESS = 0,
    IKGMError = -1
};

@interface IKGMHttpRequsetManager : NSObject

typedef void (^IKGMLoginBlock)(NSInteger code);

typedef void (^IKGMOrderResult)(NSDictionary * resDict,IKGMErrorCode code);

typedef void (^IKGMRequestBlock)(NSDictionary * resDict,IKGMErrorCode code);

typedef void (^IKGMRequestMenu)(NSDictionary * resDict,IKGMErrorCode code);

+(instancetype)sharedInstance;

- (void)requsetWithLoginModel:(IKGMLoginModel*)loginModel complete:(IKGMLoginBlock)complete ;

- (void)requsetWithLogOutModel:(IKGMLogoutModel*)loginModel complete:(IKGMLoginBlock)complete;


- (void)requseMenu:(id)user  complete:(IKGMRequestMenu)complete;


- (void)orderGoodMeal:(IKGMOrderModel *)order complete:(IKGMOrderResult)complete;

- (void)cancelOreder:(id)user complete:(IKGMOrderResult)complete;


- (void)preparedish:(id)dish complete:(IKGMOrderResult)complete;

@end
