//
//  IKGMBaseTooL.m
//  AutoLayoutTest
//
//  Created by mubin on 2017/11/12.
//  Copyright © 2017年 inke. All rights reserved.
//

#import "IKGMBaseTooL.h"

#define ik_force_inline __inline__ __attribute__((always_inline))

extern ik_force_inline BOOL gIsIphoneX(void) {
    static BOOL s_isIphoneX = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if ((1. * [UIScreen mainScreen].bounds.size.height
             / [UIScreen mainScreen].bounds.size.width) > 2.16) {
            s_isIphoneX = YES;
        } else if ((1. * [UIScreen mainScreen].bounds.size.width
                    / [UIScreen mainScreen].bounds.size.height) > 2.16) {
            //横屏
            s_isIphoneX = YES;
        } else {
            s_isIphoneX = NO;
        }
    });
    return s_isIphoneX;
}

extern ik_force_inline CGFloat gNavAreaHeight(void) {
    return (gIsIphoneX() ? 88 : 64);
}

extern ik_force_inline CGFloat gTabBarHeight(void) {
    return (gIsIphoneX() ? 83 : 49);
}

CGFloat const IKNavBarHeight = 44;
CGFloat const IKTabNormalHeight = 49;

//@implementation IKGMBaseTooL
//
//
//@end

