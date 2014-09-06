//
//  DataStore.m
//  ironswing
//
//  Created by Cahlan Sharp on 9/5/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "DataStore.h"

@implementation DataStore

+ (DataStore *)sharedInstance
{
    static DataStore *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[DataStore alloc] init];
    });
    return _sharedInstance;
}

@end
