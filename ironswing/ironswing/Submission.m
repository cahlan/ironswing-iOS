//
//  Submission.m
//  ironswing
//
//  Created by Cahlan Sharp on 9/6/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "Submission.h"
#import "User.h"
#import "Utils.h"

@implementation Submission


+ (Submission *)submissionFromObject: (NSDictionary *)obj
{
    Submission *sub = [[Submission alloc] init];
    sub.createdAt = [Utils dateFromTimestamp:[obj valueForKey:@"createdAt"]];
    sub.updatedAt = [Utils dateFromTimestamp:[obj valueForKey:@"updatedAt"]];
    if ([obj valueForKey:@"user"]) {
        sub.user = [User userFromObject:[obj valueForKey:@"user"]];
    }
    return sub;
}
                     
@end
