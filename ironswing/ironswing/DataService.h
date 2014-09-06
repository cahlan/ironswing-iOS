//
//  DataService.h
//  ironswing
//
//  Created by Cahlan Sharp on 9/5/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface DataService : NSObject

+ (DataService *)sharedInstance;

- (void)getCurrentUserDataFromFacebookId:(NSString *)fb_id callback:(void (^)(NSURLSessionDataTask *task, id responseObject))callback failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

- (void)getSubmissionsFromPath:(NSString *)path withParams: (NSMutableDictionary *)params callback:(void (^)(NSURLSessionDataTask *task, id responseObject))callback failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
