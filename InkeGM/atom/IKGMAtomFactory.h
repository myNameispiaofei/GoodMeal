//
//  IKGMAtomFactory.h
//  InkeGM
//
//  Created by mubin on 2017/12/23.
//  Copyright © 2017年 mubin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface IKGMAtomInfo :NSObject

@property(copy, readonly, nonatomic) NSString *licenseCode;
@property(copy, readonly, nonatomic) NSString *channelCode;
@property(copy, readonly, nonatomic) NSString *clientVersion;
@property(copy, readonly, nonatomic) NSString *devi;
@property(copy, readonly, nonatomic) NSString *idfa;
@property(copy, readonly, nonatomic) NSString *idfv;
@property(copy, readonly, nonatomic) NSString *osVersion;
@property(copy, readonly, nonatomic) NSString *userAgent;
@property(copy, readonly, nonatomic) NSString *proto;
@property(copy, readonly, nonatomic) NSString *imei;
@property(copy, readonly, nonatomic) NSString *imsi;

@property (copy , atomic)  NSString * ticket;

@property (copy ,readonly ,nonatomic) NSString *query;

@end


@interface IKGMAtomFactory : NSObject

@property (nonatomic ,strong ,readonly) IKGMAtomInfo *atom;

+ (instancetype)sharedInstance;


- (NSString *)generateAtomParams;

- (NSDictionary *)atomDic;

@end
