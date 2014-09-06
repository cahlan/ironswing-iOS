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

@property (weak, nonatomic) NSString *createdAt;
@property (weak, nonatomic) NSString *updatedAt;
@property (weak, nonatomic) User *user;

@end
