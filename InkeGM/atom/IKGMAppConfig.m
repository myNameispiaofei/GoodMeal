//
//  IKGMAppConfig.m
//  InkeGM
//
//  Created by mubin on 2017/12/23.
//  Copyright © 2017年 mubin. All rights reserved.
//

#import "IKGMAppConfig.h"
#import <AdSupport/ASIdentifierManager.h>

@implementation IKGMAppConfig

+ (NSDictionary *)appDataDic {
    static NSDictionary *appDict = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appDict = [[NSBundle mainBundle] infoDictionary];
    });
    return appDict;
}


+ (NSString *)licenseCode {
    NSDictionary * dict = [self appDataDic];
    NSString *license = [dict valueForKey:@"app.license"];
    NSAssert(license != nil && [license isKindOfClass:[NSString class]], @"appconfig error");
    return license;
}

+ (NSString *)appClientVersion {
    NSDictionary *dict = [self appDataDic];
    NSString *version = [dict valueForKey:@"app.version"];
    NSAssert(version != nil && [version isKindOfClass:[NSString class]], @"appconfig error");
    return version;
}


+ (NSString *)appChannel {
    NSDictionary *dict = [self appDataDic];
    NSString *channel = [dict valueForKey:@"app.channel"];
    NSAssert(channel != nil && [channel isKindOfClass:[NSString class]], @"appconfig error");
    return channel;
}

+ (NSString *)appProtoVersion {
    NSDictionary *dict = [self appDataDic];
    NSString *version = [dict valueForKey:@"app.proto"];
    NSAssert(version != nil && [version isKindOfClass:[NSString class]], @"appconfig error");
    return version;
}

+ (NSString *)idfa {
    NSString * idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    return idfa;
}

@end
