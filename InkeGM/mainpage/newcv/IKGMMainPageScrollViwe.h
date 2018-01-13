//
//  IKGMMainPageScrollViwe.h
//  InkeGM
//
//  Created by mubin on 2018/1/9.
//  Copyright © 2018年 mubin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IKGMMainPageScrollViwe : UIScrollView

@property (nonatomic) CGFloat beginContentOffsetX;
@property (nonatomic) BOOL isDragging;
@property (nonatomic) BOOL ignoreDragging;

- (void)switchShowViewWithIndex:(int)index;




@end
