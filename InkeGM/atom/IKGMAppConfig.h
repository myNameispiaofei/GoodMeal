//
//  IKGMAppConfig.h
//  InkeGM
//
//  Created by mubin on 2017/12/23.
//  Copyright © 2017年 mubin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IKGMAppConfig : NSObject

+ (NSString *)licenseCode;

+ (NSString *)appClientVersion;

+ (NSString *)appChannel;

+ (NSString *)appProtoVersion;

+ (NSString *)idfa;

+ (NSString *)enterUrl;

@end
