//
//  IKGMHomeHeaderView.m
//  InkeGM
//
//  Created by mubin on 2018/1/11.
//  Copyright © 2018年 mubin. All rights reserved.
//

#import "IKGMBaseTooL.h"
#import <Masonry.h>
#import "IKGMHomeHeaderView.h"
#import "IKGMMeWaveAnimationView.h"

@interface IKGMHomeHeaderView ()
@property (nonatomic ,strong) UIImageView *portraitImageView;
@property (nonatomic ,strong) UILabel *nickNameLabel;
@property (nonatomic ,strong) UILabel *emailLable;


@property (nonatomic, strong) CADisplayLink *waveDisplaylink;
@property (nonatomic, strong) CAShapeLayer *firstWaveLayer;
@property (nonatomic, strong) CAShapeLayer *secondWaveLayer;

@property (nonatomic) CGFloat waveA; //水纹振幅    表示上面的A
@property (nonatomic) CGFloat waveW;//水纹周期  表示上面的ω
@property (nonatomic) CGFloat offsetX; //位移   表示上面的φ
@property (nonatomic) CGFloat currentK; //当前波浪高度Y   表示上面的C
@property (nonatomic) CGFloat waveSpeed;//水纹速度   表示波浪流动的速度
@property (nonatomic) CGFloat waterWaveWidth; //水纹宽度
@property (nonatomic, strong) UIColor *firstWaveColor; //波浪的颜色







@end

@implementation IKGMHomeHeaderView

- (instancetype)init {
    if (self = [super init]) {
        [self layoutUI];
        self.backgroundColor = k16RGBColor(0xfdd93c);
        [self setUp];
    }
    return self;
}

- (void)startWave {
    IKGMMeWaveAnimationView *waveView = [IKGMMeWaveAnimationView new];
    [waveView setClipsToBounds:YES];
    
    [self addSubview:waveView];
    
    [waveView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).offset(30);
        make.height.equalTo(@100);
        make.width.mas_equalTo(300);
    }];
    
    [self layoutIfNeeded];
    [self setNeedsLayout];
    
    [waveView setUp];
    
}

- (void)layoutUI {
    [self addSubview:self.portraitImageView];
    [self addSubview:self.nickNameLabel];
    [self addSubview:self.emailLable];
    [self.portraitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(44);
        make.left.mas_equalTo(self.mas_left).offset(18);
        make.width.height.mas_equalTo(80);
    }];
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.portraitImageView.mas_right).offset(18);
        make.top.equalTo(self.mas_top).offset(60);
        make.height.mas_equalTo(23);
        make.right.mas_equalTo(self.mas_right).offset(-18);
    }];
    [self.emailLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.nickNameLabel);
        make.top.mas_equalTo(self.nickNameLabel.mas_bottom).offset(8);
        make.height.mas_equalTo(15);
    }];
}








#pragma  -mark UI

- (UILabel *)emailLable {
    if (!_emailLable) {
        _emailLable = [[UILabel alloc]init];
        _emailLable.textColor = k16RGBColor(0x48371e);
        _emailLable.font = [UIFont systemFontOfSize:15];
        _emailLable.textAlignment = NSTextAlignmentLeft;
    }
    return  _emailLable;
}

- (UIImageView *)portraitImageView {
    if (!_portraitImageView) {
        _portraitImageView = [[UIImageView alloc]init];
    }
    return  _portraitImageView;
}

- (UILabel *)nickNameLabel {
    if (!_nickNameLabel) {
        _nickNameLabel = [[UILabel alloc]init];
        _nickNameLabel.textColor = k16RGBColor(0x48371e);
        _nickNameLabel.font = [UIFont systemFontOfSize:23];
        _nickNameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _nickNameLabel;
}

- (void)drawRect:(CGRect)rect  {
    
    
}





- (void)setUp {
    //设置波浪的宽度
    self.waterWaveWidth = self.bounds.size.width;
    //设置波浪的颜色
    self.firstWaveColor = k16RGBAColor(0xffffff,0.4);
    //设置波浪的速度
    self.waveSpeed = 0.4/M_PI;
    //初始化layer
    if (_firstWaveLayer == nil) {
        //初始化
        _firstWaveLayer = [CAShapeLayer layer];
        //设置闭环的颜色
        _firstWaveLayer.fillColor = _firstWaveColor.CGColor;
        //设置边缘线的颜色
        //        _firstWaveLayer.strokeColor = [UIColor blueColor].CGColor;
        //        //设置边缘线的宽度
        //        _firstWaveLayer.lineWidth = 4.0;
        //        _firstWaveLayer.strokeStart = 0.0;
        //        _firstWaveLayer.strokeEnd = 0.8;
        [self.layer addSublayer:_firstWaveLayer];
    }
    if (self.secondWaveLayer == nil) {
        //初始化
        self.secondWaveLayer = [CAShapeLayer layer];
        //设置闭环的颜色
        self.secondWaveLayer.fillColor = _firstWaveColor.CGColor;
        //设置边缘线的颜色
        //        _firstWaveLayer.strokeColor = [UIColor blueColor].CGColor;
        //        //设置边缘线的宽度
        //        _firstWaveLayer.lineWidth = 4.0;
        //        _firstWaveLayer.strokeStart = 0.0;
        //        _firstWaveLayer.strokeEnd = 0.8;
        [self.layer addSublayer:self.secondWaveLayer];
    }
    //设置波浪流动速度
    self.waveSpeed = 0.2;
    //设置振幅
    self.waveA = 1;
    //设置周期
    self.waveW = 1;
    //设置波浪纵向位置
    self.currentK = 15;//屏幕居中
    //启动定时器
    self.waveDisplaylink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave:)];
    [self.waveDisplaylink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
}

-(void)getCurrentWave:(CADisplayLink *)displayLink
{
    //实时的位移
    self.offsetX += self.waveSpeed;
    [self setCurrentFirstWaveLayerPath];
    [self setCurrentSecondWaveLayerPath];
}

-(void)setCurrentFirstWaveLayerPath
{
    //创建一个路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat y = self.currentK;
    //将点移动到 x=0,y=currentK的位置
    CGPathMoveToPoint(path, nil, 0, y);
    for (NSInteger x = 0.0f; x<=self.waterWaveWidth; x++) {
        //正玄波浪公式
        y = self.waveA * sin(self.waveW * x+ self.offsetX)+self.currentK;
        //将点连成线
        CGPathAddLineToPoint(path, nil, x, y);
    }
    CGPathAddLineToPoint(path, nil, self.waterWaveWidth, self.frame.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(path);
    _firstWaveLayer.path = path;
    CGPathRelease(path);
}

-(void)setCurrentSecondWaveLayerPath
{
    //创建一个路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat y = self.currentK;
    //将点移动到 x=0,y=currentK的位置
    CGPathMoveToPoint(path, nil, 0, y);
    for (NSInteger x = 0.0f; x<=self.waterWaveWidth; x++) {
        //正玄波浪公式
        y = (self.waveA+2) * sin(self.waveW * x- self.offsetX + 10)+self.currentK;
        //将点连成线
        CGPathAddLineToPoint(path, nil, x, y);
    }
    CGPathAddLineToPoint(path, nil, self.waterWaveWidth, self.frame.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(path);
    self.secondWaveLayer.path = path;
    CGPathRelease(path);
}




@end
