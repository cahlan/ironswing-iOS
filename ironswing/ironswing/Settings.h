//
//  Settings.h
//  ironswing
//
//  Created by Cahlan Sharp on 9/5/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Settings : NSObject

+ (Settings *)sharedInstance;
@property (weak, nonatomic) NSString *hostname;

@end
