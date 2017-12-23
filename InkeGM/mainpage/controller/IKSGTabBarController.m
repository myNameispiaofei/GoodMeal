//
//  IKSGTabBarController.m
//  AutoLayoutTest
//
//  Created by mubin on 2017/11/12.
//  Copyright © 2017年 inke. All rights reserved.
//

#import "IKSGTabBarController.h"
#import "IKGMHomepageController.h"
#import "IKGMMainViewController.h"
#import "IKGMNoticeViewController.h"
#import "IKGMSurplusViewController.h"
@interface IKSGTabBarController ()

@end

@implementation IKSGTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadControllers];
    
}

-(void)loadControllers{
    
    [self addChildVc:[[IKGMMainViewController alloc] init] title:@"主页" image:@"mainpage_no" selectedImage:@"mainpage"];
    [self addChildVc:[[IKGMNoticeViewController alloc]init] title:@"通知" image:@"notice_no" selectedImage:@"notice"];
    [self addChildVc:[[IKGMSurplusViewController alloc]init] title:@"备餐" image:@"food_no" selectedImage:@"food"];
    [self addChildVc:[[IKGMHomepageController alloc]init] title:@"我的" image:@"home_no" selectedImage:@"home"];
    
}


- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:childVc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
