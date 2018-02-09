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
@property (nonatomic ,strong) UIView        *conterView;


@end

@implementation IKGMLoginController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configUI];
    [self layouUI];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(transformView:) name:UIKeyboardWillChangeFrameNotification object:nil];
   
}
- (void)configUI{
    self.view.backgroundColor = k16RGBColor(0xfdd93c);
    UIImageView * bgImageview = [[UIImageView alloc]init];
    bgImageview.image = [UIImage imageNamed:@""];
    [self.view addSubview:bgImageview];
    self.bgImageView = bgImageview;
    
    IKGMLoginView* loginView =[[IKGMLoginView alloc]init];
    [self.view addSubview:loginView];
    self.loginView = loginView;
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setTitle:@"登 录" forState: UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:19];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:k16RGBColor(0x9d7200)];
    loginBtn.layer.cornerRadius =24.5;
    loginBtn.layer.masksToBounds = YES;
    [loginBtn addTarget:self action:@selector(clickLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    self.loginBtn = loginBtn;
}

- (void)layouUI{
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(110);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.height.mas_equalTo(90);
    }];
    
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(268.5);
        make.height.mas_equalTo(120);
    }];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(39);
        make.right.equalTo(self.view.mas_right).offset(-19);
        make.height.mas_equalTo(49);
        make.top.equalTo(self.loginView.mas_bottom).offset(44);
        
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

    [UIView animateWithDuration:0.25f animations:^{
        [self.view setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+deltaY/2, self.view.frame.size.width, self.view.frame.size.height)];
    }];
}

- (void)clickLoginBtn
{
    IKGMLoginModel * loginModel = [[IKGMLoginModel alloc] init];
    loginModel.passwd = self.loginView.passWordTextField.text;
    loginModel.username = self.loginView.accountTextField.text;
    [IKGMUserManager sharedInstance].userName = loginModel.username;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    __weak typeof(self) wself = self;
    [[IKGMHttpRequsetManager sharedInstance] requsetWithLoginModel:loginModel complete:^(NSInteger result){
        if(result == 1) {
             IKSGTabBarController *tabvc = [[IKSGTabBarController alloc]init];
             [IKGMUserManager sharedInstance].userName = loginModel.username;
             self.view.window.rootViewController = tabvc;
        }
        else{
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"账户或密码输入错误～" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancle = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", nil) style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alertController addAction:cancle];
           [wself presentViewController:alertController animated:NO completion:nil];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}


@end
