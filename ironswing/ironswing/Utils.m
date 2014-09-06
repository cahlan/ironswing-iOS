//
//  Utils.m
//  ironswing
//
//  Created by Cahlan Sharp on 9/5/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "Utils.h"
#import "Settings.h"

@interface Utils()
@property (weak, nonatomic) Settings *settings;
@end

@implementation Utils

+ (Utils *)sharedInstance
{
    static Utils *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[Utils alloc] init];
    });
    return _sharedInstance;
}

+ (NSString *)formatDate:(NSDate *)date format:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:date];
}

+ (NSDate *)dateFromTimestamp:(NSString *)timestamp
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    NSDate *date = nil;
    NSError *error = nil;
    if(![dateFormatter getObjectValue:&date forString:timestamp range:nil error:&error]) {
        return nil;
    }
    return date;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.settings = [Settings sharedInstance];
    }
    return self;
}

- (NSString *)constructUrlFromPath:(NSString *)path
{
    return [NSString stringWithFormat:@"http://%@/%@", self.settings.hostname, path];
}

@end
