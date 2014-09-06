//
//  RAPlayerQueueCell.h
//  ironswing
//
//  Created by Ryan Allred on 9/5/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface RAPlayerQueueCell : UITableViewCell

@property (weak, nonatomic) IBOutlet FBProfilePictureView *avatarImage;
@property (weak, nonatomic) IBOutlet UILabel *cellDate;
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;

@end
