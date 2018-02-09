//
//  IKGMMainPageScrollViwe.m
//  InkeGM
//
//  Created by mubin on 2018/1/9.
//  Copyright © 2018年 mubin. All rights reserved.
//

#import "IKGMMainPageScrollViwe.h"

@implementation IKGMMainPageScrollViwe

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.ignoreDragging) {
        return NO;
    }
    
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [gestureRecognizer.view isKindOfClass:[IKGMMainPageScrollViwe class]]) {
        CGPoint point = [(UIPanGestureRecognizer *)gestureRecognizer translationInView:self];
        if ((fabs(point.y) / fabs(point.x)) < 1){
            return YES;
        } else {
            return NO;
        }
    }
    return [super gestureRecognizerShouldBegin:gestureRecognizer];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event{
    UIView * view = [super hitTest:point withEvent:event];
    
    if ([view isKindOfClass:[IKGMMainPageScrollViwe class]]) {
        return nil;
    }
    return view;
}

- (void)switchShowViewWithIndex:(int)index {
    self.contentOffset = CGPointMake(index * [UIScreen mainScreen].bounds.size.width, 0);
}



@end
