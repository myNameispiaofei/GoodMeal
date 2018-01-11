//
//  IKGMMainPageViewController.m
//  InkeGM
//
//  Created by mubin on 2018/1/9.
//  Copyright © 2018年 mubin. All rights reserved.
//

#import <YYModel.h>
#import <Masonry.h>
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
    self.view.backgroundColor = k16RGBColor(0xfdd93c);
    [self layoutHeader];
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
    
    for (int index = 0 ;index < _storeList.count ; index++) {
        IKGMStoreViewController *storeCV = [[IKGMStoreViewController alloc]initWithRestaurantModel:_storeList[index]];
        [self addChildViewController:storeCV];
        [self.dinnerScrollView addSubview:storeCV.view];
        storeCV.view.frame = CGRectMake(index *kScreenWidth , 0, kScreenWidth, 504);
    }
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

- (void)layoutHeader {
    [self.view addSubview:self.calendarImageView];
    [self.view addSubview:self.dateMsgLabel];
    [self.calendarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(94);
        make.width.mas_equalTo(23);
        make.height.mas_equalTo(22.5);
        make.top.mas_equalTo(self.view.mas_top).offset(36 + IKNavStartY);
    }];
    [self.dateMsgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.centerY.mas_equalTo(self.calendarImageView);
        make.left.mas_equalTo(self.calendarImageView.mas_right).offset(6);
        make.height.mas_equalTo(16);
        make.right.mas_equalTo(self.view.mas_right).offset(-27);
    }];
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
        _dateMsgLabel.text = @"星期一 点餐18:00截止";
        _dateMsgLabel.font = [UIFont systemFontOfSize:16];
        _dateMsgLabel.textColor = k16RGBColor(0xb48300);
        _dateMsgLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _dateMsgLabel;
}

- (IKGMMainPageScrollViwe *)dinnerScrollView {
    if(!_dinnerScrollView) {
        _dinnerScrollView = [[IKGMMainPageScrollViwe alloc] initWithFrame:CGRectMake(0,84 + IKNavStartY,kScreenWidth,504)];
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
