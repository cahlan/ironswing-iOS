//
//  RAViewController.m
//  ironswing
//
//  Created by Ryan Allred on 9/5/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//


#import "RAViewController.h"
#import "User.h"

@interface RAViewController ()
@property (weak, nonatomic) IBOutlet UIButton *playerButton;
@property (weak, nonatomic) IBOutlet UIButton *proButton;
@property (weak, nonatomic) User *appUser;
@end

@implementation RAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.appUser = [User instance];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startPlayer:(id)sender {
    self.appUser.type = @"player";
}
- (IBAction)startPro:(id)sender {
    self.appUser.type = @"pro";

}


@end
