//
//  IKGMSettingCollectionViewCell.h
//  InkeGM
//
//  Created by mubin on 2018/1/11.
//  Copyright © 2018年 mubin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IKGMSettingCollectionViewCellDelegate<NSObject>

-(void)clikBookRemind;

-(void)clickReachRemind;

@end

@interface IKGMSettingCollectionViewCell : UICollectionViewCell

- (void)setSettingItem:(IKMeCollectionViewItem *)item;

@property (nonatomic ,weak) id<IKGMSettingCollectionViewCellDelegate> delegate;

@end
