//
//  RAViewController.m
//  ironswing
//
//  Created by Ryan Allred on 9/5/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//


#import "RAViewController.h"
#import "DataStore.h"

@interface RAViewController ()
@property (weak, nonatomic) IBOutlet UIButton *playerButton;
@property (weak, nonatomic) IBOutlet UIButton *proButton;
@property (weak, nonatomic) DataStore *ds;
@end

@implementation RAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.ds = [DataStore sharedInstance];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startPlayer:(id)sender {
    self.ds.currentUser.type = @"player";
}
- (IBAction)startPro:(id)sender {
    self.ds.currentUser.type = @"pro";

}


@end
