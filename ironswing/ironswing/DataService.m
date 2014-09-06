//
//  DataService.m
//  ironswing
//
//  Created by Cahlan Sharp on 9/5/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "DataService.h"
#import <AFNetworking/AFNetworking.h>
#import "Utils.h"
#import "User.h"
#import "DataStore.h"

@implementation DataService

+ (DataService *)sharedInstance
{
    static DataService *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[DataService alloc] init];
    });
    return _sharedInstance;
}

+ (AFHTTPSessionManager *)api {
    static AFHTTPSessionManager *api = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        api = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://104.131.2.98"]];
        api.responseSerializer = [AFJSONResponseSerializer serializer];
    });
    return api;
}

- (void)getSubmissions:(void (^)(NSURLSessionDataTask *task, id responseObject))callback failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    User *user = [User sharedInstance];
    NSDictionary *params = @{@"uid": user.fb_id};
    [[DataService api] GET:@"submission" parameters:params success:callback failure:nil];
}

@end
