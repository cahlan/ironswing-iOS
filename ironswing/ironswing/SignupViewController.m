//
//  GolferSignupViewController.m
//  ironswing
//
//  Created by Cahlan Sharp on 9/5/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "SignupViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "DataService.h"
#import "DataStore.h"

@interface SignupViewController ()

@property (weak, nonatomic) IBOutlet FBLoginView *loginButton;
@property (weak, nonatomic) IBOutlet FBProfilePictureView *profilePicture;

@property (weak, nonatomic) DataStore *ds;

@end

@implementation SignupViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.loginButton.delegate = self;
    
    self.ds = [DataStore sharedInstance];
    
//    FBLoginView *loginView = [[FBLoginView alloc] init];
//    loginView.center = self.view.center;
//    [self.view addSubview:loginView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user {
    
    self.ds.currentUser.fb_id = user.objectID;
    
    self.profilePicture.profileID = self.ds.currentUser.fb_id;
    
    void (^success)(NSURLSessionDataTask *task, id responseObject) = ^void(NSURLSessionDataTask *task, id responseObject) {
        NSArray *results = (NSArray *)responseObject;
        self.ds.currentUser = [User userFromObject:[results objectAtIndex:0]];
    };
    void (^failure)(NSURLSessionDataTask *task, NSError *error) = ^void(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error! %@", error);
    };
    
    [[DataService sharedInstance] getCurrentUserDataFromFacebookId:self.ds.currentUser.fb_id callback:success failure:failure];
}

@end
