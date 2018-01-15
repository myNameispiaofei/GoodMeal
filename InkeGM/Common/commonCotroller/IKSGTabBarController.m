//
//  IKSGTabBarController.m
//  AutoLayoutTest
//
//  Created by mubin on 2017/11/12.
//  Copyright © 2017年 inke. All rights reserved.
//

#import "IKSGTabBarController.h"
#import "IKGMNoticeViewController.h"
#import "IKGMMainPageViewController.h"
#import "IKGMSurplusViewController.h"
#import "IKGMMePageViewController.h"

@interface IKSGTabBarController ()

@end

@implementation IKSGTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadControllers];
    
}

-(void)loadControllers{
    
    [self addChildVc:[[IKGMSurplusViewController alloc]init] title:@"备餐" image:@"beican" selectedImage:@"beican_click"];
    
    [self addChildVc:[[IKGMMainPageViewController alloc] init] title:@"点餐" image:@"book_food" selectedImage:@"book_click"];

    [self addChildVc:[[IKGMMePageViewController alloc]init] title:@"我" image:@"me" selectedImage:@"me_click"];
    
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


@end
