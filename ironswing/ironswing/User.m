//
//  User.m
//  ironswing
//
//  Created by Cahlan Sharp on 9/5/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "User.h"
#import "DataStore.h"
#import "Utils.h"

@implementation User

+ (User *)userFromObject: (NSDictionary *)obj
{
    User *user = [[User alloc] init];
    user.email = [obj objectForKey:@"email"];
    user.createdAt = [Utils dateFromTimestamp:[obj objectForKey:@"createdAt"]];
    user.updatedAt = [Utils dateFromTimestamp:[obj objectForKey:@"updatedAt"]];
    user.firstname = [obj objectForKey:@"firstname"];
    user.lastname = [obj objectForKey:@"lastname"];
    user.fb_id = [obj objectForKey:@"uid"];
    user._id =[obj objectForKey:@"id"];
    //store in cache
    [[DataStore sharedInstance].userCache setObject:user forKey:user._id];
    return user;
}

@end
