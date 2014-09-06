//
//  User.m
//  ironswing
//
//  Created by Cahlan Sharp on 9/5/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "User.h"
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
    user.uid = [obj objectForKey:@"uid"];
    return user;
}

@end
