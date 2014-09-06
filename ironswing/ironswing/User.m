//
//  User.m
//  ironswing
//
//  Created by Cahlan Sharp on 9/5/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "User.h"

@implementation User

+ (User *)sharedInstance
{
    static User *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[User alloc] init];
    });
    return _sharedInstance;
}

@end
