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
    
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"sweet-golf-bg.png"] drawInRect:self.view.frame];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    self.playerButton.backgroundColor = [UIColor blueColor];
    
    self.proButton.backgroundColor = [UIColor blueColor];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startPlayer:(id)sender {
    self.ds.isPro = NO;
}
- (IBAction)startPro:(id)sender {
    self.ds.isPro = YES;

}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}


@end
