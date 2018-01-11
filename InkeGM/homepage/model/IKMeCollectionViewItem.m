//
//  IKMeCollectionViewItem.m
//  InkeGM
//
//  Created by mubin on 2018/1/11.
//  Copyright © 2018年 mubin. All rights reserved.
//

#import "IKMeCollectionViewItem.h"

@implementation IKMeCollectionViewItem
- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle  lefticonName:(NSString *)leftIconName  rightIconName:(NSString*)rightIconName  centerTitle:(NSString *)centerTitle  itmetype:(IKMeCollectionViewItemType)type {
    if(self = [super init]) {
        self.title = title;
        self.subTitle = subTitle;
        self.leftIconImageName = leftIconName;
        self.righticonImageView = rightIconName;
        self.centerTitle = centerTitle;
        self.type = type;
    }
    return self ;
}


@end
