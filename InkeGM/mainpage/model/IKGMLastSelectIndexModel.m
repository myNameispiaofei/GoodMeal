//
//  IKGMLastSelectIndexModel.m
//  AutoLayoutTest
//
//  Created by mubin on 2017/11/22.
//  Copyright © 2017年 inke. All rights reserved.
//

#import<YYModel.h>
#import "IKGMLastSelectIndexModel.h"

@implementation IKGMLastSelectIndexModel

-(instancetype)init {
    if(self = [super init]) {
        self.dateIndex = [[NSIndexPath alloc]init];
        self.menuIndex = [[NSIndexPath alloc]init];
        self.storeIndex = [[NSIndexPath alloc]init];
    }
    return self;
}

@end
