//
//  Utils.h
//  ironswing
//
//  Created by Cahlan Sharp on 9/5/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+ (Utils *)sharedInstance;
+ (NSString *)formatDate:(NSDate *)date format:(NSString *)format;
+ (NSDate *)dateFromTimestamp:(NSString *)timestamp;
- (NSString *)constructUrlFromPath:(NSString *)path;

@end
