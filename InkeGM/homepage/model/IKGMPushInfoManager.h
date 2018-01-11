//
//  IKGMPushInfoManager.h
//  InkeGM
//
//  Created by mubin on 2018/1/11.
//  Copyright © 2018年 mubin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IKGMPushInfoManager : NSObject


@property (nonatomic ,assign) BOOL isBookRemain;
@property (nonatomic ,assign) BOOL isReachRemain;

+ (instancetype)sharedInstance;

@end
