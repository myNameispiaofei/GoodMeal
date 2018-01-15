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
@property (nonatomic , strong)UILabel *titleLable;
@property (nonatomic , strong)NSMutableArray<IKGMSurplusModel*> *dataArray;

@end

static NSString * const reuseIdentifier = @"surplusCellIdentifier";

@implementation IKGMSurplusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"备餐";
    [self initCellItems];
    [self layoutheaderView];
    [self layoutCollectionView];
}

- (void)clickGetSurplusBtn {
    // do  request
}

- (void)clickGiveupSurplusBtn {
    // do request
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

// only for test UI
- (void)initCellItems{
    self.dataArray = [NSMutableArray array];
    for (int i= 0;i < 5; i++) {
        IKGMSurplusModel *model = [[IKGMSurplusModel alloc]init];
        model.storeName =@"万榕小厨";
        model.dishName = @"皮蛋瘦肉粥套餐";
        model.subTitle =@"映客直播专供";
        model.privoderName = @"安慕jin";
        model.type = IKGMSurplusModelGiveupType;
        [self.dataArray addObject:model];
    }
}


- (void)layoutheaderView {
    [self.view addSubview:self.headerView];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.height.mas_equalTo(IKNavAreaHeight);
    }];
    
    [self.headerView addSubview:self.titleLable];
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.headerView);
        make.bottom.mas_equalTo(self.headerView.mas_bottom).offset(-14);
        make.height.mas_equalTo(16);
    }];
}
- (UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [[UILabel alloc]init];
        _titleLable.textColor = k16RGBColor(0x48371e);
        _titleLable.text = @"备餐";
        _titleLable.textAlignment =NSTextAlignmentCenter;
        _titleLable.backgroundColor = k16RGBColor(0xfdd93c);
    }
    return _titleLable;
}

- (UIView *)headerView {
    if(!_headerView) {
        _headerView = [[UIView alloc]init];
        _headerView.backgroundColor = k16RGBColor(0xfdd93c);
    }
    return _headerView;
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
