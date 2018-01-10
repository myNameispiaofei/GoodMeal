//
//  IKGMBaseTooL.h
//  AutoLayoutTest
//
//  Created by mubin on 2017/11/12.
//  Copyright © 2017年 inke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef IKGMBaseTooL_h
#define IKGMBaseTooL_h

extern BOOL gIsIphoneX(void);
extern CGFloat gNavAreaHeight(void);
extern CGFloat gTabBarHeight(void);

extern CGFloat const IKNavBarHeight; //44
extern CGFloat const IKTabNormalHeight; //49

#define IKIsIphoneX gIsIphoneX()
#define IKNavAreaHeight gNavAreaHeight() //88
#define IKTabBarHeight gTabBarHeight() //83
#define IKNavStartY (IKNavAreaHeight - IKNavBarHeight) // 44
#define IKBottomSafeEdge (IKTabBarHeight - IKTabNormalHeight) // 34


#define RES_OK(sel) (self.delegate && [self.delegate respondsToSelector:sel])

#define k16RGBColor(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

#define k16RGBAColor(rgbValue, alphaValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:alphaValue]

///< format：22,22,22
#define kRGBColor(r, g, b) ([UIColor colorWithRed:(r) / 255.0  \
green:(g) / 255.0  \
blue:(b) / 255.0  \
alpha:1])

///< format：22,22,22,0.5
#define kRGBAColor(r, g, b, a) ([UIColor colorWithRed:(r) / 255.0  \
green:(g) / 255.0  \
blue:(b) / 255.0  \
alpha:(a)])

#define kColorWith16RGB(rgb) k16RGBColor(rgb)
#define kColorWithRGB(r,g,b) kRGBColor(r,g,b)
#define kColorWithRGBA(r,g,b,a) kRGBAColor(r, g, b, a)

// More easy way to use hex color to generate color.
#define kHexRGB(rgb) k16RGBColor(rgb)

// More easy way to generate a color object.
#define kRGB(r,g,b) kRGBColor(r,g,b)

// More easy way to generate a color object with rgb and alpha.
#define kRGBA(r,g,b,a) kRGBAColor(r, g, b, a)

#define mIKHexColor(hex, a) [UIColor colorWithRed:((hex >> 16 & 0xff) / 255.0) green:((hex >> 8 & 0xff) / 255.0) blue:((hex & 0xff) / 255.0) alpha:(a)]

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kScale [UIScreen mainScreen].scale
#define kRate  kScreenWidth / 375.0


#endif

@interface IKGMBaseTooL : NSObject

@end
