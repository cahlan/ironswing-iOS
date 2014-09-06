//
//  User.m
//  ironswing
//
//  Created by Cahlan Sharp on 9/5/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "User.h"

@implementation User

+ (User *)userFromObject: (NSDictionary *)obj
{
    NSLog(@"user %@", obj);
    User *user = [[User alloc] init];
    return user;
}

@end
