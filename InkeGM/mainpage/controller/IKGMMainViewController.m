//
//  IKGMMainViewController.m
//  AutoLayoutTest
//
//  Created by mubin on 2017/11/12.
//  Copyright © 2017年 inke. All rights reserved.
//

#import <Masonry.h>
#import "IKGMBaseTooL.h"
#import "IKGMMianPageHederView.h"
#import "IKGMMainViewController.h"
#import "IKMGAlertViewController.h"
#import "IKGMLastSelectIndexModel.h"
#import "IKGMHeaderCollectionViewCell.h"
#import "IKGMHttpRequsetManager.h"
#import <AFNetworking.h>
#import "IKGMRestaurantModel.h"
#import <YYModel.h>
#import "IKGMRestaurantCollectionViewCell.h"



@interface IKGMMainViewController ()<UICollectionViewDelegate ,UICollectionViewDataSource, UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong) UICollectionView * headerView;
@property (nonatomic ,strong) UICollectionView * storeCollectionView;
@property (nonatomic ,strong) UITableView      * menuTabelView;
@property (nonatomic ,strong) UIView           * tipsBgViw;
@property (nonatomic ,strong) UILabel          * timeLabel;
@property (nonatomic ,strong) UILabel          * titelLabel;
@property (nonatomic ,strong) UIButton         * bookBtn;
@property (nonatomic ,strong) IKGMLastSelectIndexModel * selectIndexModel;
@property (nonatomic ,strong) IKGMRestaurantModel * restaurantModel;
@property (nonatomic ,strong) NSMutableArray<IKGMRestaurantModel*>* restautantList;
@end

@implementation IKGMMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.restautantList = [NSMutableArray array];
    [self requestGmMenu];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initSelcetIndexModel]; //加单例否？
    [self layoutHeader];
//    [self configUI];
//    [self layoutUI];
//    [self layoutStoreUI];
//    [self layoutMenuTabelUI];
   
}
- (void)initSelcetIndexModel {
    self.selectIndexModel = [[IKGMLastSelectIndexModel alloc]init];
    self.selectIndexModel.dateIndex = nil;
    self.selectIndexModel.storeIndex = nil;
    self.selectIndexModel.menuIndex = nil;
}

- (void)layoutHeader {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection =  UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = [self headerItemSize];
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0 );
    CGRect frame = CGRectZero;
    self.headerView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:flowLayout];
    [self.headerView registerClass:[IKGMHeaderCollectionViewCell class] forCellWithReuseIdentifier:@"headerCollectionCell"];
    [self.view addSubview:self.headerView];
//    self.headerView.backgroundColor = [UIColor redColor];
    self.headerView.delegate = self;
    self.headerView.dataSource = self;
    [self.headerView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.left.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(17.5);
        make.height.mas_equalTo(54);
    }];
    
}


- (void)layoutStoreUI {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = CGSizeMake((self.view.frame.size.width -60)/3, 43);
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0 );
    CGRect frame = CGRectZero;
    self.storeCollectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:flowLayout];
    [self.storeCollectionView registerClass:[IKGMRestaurantCollectionViewCell class] forCellWithReuseIdentifier:@"nihao"];
    [self.view addSubview:self.storeCollectionView];
    self.storeCollectionView.backgroundColor = [UIColor redColor];
    self.storeCollectionView.delegate = self;
    self.storeCollectionView.dataSource = self;
    [self.storeCollectionView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.top.equalTo(self.tipsBgViw.mas_bottom).offset(32);
        make.height.mas_equalTo(43);
    }];
}


- (void)layoutMenuTabelUI {
    UITableView * menuTabelView = [[UITableView alloc] init];
    menuTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    menuTabelView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:menuTabelView];
    self.menuTabelView = menuTabelView;
    self.menuTabelView.delegate = self;
    self.menuTabelView.dataSource = self;
    [self.menuTabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.storeCollectionView.mas_bottom);
        make.left.width.equalTo(self.storeCollectionView);
        make.bottom.equalTo(self.bookBtn.mas_top).offset(-84);
    }];
}

- (CGSize) headerItemSize {
    return CGSizeMake(self.view.frame.size.width/7, 54);
}

- (void)configUI {
    UIView *tipsBgViw = [[UIView alloc]init];
    tipsBgViw.backgroundColor = k16RGBColor(0xf5a54e);
    tipsBgViw.layer.cornerRadius = 22.5 ;
    tipsBgViw.layer.masksToBounds = YES;
    [self.view addSubview:tipsBgViw];
    self.tipsBgViw = tipsBgViw;
    
    UILabel *timeLabel = [[UILabel alloc]init];
    timeLabel.text = @"19:30";
    timeLabel.textColor = [UIColor whiteColor];
    timeLabel.font = [UIFont systemFontOfSize:24 weight:UIFontWeightBlack];
    [self.tipsBgViw addSubview:timeLabel];
    self.timeLabel = timeLabel;
    
    UILabel *titelLabel = [[UILabel alloc]init];
    titelLabel.textColor = [UIColor whiteColor];
    titelLabel.text = @"映客直播晚餐";
    titelLabel.textAlignment = NSTextAlignmentRight;
    titelLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
    [self.tipsBgViw addSubview:titelLabel];
    self.titelLabel = titelLabel;
    
    UIButton *bookBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [bookBtn setTitle:@"下单" forState: UIControlStateNormal];
    [bookBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    bookBtn.layer.cornerRadius =  22.5;
    bookBtn.backgroundColor = k16RGBColor(0xf5a54e);
    bookBtn.layer.masksToBounds = YES;
    bookBtn.showsTouchWhenHighlighted = YES;
    [bookBtn addTarget:self action:@selector(clickBookBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bookBtn];
    self.bookBtn = bookBtn;
}

- (void)layoutUI {
    [self.tipsBgViw mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(26);
        make.right.equalTo(self.view.mas_right).offset(-26);
        make.top.equalTo(self.headerView.mas_bottom).offset(20);
        make.height.mas_equalTo(45);
    }];
    [self.bookBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.left.equalTo(self.tipsBgViw);
        make.bottom.equalTo(self.view.mas_bottom).offset(-84.5);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.tipsBgViw.mas_left).offset(22.5);
        make.width.mas_equalTo(100);
        make.centerY.equalTo(self.tipsBgViw.mas_centerY);
    }];
    [self.titelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.tipsBgViw.mas_right).offset(-22.5);
        make.left.equalTo(self.timeLabel.mas_right);
        make.centerY.equalTo(self.tipsBgViw.mas_centerY);
    }];
}

