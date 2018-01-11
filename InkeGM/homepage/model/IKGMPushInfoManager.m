//
//  IKGMPushInfoManager.m
//  InkeGM
//
//  Created by mubin on 2018/1/11.
//  Copyright © 2018年 mubin. All rights reserved.
//

#import "IKGMPushInfoManager.h"

@implementation IKGMPushInfoManager



+ (instancetype)sharedInstance {
    static IKGMPushInfoManager *instance ;
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[[self class]alloc]init];
        }
    });
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        _isBookRemain = YES;
        _isReachRemain = NO;
    }
    return self;
}


@end
