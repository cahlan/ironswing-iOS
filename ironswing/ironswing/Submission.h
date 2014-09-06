//
//  Submission.h
//  ironswing
//
//  Created by Cahlan Sharp on 9/6/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Submission : NSObject

+ (Submission *)submissionFromObject: (NSDictionary *)obj;

@property (strong, nonatomic) NSDate *createdAt;
@property (strong, nonatomic) NSDate *updatedAt;
@property (strong, nonatomic) User *user;

@end
