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
#import "IKGMCommonAlertView.h"
#import "IKGMHttpRequsetManager.h"
#import "IKGMRestaurantModel.h"

@interface IKGMMainPageViewController ()<UIScrollViewDelegate,IKGMStoreViewControllerDelegae,IKGMCommonAlertViewDelegate>

@property (nonatomic ,strong) UIImageView *calendarImageView;
@property (nonatomic ,strong) UILabel *dateMsgLabel;
@property (nonatomic ,strong) IKGMMainPageScrollViwe *dinnerScrollView;

@property (nonatomic ,assign) NSInteger clickStoreIndex;
@property (nonatomic ,assign) NSInteger clickDishIndex;
@property (nonatomic ,strong) NSMutableArray<IKGMRestaurantModel*>* storeList;
@property (nonatomic ,assign) BOOL isBooked;
@property (nonatomic ,strong) IKGMCommonAlertView *alertView;
@property (nonatomic ,strong) IKGMOrderModel *orderModel;


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
                [self.view layoutIfNeeded];
            }
        }}
    ];
}

- (void)clickBookDishBtn {
    
    IKGMOrderModel *orderModel = [IKGMOrderModel new];
    orderModel.restaurantId = self.storeList[_clickStoreIndex].restaurantId;
    orderModel.restaurantName =  self.storeList[_clickStoreIndex].restaurantName;
    orderModel.dish = self.storeList[_clickStoreIndex].sectionList[0].dishList[_clickDishIndex];
    [[IKGMHttpRequsetManager sharedInstance]  orderGoodMeal:orderModel complete:^(NSDictionary *resDict, NSInteger code) {
        if(code == 0 && resDict) {
            NSString *orderId = [resDict objectForKey:@"orderId"];
            [IKGMUserManager sharedInstance].orderId = orderId;
            self.dinnerScrollView.hidden = YES;
            [self showCommonAlertView];
        }
    }];
}

#pragma -mark IKGMStoreViewControllerDelegae

- (void)changeStatusForClick:(NSInteger)storeIndex dishIndex:(NSInteger)dishIndex {
    self.clickStoreIndex= storeIndex;
    self.clickDishIndex = dishIndex;
    [self changeStoreClickTypeAtindex];
    [self scrollViewReloadata];
    
}

- (void)changeStoreClickTypeAtindex {
    if(_storeList) {
        for (int index = 0 ;index < _storeList.count ; index++) {
            if(index != self.clickStoreIndex) {
                _storeList[index].type = IKGMStoreForbidClickType;
                _storeList[index].clickDishIndex = -1;
            }
            else {
                _storeList[index].type = IKGMStoreClickType;
                _storeList[index].clickDishIndex = self.clickDishIndex;
            }
            
        }
    }
}

- (void)scrollViewReloadata {
    for (id cV in self.childViewControllers) {
        if([cV isKindOfClass:[IKGMStoreViewController class]]) {
            [(IKGMStoreViewController *)cV needReloadData];
        }
    }
}



#pragma  -mark IKGMCommonAlertViewDelegate


- (void)clickCancelDishButton {
        [[IKGMHttpRequsetManager sharedInstance] cancelOreder:nil complete:^(NSDictionary *resDict, IKGMErrorCode errorCode) {
            if(errorCode == IKGMSUCCESS) {
                [self reSetData];
                self.alertView.hidden = YES;
                self.dinnerScrollView.hidden = NO;
                [self scrollViewReloadata];
            }
        }];
}

- (void)clickProvideDishbutton {
    
     
}

- (void)reSetData {
    if(self.storeList) {
        for (IKGMRestaurantModel *model in self.storeList) {
            model.type =IKGMStoreNormalType;
        }
    }
}



#pragma -mark UI

- (void)mainPageInit {
    
    for (int index = 0 ;index < _storeList.count ; index++) {
        IKGMStoreViewController *storeCV = [[IKGMStoreViewController alloc]initWithRestaurantModel:_storeList[index] index:index];
        [self addChildViewController:storeCV];
        storeCV.delegate = self;
        [self.dinnerScrollView addSubview:storeCV.view];
        storeCV.view.frame = CGRectMake(index *kScreenWidth , 0, kScreenWidth, 504);
    }
    [self layoutAlertView];
    
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




- (void)layoutAlertView {
    [self.view addSubview:self.alertView];
    [self.alertView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(27);
        make.right.mas_equalTo(self.view.mas_right).offset(-27);
        make.top.mas_equalTo(self.dateMsgLabel.mas_bottom).offset(77.5);
        make.height.mas_equalTo(401);
    }];
    self.alertView.hidden = YES;
}

- (void)showCommonAlertView{
    self.alertView.hidden = NO;
    IKGMOrderModel *orderModel = [IKGMOrderModel new];
    orderModel.restaurantId = self.storeList[_clickStoreIndex].restaurantId;
    orderModel.restaurantName =  self.storeList[_clickStoreIndex].restaurantName;
    orderModel.dish = self.storeList[_clickStoreIndex].sectionList[0].dishList[_clickDishIndex];
    [self.alertView setOrderModel:orderModel];
}

- (IKGMCommonAlertView *)alertView {
    if (!_alertView) {
        _alertView = [[IKGMCommonAlertView alloc]init];
        _alertView.layer.cornerRadius = 6;
        _alertView.layer.masksToBounds = YES;
        _alertView.delegate = self;
    }
    return _alertView;
}

@end
