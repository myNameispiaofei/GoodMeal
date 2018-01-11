//
//  IKMeCollectionViewItem.h
//  InkeGM
//
//  Created by mubin on 2018/1/11.
//  Copyright © 2018年 mubin. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger,IKMeCollectionViewItemType) {
    IKMeSettingBookRemind = 1,
    IKMeSettingReachRemind,
    IKMeSettingRule,
    IKMeSettingAdministrator,
    IKMeSettingSignout
};

@interface IKMeCollectionViewItem : NSObject
@property (nonatomic, assign) IKMeCollectionViewItemType type;
@property (nonatomic, copy) NSString *leftIconImageName; // cell 左侧icon
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) NSString *centerTitle;
@property (nonatomic, copy) NSString *righticonImageView;


- (instancetype)initWithTitle:(NSString *)title
                     subTitle:(NSString *)subTitle
                 lefticonName:(NSString *)leftIconName
                rightIconName:(NSString*)rightIconName
                  centerTitle:(NSString *)centerTitle
                     itmetype:(IKMeCollectionViewItemType)type;

@end
