//
//  IKGMUserManager.h
//  InkeGM
//
//  Created by mubin on 2017/12/28.
//  Copyright © 2017年 mubin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IKGMUserManager : NSObject

+(instancetype)sharedInstance;

@property (nonatomic ,copy)NSString *userName;
@property (nonatomic ,copy)NSString *ticket;
@property (nonatomic ,assign) NSInteger loginStatus;

@end
