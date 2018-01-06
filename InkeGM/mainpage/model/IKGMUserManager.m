//
//  IKGMUserManager.m
//  InkeGM
//
//  Created by mubin on 2017/12/28.
//  Copyright © 2017年 mubin. All rights reserved.
//

#import "IKGMUserManager.h"


@implementation IKGMUserManager

+(instancetype)sharedInstance {
    static IKGMUserManager * instance ;
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        if(!instance) {
            instance = [[IKGMUserManager alloc]init];
        }
    });
    return  instance;
}


- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return  self;
}
@end
