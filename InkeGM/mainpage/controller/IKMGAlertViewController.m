//
//  IKMGAlertViewController.m
//  AutoLayoutTest
//
//  Created by mubin on 2017/11/17.
//  Copyright © 2017年 inke. All rights reserved.
//

#import <Masonry.h>
#import "IKGMBaseTooL.h"
#import "IKMGAlertViewController.h"

@interface IKMGAlertViewController ()<IKGMAlertViewDelegate>
@property (nonatomic , strong) IKGMAlertView * alertView;
@property (nonatomic , assign) IKGMAlertViewType type;
@end

@implementation IKMGAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = k16RGBAColor(0x000000, 0.3);
    [self configUI];
    [self layoutUI];
}

- (void)configUI {
    
    IKGMAlertView *alertView = [[IKGMAlertView alloc]initWithType:self.type];
    alertView.layer.cornerRadius = 16;
    [self.view addSubview:alertView];
    self.alertView = alertView;
    self.alertView.delegate = self;
    
}

- (void)layoutUI {
    [self.alertView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(28);
        make.right.equalTo(self.view.mas_right).offset(-28);
        make.top.equalTo(self.view.mas_top).offset(202);
        make.height.mas_equalTo(193.5);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Dispose of any resources that can be recreated.
}

- (instancetype)initWithType :(IKGMAlertViewType) type {
     if(self = [super init]){
         self.type = type;
     }
    return  self;
}

- (void)setTitel :(NSString *)resName {
    [self.alertView setTipName: resName];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [event.allTouches anyObject];
    CGPoint point = [touch locationInView:self.view];
    if (!CGRectContainsPoint(self.alertView.frame,point) && self.type== IKGMAlertViewReslute){
        [self dismissViewControllerAnimated:NO completion:nil];
    }    
}

- (void)dealloc {
    _alertView.delegate = nil;
}

#pragma  -mark  IKGMAlertViewDelegate

- (void)clickCancleBtnAction {
    [self.delegate clickCancleBtn];
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)clickBookBtnAction {
    [self.delegate clickBookBtn];
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
