//
//  IKGMSurplusModel.h
//  InkeGM
//
//  Created by mubin on 2018/1/13.
//  Copyright © 2018年 mubin. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger ,IKGMSurplusModelType ){
    IKGMSurplusModelGaryTyep = 0,
    IKGMSurplusModelGetStyle,
    IKGMSurplusModelGiveupType
};


@interface IKGMSurplusModel : NSObject
@property (nonatomic ,copy) NSString *storeName;
@property (nonatomic ,copy) NSString *dishName;
@property (nonatomic ,copy) NSString *subTitle;
@property (nonatomic ,copy) NSString *privoderName;
@property (nonatomic ,assign) IKGMSurplusModelType type;

@end
