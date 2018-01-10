//
//  IKGMMainPageViewController.m
//  InkeGM
//
//  Created by mubin on 2018/1/9.
//  Copyright © 2018年 mubin. All rights reserved.
//

#import <YYModel.h>
#import <Masonry.h>
#import "IKGMStoreView.h"
#import "IKGMBaseTooL.h"
#import "IKGMMainPageScrollViwe.h"
#import "IKGMMainPageViewController.h"
#import "IKGMHttpRequsetManager.h"
#import "IKGMUserManager.h"
#import "IKGMRestaurantModel.h"
#import "IKGMStoreViewController.h"

@interface IKGMMainPageViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIImageView *calendarImageView;
@property (nonatomic,strong)UILabel *dateMsgLabel;
@property (nonatomic,strong)IKGMMainPageScrollViwe *dinnerScrollView;
@property (nonatomic ,strong)NSMutableArray<IKGMRestaurantModel*>* storeList;

@end

@implementation IKGMMainPageViewController

- (void)viewDidLoad {
    self.storeList = [NSMutableArray array];
    [self requestAllStore];

    
}

- (void)requestAllStore {
    __weak typeof(self) wself = self;
    [[IKGMHttpRequsetManager sharedInstance] requseMenu:nil complete:^(NSDictionary *resDict ,NSInteger code) {
        if (resDict){
            [wself  paraseAllSotreDict:resDict];
            if (_storeList.count == 0) {
                return ;
            }
            else {
                [self  mainPageInit];
            }
        }}
    ];
}


- (void)mainPageInit {
    
//    for (IKGMRestaurantModel * model in _storeList) {
        IKGMStoreView * storeView = [[IKGMStoreView alloc]initWithRestaurantModel:_storeList[0]];
        [self.dinnerScrollView addSubview:storeView];
    [storeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.equalTo(self.dinnerScrollView);
    }];
//    }
    
    
}

- (void)paraseAllSotreDict:(NSDictionary *)resDict {
    NSDictionary *resDit = [resDict objectForKey:@"data"];
    NSArray *resList = [resDit objectForKey:@"restaurantList"];
    if (resList.count == 0) {
        return;
    }
    for (NSDictionary * restautant in resList) {
        IKGMRestaurantModel *restaurantModel =[IKGMRestaurantModel yy_modelWithDictionary:restautant];
        if(!self.storeList) {
            self.storeList = [NSMutableArray array];
        }
        [self.storeList addObject:restaurantModel];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




- (UIImageView *)calendarImageView {
    if (!_calendarImageView) {
        _calendarImageView = [[UIImageView alloc]init];
        _calendarImageView.image = [UIImage imageNamed:@"calendar"];
    }
    return _calendarImageView;
}
- (UILabel *)dateMsgLabel {
    if (!_dateMsgLabel) {
        _dateMsgLabel = [[UILabel alloc]init];
        _dateMsgLabel.text = @"星期X 点餐18:00截止";
    }
    return _dateMsgLabel;
}

- (IKGMMainPageScrollViwe *)dinnerScrollView {
    if(!_dinnerScrollView) {
        _dinnerScrollView = [[IKGMMainPageScrollViwe alloc] initWithFrame:CGRectMake(0,kScreenHeight - 504 - 84 - (IKIsIphoneX ? IKBottomSafeEdge : 0),kScreenWidth,504)];
        _dinnerScrollView.contentSize = CGSizeMake(kScreenWidth * self.storeList.count,_dinnerScrollView.frame.size.height);
        _dinnerScrollView.contentOffset = CGPointMake(kScreenWidth, 0);
        _dinnerScrollView.pagingEnabled = YES;
        _dinnerScrollView.bounces = NO;
        _dinnerScrollView.delegate = self;
        _dinnerScrollView.showsHorizontalScrollIndicator = NO;
        _dinnerScrollView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_dinnerScrollView];
    }
    
    return _dinnerScrollView;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    self.dinnerScrollView.beginContentOffsetX = scrollView.contentOffset.x;
    self.dinnerScrollView.isDragging = YES;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
  
}


@end
