//
//  IKGMHttpRequsetManager.m
//  AutoLayoutTest
//
//  Created by mubin on 2017/12/2.
//  Copyright © 2017年 inke. All rights reserved.
 //

#import "IKGMHttpRequsetManager.h"
#import <AFNetworking.h>

@class  IKGMLoginModel;
@class  IKGMLogoutModel;
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


- (void)requsetWithLoginModel:(IKGMLoginModel*)loginModel complete:(IKGMLoginBlock)complete {
    __weak typeof(self) wself = self;
    NSString *url = @"http://192.168.17.243:11289/api/user/login";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:@"Mbcx9496" forKey:@"passwd"];
    [params setObject:@"mub" forKey:@"username"];
    [self.mar POST:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSError *error;
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        wself.ticket = [responseDictionary objectForKey:@"ticket"];
        NSLog(@"%@", responseDictionary);
        if(complete){
            complete(0);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"eadda");
        if(complete){
            complete(1);
        }
    }];
    
}

- (void)requsetWithLogOutModel:(IKGMLogoutModel*)loginModel complete:(IKGMLoginBlock)complete {
    NSString *url = @"http://192.168.17.243:11289/api/user/logout";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:self.ticket forKey:@"ticket"];
    [params setObject:@"mub" forKey:@"username"];
    [self.mar POST:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"223%@",responseObject);
        NSError *error;
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        NSLog(@"%@", responseDictionary);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"eadda");
    }];
    
    
}


- (void)requseMenu :(id)user  complete:(IKGMRequestMenu)complete {
    NSString *url = @"http://10.111.68.237:9890/api/main/menu?username=lilh";

    [self.mar POST:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
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



-(void)loginOut {
 
   
    
}


@end
