//
//  DataStore.h
//  ironswing
//
//  Created by Cahlan Sharp on 9/5/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface DataStore : NSObject

+ (DataStore *)sharedInstance;
@property (strong, nonatomic) NSArray *submissions;
@property (strong, nonatomic) User *currentUser;

@end
