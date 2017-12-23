//
//  IKGMHomeTableViewCell.h
//  AutoLayoutTest
//
//  Created by mubin on 2017/11/12.
//  Copyright © 2017年 inke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IKGMHomeTableViewCell : UITableViewCell

- (void)setContentTitle:(NSString *)title;

- (void)showTopLine;

- (void)changeMarkIcon:(BOOL)expand;

@end
