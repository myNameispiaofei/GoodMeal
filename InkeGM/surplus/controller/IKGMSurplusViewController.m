//
//  IKGMSurplusViewController.m
//  InkeGM
//
//  Created by mubin on 2018/1/13.
//  Copyright © 2018年 mubin. All rights reserved.
//

#import "IKGMBaseTooL.h"
#import <Masonry.h>
#import "IKGMSurplusModel.h"
#import "IKGMSurplusViewController.h"
#import "IKGMSurplusCollectionViewCell.h"


@interface IKGMSurplusViewController ()<IKGMSurplusCellDelegate,UICollectionViewDelegate ,UICollectionViewDataSource>

@property (nonatomic , strong)UICollectionView * collectionView;
@property (nonatomic , strong)UIView *headerView;
@property (nonatomic , strong)NSMutableArray *dataArray;

@end

static NSString * const reuseIdentifier = @"surplusCellIdentifier";

@implementation IKGMSurplusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCellItems];
    [self layoutheaderView];
    [self layoutCollectionView];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView  cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    IKGMSurplusCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell setModel:self.dataArray[indexPath.row]];
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


- (void)initCellItems{
    
}


- (void)layoutheaderView {
    [self.view addSubview:self.headerView];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.height.mas_equalTo(IKNavAreaHeight);
    }];
}

- (void)layoutCollectionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;   //UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = [self itemSize];
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, IKNavAreaHeight , kScreenWidth, self.view.frame.size.height - IKNavAreaHeight) collectionViewLayout:flowLayout];
    flowLayout.sectionInset  = UIEdgeInsetsMake(15, 15, 10, 15);
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[IKGMSurplusCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.view addSubview: self.collectionView];
    self.collectionView.backgroundColor = k16RGBColor(0xffffff);
}

- (CGSize)itemSize {
        return CGSizeMake(kScreenWidth -30, 145.5);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
