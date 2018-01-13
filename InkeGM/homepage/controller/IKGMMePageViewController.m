//
//  IKGMMePageViewController.m
//  InkeGM
//
//  Created by mubin on 2018/1/10.
//  Copyright © 2018年 mubin. All rights reserved.
//

#import <Masonry.h>
#import "IKGMBaseTooL.h"
#import "IKGMPushInfoManager.h"
#import "IKMeCollectionViewItem.h"
#import "IKGMMePageViewController.h"
#import "IKGMSettingCollectionViewCell.h"
#import "IKGMHomeHeaderView.h"
#import "IKGMSettingCollectionViewCell.h"



static NSString *cellIdentify = @"cellIdentify";
@interface IKGMMePageViewController () <UICollectionViewDelegate ,UICollectionViewDataSource,IKGMSettingCollectionViewCellDelegate>

@property (nonatomic , strong)UICollectionView * settingCollectionView;
@property (nonatomic , strong)IKGMHomeHeaderView * headerView;
@property (nonatomic , strong)NSMutableArray *dataArray;

@end

@implementation IKGMMePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCellItems];
    [self layoutheaderView];
    [self layoutCollectionView];
  
}



- (void)layoutheaderView {
    [self.view addSubview:self.headerView];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.height.mas_equalTo(153);
    }];
}

- (void)layoutCollectionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;   //UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = [self itemSize];
    self.settingCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 153 + IKNavStartY , kScreenWidth, self.view.frame.size.height - 153) collectionViewLayout:flowLayout];
    flowLayout.sectionInset  = UIEdgeInsetsMake(10, 15, 10, 15);
    self.settingCollectionView.delegate = self;
    self.settingCollectionView.dataSource = self;
    [self.settingCollectionView registerClass:[IKGMSettingCollectionViewCell class] forCellWithReuseIdentifier:cellIdentify];
    [self.view addSubview: self.settingCollectionView];
    self.settingCollectionView.backgroundColor = k16RGBColor(0xffffff);
}



#pragma  -mark IKGMSettingCollectionViewCellDelegate

- (void) clikBookRemind {
    [IKGMPushInfoManager sharedInstance].isBookRemain = ![IKGMPushInfoManager sharedInstance].isBookRemain;
    
}

- (void)clickReachRemind {
    [IKGMPushInfoManager sharedInstance].isReachRemain = ![IKGMPushInfoManager sharedInstance].isReachRemain;
}

#pragma   -mark CollectionViewdelagate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView  cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    IKGMSettingCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentify forIndexPath:indexPath];
    [cell setSettingItem:self.dataArray[indexPath.row]];
    cell.layer.cornerRadius = 4;
    cell.backgroundColor = k16RGBColor(0xf5f4f0);
    cell.delegate = self;
    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)
collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 20 ;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)
collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0  ;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    IKMeCollectionViewItem * item = self.dataArray[indexPath.row];
    switch (item.type) {
        case IKMeSettingBookRemind:
        case IKMeSettingReachRemind:
        break;
        case IKMeSettingRule:
        {
          // do
        }
        break;
        case IKMeSettingAdministrator:
        {
          
           // do
        }
        break;
        case IKMeSettingSignout:
        {
           // do login
        }
        default:
            break;
    }
    
}

#pragma -mark initCell item

- (void)initCellItems {
    self.dataArray = [NSMutableArray array];
    IKMeCollectionViewItem *bookRemind  = [[IKMeCollectionViewItem alloc]initWithTitle:@"点餐提醒"
                                                                              subTitle:@"工作日17:00 发送通知"
                                                                          lefticonName:@"book_tips"
                                                                         rightIconName:@"switch_on"
                                                                           centerTitle:nil
                                                                              itmetype:IKMeSettingBookRemind];
    [self.dataArray addObject:bookRemind];
    IKMeCollectionViewItem *reachRemind  = [[IKMeCollectionViewItem alloc]initWithTitle:@"到餐提醒"
                                                                              subTitle:@"工作日的到餐提醒"
                                                                          lefticonName:@"book_tips"
                                                                         rightIconName:@"switch_off"
                                                                           centerTitle:nil
                                                                              itmetype:IKMeSettingReachRemind];
    [self.dataArray addObject:reachRemind];
    IKMeCollectionViewItem *ruleItem  = [[IKMeCollectionViewItem alloc]initWithTitle:@"点餐规则"
                                                                               subTitle:nil
                                                                           lefticonName:@"book_rule"
                                                                          rightIconName:nil
                                                                            centerTitle:nil
                                                                               itmetype:IKMeSettingRule];
    [self.dataArray addObject:ruleItem];
    IKMeCollectionViewItem *administrator = [[IKMeCollectionViewItem alloc]initWithTitle:@"我是管理员"
                                                                            subTitle:nil
                                                                        lefticonName:@"administrators"
                                                                       rightIconName:nil
                                                                         centerTitle:nil
                                                                              itmetype:IKMeSettingAdministrator];
    [self.dataArray addObject:administrator];
    IKMeCollectionViewItem *signout= [[IKMeCollectionViewItem alloc]initWithTitle:nil
                                                                         subTitle:nil
                                                                     lefticonName:nil
                                                                    rightIconName:nil
                                                                      centerTitle:@"退出登录"
                                                                                itmetype:IKMeSettingSignout];
    [self.dataArray addObject:signout];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (CGSize)itemSize {
    return CGSizeMake(kScreenWidth -30, 54);
}


- (IKGMHomeHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[IKGMHomeHeaderView alloc]init];
    }
    return _headerView;
}

@end
