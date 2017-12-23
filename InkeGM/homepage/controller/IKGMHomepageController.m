//
//  IKGMHomepageController.m
//  AutoLayoutTest
//
//  Created by mubin on 2017/11/12.
//  Copyright © 2017年 inke. All rights reserved.
//

#import <Masonry.h>
#import "IKGMBaseTooL.h"
#import "IKGMHomepageItem.h"
#import "IKGMHomeTableViewCell.h"
#import "IKGMHomepageController.h"
#import "IKGMHomePageSetingCell.h"

@interface IKGMHomepageController ()<UITableViewDelegate ,UITableViewDataSource>

@property (nonatomic ,strong) UIImageView   * portraitImageView;
@property (nonatomic ,strong) UILabel       * nickNameLabel;
@property (nonatomic ,strong) UITableView   * centerTabelView;
@property (nonatomic ,strong) UIButton      * quitLoginBtn;
@property (nonatomic ,strong) UIView        * bgview;
@property (nonatomic ,strong) NSMutableArray* dataArray;
@property (nonatomic ,assign) BOOL            expandSetting;
@end

static  NSString *settingcell = @"settingCell";
static  NSString *cellIdenfier = @"cell";
@implementation IKGMHomepageController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testData];
    [self configUI];
    [self layoutUI];
     self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)testData{
    [self initCellItems];
}

- (void)configUI {
    UIImageView *portraitImageView = [[UIImageView alloc]init];
    portraitImageView.backgroundColor = [UIColor orangeColor];
    portraitImageView.layer.cornerRadius = 31.5;
    portraitImageView.layer.masksToBounds = YES;
    [self.view addSubview:portraitImageView];
    self.portraitImageView = portraitImageView;
    
    UIView *bgview = [[UIView alloc]init];
    bgview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:bgview];
    self.bgview = bgview;
    
    
    UILabel *nickNameLabel = [[UILabel alloc]init];
    nickNameLabel.text = @"这是一个测试名字";
    nickNameLabel.textColor = [UIColor blackColor];
    nickNameLabel.textAlignment =NSTextAlignmentCenter;
    [nickNameLabel setFont:[UIFont systemFontOfSize:15]];
    [self.view addSubview:nickNameLabel];
     self.nickNameLabel= nickNameLabel;
    
    UITableView *centerTabelView = [[UITableView alloc] initWithFrame:CGRectZero style: UITableViewStylePlain];
    centerTabelView.backgroundColor = [UIColor whiteColor];
    [self.bgview addSubview: centerTabelView];
   
    self.centerTabelView = centerTabelView;
    self.centerTabelView.delegate = self;
    self.centerTabelView.dataSource = self;
    self.centerTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIButton *quitLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIColor *color = k16RGBAColor(0x848284, 0.8);
    [quitLoginBtn setTitle:@"退出登录" forState: UIControlStateNormal];
    [quitLoginBtn setTitleColor:color forState:UIControlStateNormal];
    quitLoginBtn.layer.cornerRadius =  22.5;
    quitLoginBtn.layer.borderWidth = 1;
   
    quitLoginBtn.layer.borderColor =color.CGColor ;
    quitLoginBtn.layer.masksToBounds = YES;
    [quitLoginBtn addTarget:self action:@selector(clickQuitBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:quitLoginBtn];
    self.quitLoginBtn = quitLoginBtn;
}

- (void)layoutUI {
    [self.portraitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(60.5);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.height.mas_equalTo(63);
    }];
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.portraitImageView.mas_bottom).offset(13);
            make.height.mas_equalTo(21);
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
    }];
    [self.centerTabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.height.equalTo(self.bgview);
       
    }];
    [self.bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nickNameLabel.mas_bottom).offset(27);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.mas_equalTo(320);
    }];
    
    [self.quitLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.centerTabelView.mas_bottom).offset(29);
        make.left.equalTo(self.view.mas_left).offset(32.5);
        make.right.equalTo(self.view.mas_right).offset(-32.5);
        make.height.mas_equalTo(45);
    }];
}
- (void)initCellItems {
    self.dataArray = [NSMutableArray new];
    IKGMHomepageItem *setting = [[IKGMHomepageItem alloc]initWithTitle:@"设置"];
    IKGMHomepageItem *customService = [[IKGMHomepageItem alloc]initWithTitle:@"美餐客服"];
    IKGMHomepageItem *orderingRules = [[IKGMHomepageItem alloc]initWithTitle:@"订餐规则"];
    IKGMHomepageItem *comment = [[IKGMHomepageItem alloc]initWithTitle:@"评论专区"];
    IKGMHomepageItem *settingInfo = [[IKGMHomepageItem alloc]init];
  
  
    NSMutableArray *section0 = [NSMutableArray new];
    [section0 addObject:setting];
    [section0 addObject:settingInfo];
    NSMutableArray *section1 = [NSMutableArray new];
    [section1 addObject:customService];
    [section1 addObject:orderingRules];
    [section1 addObject:comment];
    [self.dataArray addObjectsFromArray:@[section0, section1]];
    
}

- (void)clickQuitBtn {
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - tableView delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     if(indexPath.section == 0 && indexPath.row == 1)
     {
         IKGMHomePageSetingCell *cell = [tableView dequeueReusableCellWithIdentifier:settingcell];
         if(!cell) {
             cell = [[IKGMHomePageSetingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:settingcell];
         }
         if (!self.expandSetting) {
             cell.hidden = YES;
         }
         return cell;
     }
     else {
        IKGMHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdenfier];
        if (!cell) {
            cell = [[IKGMHomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdenfier];
        }
        IKGMHomepageItem *item = nil;
        item = self.dataArray[indexPath.section][indexPath.row];
        [cell setContentTitle:item.title];
         if(indexPath.section == 0 && indexPath.row == 0) {
             [cell showTopLine];
            
             [cell changeMarkIcon:_expandSetting];
            
         }
         return  cell;
     }

    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0 && indexPath.row == 0){
        _expandSetting = !_expandSetting;
        [self.centerTabelView reloadData];
    }
    
 
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataArray count];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section >= self.dataArray.count) {
        return 0;
    } else {
        return [self.dataArray[section] count];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0 && indexPath.row == 1) {
        return  _expandSetting ? 117 : 0;
    }else {
       return 50;
    }
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    
//    CGFloat height = (section == 0 && _expandSetting) ? 117 :0;
//    return height;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    if(section == 0  && _expandSetting)
//    {
//        UIView * hell = [[UIView alloc]init];
//        hell.backgroundColor = [UIColor redColor];
//        return hell;
//    }
//    return nil;
//}

- (BOOL)isSettingItem:(NSInteger)section {
     if(section == 0  && _expandSetting){
         return YES;
     }
    return NO;
}



@end
