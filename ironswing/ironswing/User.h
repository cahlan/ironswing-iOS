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

@property (weak, nonatomic) NSString *uid;
@property (weak, nonatomic) NSString *fb_id;
@property (weak, nonatomic) NSString *email;
@property (weak, nonatomic) NSString *firstname;
@property (weak, nonatomic) NSString *lastname;
@property (weak, nonatomic) NSDate *createdAt;
@property (weak, nonatomic) NSDate *updatedAt;
@property (weak, nonatomic) NSString *type;

@end
