//
//  IKGMMianPageHederView.m
//  AutoLayoutTest
//
//  Created by mubin on 2017/11/17.
//  Copyright © 2017年 inke. All rights reserved.
//
#import <Masonry.h>
#import "IKGMMainPageDateButton.h"
#import "IKGMMianPageHederView.h"


@interface IKGMMianPageHederView()

@property (nonatomic ,strong) IKGMMainPageDateButton *monBtn;
@property (nonatomic ,strong) IKGMMainPageDateButton *tuesBtn;
@property (nonatomic ,strong) IKGMMainPageDateButton *wedBtn;
@property (nonatomic ,strong) IKGMMainPageDateButton *thurBtn;
@property (nonatomic ,strong) IKGMMainPageDateButton *friBtn;
@property (nonatomic ,strong) IKGMMainPageDateButton *satBtn;
@property (nonatomic ,strong) IKGMMainPageDateButton *sunBtn;
@property (nonatomic ,strong) NSMutableArray< IKGMMainPageDateButton *>* btnArray;
@property (nonatomic ,assign) NSInteger lastIndex;
@end

@implementation IKGMMianPageHederView

- (instancetype)init {
    if(self = [super init]) {
      
        [self configUI];
        [self layoutUI];
    }
    return self;
}

- (void)configUI {
    self.btnArray = [[NSMutableArray alloc]init];
    IKGMMainPageDateButton *monBtn = [IKGMMainPageDateButton buttonWithType:UIButtonTypeCustom];
    [monBtn setDateAndNum:@"一" num:@"5"];
    [self addSubview: monBtn];
    self.monBtn = monBtn;
    [_btnArray addObject:monBtn];
    monBtn.backgroundColor = [UIColor redColor];
//`    [self.monBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];

    
    
    IKGMMainPageDateButton *tuesBtn = [IKGMMainPageDateButton buttonWithType:UIButtonTypeCustom];
    [tuesBtn setDateAndNum:@"二" num:@"6"];
    [self addSubview: tuesBtn];
    self.tuesBtn = tuesBtn;
    [_btnArray addObject:tuesBtn];
//     [self.monBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    

    IKGMMainPageDateButton *wedBtn = [IKGMMainPageDateButton buttonWithType:UIButtonTypeCustom];
    [wedBtn setDateAndNum:@"三" num:@"7"];
    [self addSubview: wedBtn];
    self.wedBtn = wedBtn;
    [_btnArray addObject:wedBtn];
//     [self.monBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    IKGMMainPageDateButton *thurBtn= [IKGMMainPageDateButton buttonWithType:UIButtonTypeCustom];
    [thurBtn setDateAndNum:@"四" num:@"8"];
    [self addSubview: thurBtn];
    [_btnArray addObject:thurBtn];
    self.thurBtn = thurBtn;
//     [self.monBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
  
    
    IKGMMainPageDateButton *friBtn = [IKGMMainPageDateButton buttonWithType:UIButtonTypeCustom];
    [friBtn setDateAndNum:@"五" num:@"9"];
    [self addSubview: friBtn];
    self.friBtn = friBtn;
     [_btnArray addObject:friBtn];
//     [self.monBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    IKGMMainPageDateButton *satBtn =[IKGMMainPageDateButton buttonWithType:UIButtonTypeCustom];
    [satBtn setDateAndNum:@"六" num:@"10"];
    [self addSubview: satBtn];
    self.satBtn = satBtn;
     [_btnArray addObject:satBtn];
//     [self.monBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    IKGMMainPageDateButton *sunBtn =[IKGMMainPageDateButton buttonWithType:UIButtonTypeCustom];
    [sunBtn setDateAndNum:@"日" num:@"11"];
    [self addSubview:sunBtn];
    self.sunBtn = sunBtn;
     [_btnArray addObject:satBtn];
//     [self.monBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)layoutUI {
    CGFloat width = self.frame.size.width/7;
    [self.sunBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.left.bottom.equalTo(self);
        make.width.mas_equalTo(width);
    }];

    [self.monBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.bottom.equalTo(self);
        make.left.equalTo(self.sunBtn.mas_right);
        
    }];
    [self.tuesBtn mas_makeConstraints:^(MASConstraintMaker *make) {
         make.height.width.bottom.equalTo(self);
         make.left.equalTo(self.monBtn.mas_right);
    }];
    [self.wedBtn mas_makeConstraints:^(MASConstraintMaker *make) {
          make.height.width.bottom.equalTo(self);
         make.left.equalTo(self.tuesBtn.mas_right);
    }];
    [self.thurBtn mas_makeConstraints:^(MASConstraintMaker *make) {
          make.height.width.bottom.equalTo(self);
         make.left.equalTo(self.wedBtn.mas_right);
    }];
    [self.friBtn mas_makeConstraints:^(MASConstraintMaker *make) {
          make.height.width.bottom.equalTo(self);
         make.left.equalTo(self.thurBtn.mas_right);
    }];
    [self.satBtn mas_makeConstraints:^(MASConstraintMaker *make) {
         make.height.width.bottom.equalTo(self);
         make.left.equalTo(self.friBtn.mas_right);
    }];
}


@end
