//
//  IKGMMePageViewController.m
//  InkeGM
//
//  Created by mubin on 2018/1/10.
//  Copyright © 2018年 mubin. All rights reserved.
//

#import "IKGMBaseTooL.h"
#import "IKGMMePageViewController.h"
#import "IKGMSettingCollectionViewCell.h"

@class IKGMSettingCollectionViewCell;
@class IKGMMePageHeaderView;

static NSString *cellIdentify = @"cellIdentify";
@interface IKGMMePageViewController () <UICollectionViewDelegate ,UICollectionViewDataSource>

@property (nonatomic , strong)UICollectionView * settingCollectionView;
@property (nonatomic , strong)IKGMMePageHeaderView * headerView;

@end

@implementation IKGMMePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  layoutUI];
  
}


- (void)layoutUI {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;   //UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = [self itemSize];
    self.settingCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 225, kScreenWidth, self.view.frame.size.height -225) collectionViewLayout:flowLayout];
    flowLayout.sectionInset  = UIEdgeInsetsMake(10, 15, 10, 15);
    self.settingCollectionView.delegate = self;
    self.settingCollectionView.dataSource = self;
    [self.settingCollectionView registerClass:[IKGMSettingCollectionViewCell class] forCellWithReuseIdentifier:cellIdentify];
    [self.view addSubview: self.settingCollectionView];
    self.settingCollectionView.backgroundColor = k16RGBColor(0xffffff);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

- (CGSize)itemSize {
    return CGSizeMake(kScreenWidth -30, 54);
}
#pragma   -mark CollectionViewdelagate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView  cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    IKGMSettingCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentify forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
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
   
}


@end
