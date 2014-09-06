//
//  DataStore.m
//  ironswing
//
//  Created by Cahlan Sharp on 9/5/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "DataStore.h"
#import "Utils.h"
#import "User.h"

@implementation DataStore

+ (DataStore *)sharedInstance
{
    static DataStore *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[DataStore alloc] init];
        _sharedInstance.currentUser = [[User alloc] init];
    });
    return _sharedInstance;
}

- (void)setSubmissionsFromArrayOfObjects: (NSArray *)objects
{
    NSMutableArray *subs = [[NSMutableArray alloc] initWithCapacity:[objects count]];
    for (int i = 0; i<[objects count]; i++) {
        NSDictionary *obj = [objects objectAtIndex:i];
        NSLog(@"adding objecT");
        [subs addObject:[Submission submissionFromObject:obj]];
    }
    self.submissions = [subs copy];
}

@end
