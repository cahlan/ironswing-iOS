//
//  RAViewController.m
//  ironswing
//
//  Created by Ryan Allred on 9/5/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "RAViewController.h"

@interface RAViewController ()
@property (weak, nonatomic) IBOutlet UIButton *playerButton;
@property (weak, nonatomic) IBOutlet UIButton *coachButton;

@end

@implementation RAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startPlayer:(id)sender {
    NSLog(@"Get Started Player");
}
- (IBAction)startCoach:(id)sender {
    NSLog(@"Get Started Coach");

}

@end