- (void)clickBookBtn
{
    IKMGAlertViewController * vc = [[IKMGAlertViewController alloc]initWithType:IKGMAlertViewDeflute];
     vc.modalPresentationStyle =  UIModalPresentationCustom;
    [self presentViewController:vc animated:NO completion:nil];
    [[IKGMHttpRequsetManager sharedInstance] requsetWithLogOutModel:nil complete:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma  -mark collectionViewDelegate

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)
collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0 ;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)
collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
   
    if( collectionView == self.headerView) {
        [self  headerViewDidSelectItemAtIndex:indexPath];
        return;
    }
    if(collectionView == self.storeCollectionView) {
        [self storeDidSelectItemAtIndex:indexPath];
        return;
    }
}
- (void)headerViewDidSelectItemAtIndex:(NSIndexPath *)indexPath  {
    // 点击切换日期  刷新 商家& 餐品
    if(self.selectIndexModel.dateIndex) {
         if(self.selectIndexModel.dateIndex.row != indexPath.row) {
            UICollectionViewCell *oldcell = [self.headerView cellForItemAtIndexPath:self.selectIndexModel.dateIndex];
            oldcell.backgroundColor = [UIColor blueColor];
        }
    }
    UICollectionViewCell * currentcell = [self.headerView cellForItemAtIndexPath:indexPath];
//    [currentcell didSelectStyle];
    self.selectIndexModel.dateIndex = indexPath;
    [self refreshCurrentMenuData:indexPath.row];
    
}


- (void)storeDidSelectItemAtIndex:(NSIndexPath *)indexPath {
    // 点击 切换商家 ，刷新餐品
    if(self.selectIndexModel.storeIndex) {
        if(self.selectIndexModel.storeIndex.row != indexPath.row) {
            UICollectionViewCell *oldCell = [self.storeCollectionView cellForItemAtIndexPath:self.selectIndexModel.storeIndex];
            oldCell.backgroundColor = [UIColor blueColor];
        }
    }
    UICollectionViewCell * currentCell = [self.storeCollectionView cellForItemAtIndexPath:indexPath];
    currentCell.backgroundColor = [UIColor blackColor];
    self.selectIndexModel.storeIndex = indexPath;
    [self refreshCurrentMenuData:indexPath.row];
}

- (void)refreshCurrentStoreData:(NSInteger)index {
    
}



- (void)refreshCurrentMenuData:(NSInteger)index {
    
}





- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(collectionView == self.headerView) {
        return  7;
    }
    if(collectionView == self.storeCollectionView){
        return  self.restautantList.count;
    }
    return 0;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(collectionView == self.headerView){
        IKGMHeaderCollectionViewCell *cell = [collectionView  dequeueReusableCellWithReuseIdentifier:@"hello" forIndexPath:indexPath];
        return cell;
    }
    if(collectionView == self.storeCollectionView) {
        IKGMRestaurantCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"nihao" forIndexPath:indexPath];
        if(indexPath.row < self.restautantList.count) {
            [cell setRrestaurantModel:self.restautantList[indexPath.row]] ;
        }
        else {
            cell.backgroundColor=[UIColor grayColor];
        }
        
        return cell;
    }
    return nil;
}


#pragma  -mark UITabelViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"cds%ld",self.restautantList[0].sectionList[0].dishList.count);
    return  self.restautantList[0].sectionList[0].dishList.count  ;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    
    return  1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"qqq"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"qqq"];
    }
    cell.textLabel.text = self.restautantList[0].sectionList[0].dishList[indexPath.row].dishName;

    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (void)requestGmMenu {
    __weak typeof(self) wself = self;
   
    [[IKGMHttpRequsetManager sharedInstance] requseMenu:nil complete:^(NSDictionary *resDict ,NSInteger code) {
        if(resDict){
            [wself  paraseDict:resDict];
            [self configUI];
            [self layoutUI];
            [self layoutStoreUI];
            [self layoutMenuTabelUI];
        }
    }];
    
}


- (void)paraseDict:(NSDictionary *)resDict {
    NSDictionary *resDit = [resDict objectForKey:@"data"];
    NSArray * resList = [resDit objectForKey:@"restaurantList"];
    for (NSDictionary * restautant in resList) {
        IKGMRestaurantModel *restaurantModel =[IKGMRestaurantModel yy_modelWithDictionary:restautant];
        if(!self.restautantList) {
            self.restautantList = [NSMutableArray array];
        }
        [self.restautantList addObject:restaurantModel];
    }
//    [self.storeCollectionView reloadData];
//    [self.menuTabelView reloadData];
}
@end
