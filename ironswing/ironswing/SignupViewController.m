//
//  GolferSignupViewController.m
//  ironswing
//
//  Created by Cahlan Sharp on 9/5/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "SignupViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "User.h"

@interface SignupViewController ()

@property (weak, nonatomic) IBOutlet FBLoginView *loginButton;
@property (weak, nonatomic) IBOutlet FBProfilePictureView *profilePicture;

@end

@implementation SignupViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.loginButton.delegate = self;
    /*
    FBLoginView *loginView = [[FBLoginView alloc] init];
    loginView.center = self.view.center;
    [self.view addSubview:loginView];
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user {
    
    User *_user = [User instance];
    _user.fb_id = user.objectID;
    
    self.profilePicture.profileID = _user.fb_id;
}

@end
