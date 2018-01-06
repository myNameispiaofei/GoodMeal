//
//  IKGMHttpRequsetManager.m
//  AutoLayoutTest
//
//  Created by mubin on 2017/12/2.
//  Copyright © 2017年 inke. All rights reserved.
 //

#import "IKGMHttpRequsetManager.h"
#import <AFNetworking.h>
#import "IKGMLoginModel.h"
#import "IKGMUserManager.h"

@class  IKGMLogoutModel;
@class  IKGMOrderModel;
@interface IKGMHttpRequsetManager ()

@property (nonatomic,strong) AFHTTPRequestOperationManager *mar;
@property (nonatomic,strong) NSString *ticket;

@end


@implementation IKGMHttpRequsetManager

+(instancetype)sharedInstance {
    static IKGMHttpRequsetManager * instance ;
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        if(!instance) {
            instance = [[IKGMHttpRequsetManager alloc]init];
        }
    });
    return  instance;
}

- (instancetype) init {
    if(self == [super init]) {
        self.mar = [AFHTTPRequestOperationManager manager];
        self.mar.requestSerializer = [AFJSONRequestSerializer serializer];
        self.mar.responseSerializer = [AFHTTPResponseSerializer serializer];
        self.ticket = @"";
    }
    return  self;
}

// 登录接口
- (void)requsetWithLoginModel:(IKGMLoginModel*)loginModel complete:(IKGMLoginBlock)complete {
    
    __weak typeof(self) wself = self;
    NSString *url = @"http://47.95.160.110/api/user/login";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:loginModel.passwd forKey:@"passwd"];
    [params setObject:loginModel.username forKey:@"username"];
    if(loginModel)
    [self.mar POST:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSError *error;
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        wself.ticket = [responseDictionary objectForKey:@"ticket"];
        if(wself.ticket){
            if(complete){
                complete(1);
            }
        }else {
            if(complete){
                complete(0);
            }
        }
        NSLog(@"%@", responseDictionary);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"eadda");
        if(complete){
            complete(0);
        }
    }];
    
}
//
- (void)requsetWithLogOutModel:(IKGMLogoutModel*)loginModel complete:(IKGMLoginBlock)complete {
    NSString *url = @"http://192.168.17.243:11289/api/user/logout";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:self.ticket forKey:@"ticket"];
    [params setObject:[IKGMUserManager sharedInstance].userName forKey:@"username"];
    [self.mar POST:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"223%@",responseObject);
        NSError *error;
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        NSLog(@"%@", responseDictionary);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"eadda");
    }];
}

// 主页接口
- (void)requseMenu :(id)user  complete:(IKGMRequestMenu)complete {
    NSString *url = @"http://47.95.160.110/api/main/menu";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:[IKGMUserManager sharedInstance].userName forKey:@"username"];
    [params setObject:self.ticket forKey:@"ticket"];
    [self.mar GET:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"223%@",responseObject);
        NSError *error;
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        if(complete) {
            complete(responseDictionary ,0);
        }
        NSLog(@"%@", responseDictionary);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"eadda");
    }];
}


// 点餐 下订单
- (void)orderGoodMeal:(IKGMOrderModel *)order complete:(IKGMOrderResult)complete {
    NSString *url  = @"http://47.95.160.110/api/order/add";
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    [params setObject:[IKGMUserManager sharedInstance].userName forKey:@"username"];
    [params setObject:@"1" forKey:@"restaurantId"];
    [params setObject:@"1" forKey:@"dishId"];
    [params setObject:self.ticket forKey:@"ticket"];
    [self.mar GET:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"223%@",responseObject);
        NSError *error;
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        if(complete) {
            complete(responseDictionary ,0);
            NSLog(@"d订餐成功！！！！！！！！！！！！");
        }
        NSLog(@"%@", responseDictionary);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"eadda");
    }];
}

//  备餐    添加
- (void)preparedish:(id)dish complete:(IKGMOrderResult)complete {
    NSString *url = @"http://47.95.160.110/api/preparedish/add";
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    [params setObject:[IKGMUserManager sharedInstance].userName forKey:@"username"];
    [params setObject:self.ticket  forKey:@"ticket"];
    
    [self.mar GET:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSError *error;
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        if(complete) {
            complete(responseDictionary ,0);
        }
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"failure");
    }];
}

// 备餐  列表

- (void)preparedishList:(id)dish complete:(IKGMOrderResult)complete {
    NSString *url = @"http://47.95.160.110/api/preparedish/grab";
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    [params setObject:[IKGMUserManager sharedInstance].userName forKey:@"username"];
    [params setObject:self.ticket  forKey:@"ticket"];
    
    [self.mar GET:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSError *error;
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        if(complete) {
            complete(responseDictionary ,0);
        }
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"failure");
    }];
}

// 抢备餐

- (void)getDinner:(id)dish complete:(IKGMOrderResult) complete {
    NSString *url = @"http://47.95.160.110/api/preparedish/grab";
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    [params setObject:[IKGMUserManager sharedInstance].userName forKey:@"username"];
    [params setObject:self.ticket  forKey:@"ticket"];
    [self.mar GET:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSError *error;
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        if(complete) {
            complete(responseDictionary ,0);
        }
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"failure");
    }];
}


@end
