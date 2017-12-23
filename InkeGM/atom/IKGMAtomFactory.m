//
//  IKGMAtomFactory.m
//  InkeGM
//
//  Created by mubin on 2017/12/23.
//  Copyright © 2017年 mubin. All rights reserved.
//

#import "IKGMAppConfig.h"
#import "IKGMAtomFactory.h"
#import <AdSupport/ASIdentifierManager.h>
#import <AdSupport/AdSupport.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import <UIKit/UIKit.h>
#include <sys/sysctl.h>

@implementation IKGMAtomInfo

- (instancetype)init {
    self = [super init];
    if(self) {
        _imei = @"";
        _imsi = @"";
        _licenseCode = [IKGMAppConfig licenseCode];
        _proto = [IKGMAppConfig appProtoVersion];
        _channelCode = [IKGMAppConfig appChannel];
        _clientVersion = [IKGMAppConfig appClientVersion];
        _idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
       
        NSString * idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        NSString *osversion = [NSString stringWithFormat:@"ios_%f", [[[UIDevice currentDevice] systemVersion] floatValue]];
        
        size_t size;
        sysctlbyname("hw.machine", NULL, &size, NULL, 0);
        char *name = malloc(size);
        sysctlbyname("hw.machine", name, &size, NULL, 0);
        NSString * machine = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
        free(name);
        
        _idfv = idfv;
        _osVersion = osversion;
        _userAgent = [machine stringByReplacingOccurrencesOfString:@"," withString:@"_"];
        
        NSMutableString * constQuery = [NSMutableString string];
        [constQuery appendFormat:@"lc=%@",_licenseCode];
        [constQuery appendFormat:@"cc=%@",_channelCode];
        [constQuery appendFormat:@"cv=%@",_clientVersion];
        [constQuery appendFormat:@"&proto=%@",_proto];
        [constQuery appendFormat:@"&idfa=%@",_idfa];
        [constQuery appendFormat:@"&idfv=%@",_idfv];
        [constQuery appendFormat:@"&osVersion=%@",_osVersion];
        [constQuery appendFormat:@"&ua=%@",_userAgent];
        [constQuery appendFormat:@"&imei=%@", _imei];
        [constQuery appendFormat:@"&imsi=%@", _imsi];
        //  no  devi
        
        _query = constQuery;
        
    }
    
    return self;
}


@end


@interface IKGMAtomFactory ()

// why need  queue
@property (nonatomic) dispatch_queue_t seriaAtomQueue;
@property (nonatomic ,assign) NSUInteger lastNetUpdateTime;


@end


@implementation IKGMAtomFactory


+ (instancetype)sharedInstance {
    static IKGMAtomFactory *_factory;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(!_factory) {
            _factory = [[IKGMAtomFactory alloc]init];
        }
    });
    return  _factory;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        const char *queueName = [@"goodMeal" UTF8String];
        _seriaAtomQueue = dispatch_queue_create(queueName,DISPATCH_QUEUE_SERIAL);
        _atom = [[IKGMAtomInfo alloc]init];
    }
    return self;
}

- (NSString *)generateAtomParams {
    NSMutableString * query = [NSMutableString string];
    []
}


@end
