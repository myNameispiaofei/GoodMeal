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
#import "IKGMMainPageViewController.h"
#import "IKGMSurplusViewController.h"
@interface IKSGTabBarController ()

@end

@implementation IKSGTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadControllers];
    
}

-(void)loadControllers{
    
    [self addChildVc:[[IKGMSurplusViewController alloc]init] title:@"备餐" image:@"beican" selectedImage:@"beican_click"];
    
    //IKGMMainViewController
    [self addChildVc:[[IKGMMainPageViewController alloc] init] title:@"点餐" image:@"book_food" selectedImage:@"book_click"];
    [self addChildVc:[[IKGMHomepageController alloc]init] title:@"我" image:@"me" selectedImage:@"me_click"];
    
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
