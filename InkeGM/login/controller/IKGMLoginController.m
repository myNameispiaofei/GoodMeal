//
//  IKGMLoginController.m
//  AutoLayoutTest
//
//  Created by mubin on 2017/11/12.
//  Copyright © 2017年 inke. All rights reserved.
//

#import <Masonry.h>

#import "IKGMLoginController.h"
#import "IKGMBaseTooL.h"
#import "IKGMLoginView.h"
#import "IKGMLoginModel.h"
#import "IKSGTabBarController.h"
#import "IKGMHttpRequsetManager.h"
#import "IKGMUserManager.h"
@interface IKGMLoginController ()
@property (nonatomic ,strong) IKGMLoginView *loginView;
@property (nonatomic ,strong) UIButton      *loginBtn;
@property (nonatomic ,strong) UIImageView   *bgImageView;
@property (nonatomic ,strong) UIView         *conterView;


@end

@implementation IKGMLoginController

- (void)viewDidLoad {
    [super viewDidLoad];


    [self configUI];
    [self layouUI];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(transformView:) name:UIKeyboardWillChangeFrameNotification object:nil];
   
}
- (void)configUI{
   
    UIImageView * bgImageview = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    bgImageview.image = [UIImage imageNamed:@"bg_image.jpg"];
    [self.view addSubview:bgImageview];
    self.bgImageView = bgImageview;
    
    IKGMLoginView* loginView =[[IKGMLoginView alloc]init];
    [self.view addSubview:loginView];
    self.loginView= loginView;
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setTitle:@"登 录" forState: UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:k16RGBColor(0xFF8C00)];
    loginBtn.layer.cornerRadius =24.5;
    loginBtn.layer.masksToBounds = YES;
    [loginBtn addTarget:self action:@selector(clickLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    self.loginBtn = loginBtn;
}

- (void)layouUI{
    
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(350);
        make.height.mas_equalTo(120);
    }];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(39);
        make.right.equalTo(self.view.mas_right).offset(-19);
        make.height.mas_equalTo(49);
        make.top.equalTo(self.loginView.mas_bottom).offset(25);
        
    }];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [event.allTouches anyObject];
    CGPoint point = [touch locationInView:self.view];
    if (!CGRectContainsPoint(self.loginView.frame,point)){
        [self.view endEditing:YES];
    }
    
}
-(void)transformView:(NSNotification *)aNSNotification
{
    NSValue *keyBoardBeginBounds=[[aNSNotification userInfo]objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect beginRect=[keyBoardBeginBounds CGRectValue];
    

    NSValue *keyBoardEndBounds=[[aNSNotification userInfo]objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect  endRect=[keyBoardEndBounds CGRectValue];
    
    CGFloat deltaY= endRect.origin.y-beginRect.origin.y;
    NSLog(@"看看这个变化的Y值:%f",deltaY);
    

    [UIView animateWithDuration:0.25f animations:^{
        [self.view setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+deltaY/2, self.view.frame.size.width, self.view.frame.size.height)];
    }];
}

- (void)clickLoginBtn
{
    IKGMLoginModel * loginModel = [[IKGMLoginModel alloc] init];
    loginModel.passwd = self.loginView.passWordTextField.text;
    loginModel.username = self.loginView.accountTextField.text;
    
    [[IKGMHttpRequsetManager sharedInstance] requsetWithLoginModel:loginModel complete:^(NSInteger result){
        if(result == 1) {
             IKSGTabBarController *tabvc = [[IKSGTabBarController alloc]init];
             [IKGMUserManager sharedInstance].userName = loginModel.username;
             self.view.window.rootViewController = tabvc;
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}


@end
