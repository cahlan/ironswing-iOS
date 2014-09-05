//
//  User.m
//  ironswing
//
//  Created by Cahlan Sharp on 9/5/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "User.h"

@implementation User

+ (User *)instance
{
    static User *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[User alloc] init];
    });
    return instance;
}

@end
