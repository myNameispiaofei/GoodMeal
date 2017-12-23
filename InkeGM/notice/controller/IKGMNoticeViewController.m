//
//  IKGMNoticeViewController.m
//  AutoLayoutTest
//
//  Created by mubin on 2017/11/12.
//  Copyright © 2017年 inke. All rights reserved.
//

#import <Masonry.h>
#import "IKGMBaseTooL.h"
#import "IKGMNoticeView.h"
#import "IKGMNoticeViewController.h"

@interface IKGMNoticeViewController ()
@property (nonatomic , strong) IKGMNoticeView *noticeView;
@property (nonatomic , strong) UIButton       *supervisorBtn;

@end

@implementation IKGMNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configUI];
    [self layoutUI];

}

- (void)configUI {
    IKGMNoticeView *noticeView = [[IKGMNoticeView alloc]init];
    noticeView.layer.cornerRadius = 16.5;
    noticeView.layer.masksToBounds = YES;
    [self.view addSubview:noticeView];
    self.noticeView = noticeView ;
    
    UIButton *supervisorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [supervisorBtn setTitle:@"管理员" forState:UIControlStateNormal];
    [supervisorBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    supervisorBtn.titleLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightRegular];
    supervisorBtn.backgroundColor = k16RGBColor(0x3c5267);
    supervisorBtn.layer.cornerRadius = 20;
    supervisorBtn.layer.masksToBounds = YES;
    [self.view addSubview: supervisorBtn];
    self.supervisorBtn = supervisorBtn;
}

- (void)layoutUI {
    
    [self.noticeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(32);
        make.right.equalTo(self.view.mas_right).offset(-32);
        make.top.equalTo(self.view.mas_top).offset(67.5);
        make.height.mas_equalTo(187);
    }];
    
    [self.supervisorBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-84.5);
        make.width.mas_equalTo(186);
        make.centerX.equalTo(self.view.mas_centerX);
        make.height.mas_equalTo(40);
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
