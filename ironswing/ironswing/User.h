//
//  User.h
//  ironswing
//
//  Created by Cahlan Sharp on 9/5/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

+ (User *)userFromObject: (NSDictionary *)obj;

@property (strong, nonatomic) NSString *uid;
@property (strong, nonatomic) NSString *fb_id;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *firstname;
@property (strong, nonatomic) NSString *lastname;
@property (strong, nonatomic) NSDate *createdAt;
@property (strong, nonatomic) NSDate *updatedAt;
@property (strong, nonatomic) NSString *type;

@end
