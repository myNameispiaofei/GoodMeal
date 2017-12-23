//
//  IKGMSurplusViewController.m
//  AutoLayoutTest
//
//  Created by mubin on 2017/11/12.
//  Copyright © 2017年 inke. All rights reserved.
//

#import <Masonry.h>
#import "IKGMBaseTooL.h"
#import "IKGMSurplusHeaderView.h"
#import "IKGMSurplusViewController.h"

@interface IKGMSurplusViewController ()

@property (nonatomic ,strong) IKGMSurplusHeaderView * headerView;
@property (nonatomic ,strong) UITableView           * surplusTabelView;
@property (nonatomic ,strong) UIButton              * providSurplusBtn;

@end

@implementation IKGMSurplusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.headerView];
    [self configUI];
    [self layoutUI];

}

- (IKGMSurplusHeaderView *)headerView {
    if(!_headerView) {
        _headerView = [[IKGMSurplusHeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 78)];
    }
    return  _headerView;
}

- (void)configUI {
    
//    IKGMSurplusHeaderView *headerView =[[IKGMSurplusHeaderView alloc]init];
    
    UITableView * surplusTabelView = [[UITableView alloc] initWithFrame:CGRectZero style: UITableViewStylePlain];
    
    surplusTabelView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:surplusTabelView];
    self.surplusTabelView = surplusTabelView;
    
    
    UIButton *providSurplusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIColor *color = k16RGBAColor(0x959595, 0.15);
    [providSurplusBtn setTitle:@"我要提供备餐" forState: UIControlStateNormal];
    [providSurplusBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    providSurplusBtn.layer.cornerRadius =  22.5;
    providSurplusBtn.layer.borderWidth = 0.5;
    
    providSurplusBtn.backgroundColor = k16RGBColor(0xf5a54e);
    providSurplusBtn.layer.borderColor =color.CGColor ;
   
    providSurplusBtn.layer.shadowColor = k16RGBColor(0xd67000).CGColor;
    providSurplusBtn.layer.shadowRadius = 10;
    providSurplusBtn.layer.shadowOffset = CGSizeMake(0,30);
    providSurplusBtn.layer.shadowOpacity = 0.3;
    
    providSurplusBtn.layer.masksToBounds = YES;
    [providSurplusBtn addTarget:self action:@selector(clickProvidSurplusBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:providSurplusBtn];
    self.providSurplusBtn = providSurplusBtn;
}


- (void)layoutUI {
    
    [self.surplusTabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(self.headerView);
        make.top.equalTo(self.headerView.mas_bottom);
        make.bottom.equalTo(self.providSurplusBtn.mas_top).offset(-29);
    }];
    
    [self.providSurplusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.surplusTabelView.mas_bottom).offset(29);
        make.left.equalTo(self.view.mas_left).offset(32.5);
        make.right.equalTo(self.view.mas_right).offset(-32.5);
        make.height.mas_equalTo(45);
        make.bottom.equalTo(self.view.mas_bottom).offset(-84.5);
    }];
    
}



- (void)clickProvidSurplusBtn {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
