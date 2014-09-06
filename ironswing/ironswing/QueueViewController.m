//
//  QueueViewController.m
//  ironswing
//
//  Created by Cahlan Sharp on 9/5/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "RAPlayerQueueCell.h"
#import <AFNetworking/AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "QueueViewController.h"
#import "DataService.h"
#import "DataStore.h"
#import "Utils.h"

@interface QueueViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) DataStore *ds;

@end

@implementation QueueViewController

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
    
    self.ds = [DataStore sharedInstance];
    
    NSString *path = @"submission";
    NSMutableDictionary *dict = [@{} mutableCopy];
    
    if ([self.ds.currentUser.type isEqualToString:@"player"]){
        [dict setValue:self.ds.currentUser.uid forKey:@"id"];
        path = @"my_submisions";
    }
    
    self.tableView.dataSource = self;
    
    //get data
    void (^success)(NSURLSessionDataTask *task, id responseObject) = ^void(NSURLSessionDataTask *task, id responseObject) {
        [self.ds setSubmissionsFromArrayOfObjects:responseObject];
        [self.tableView reloadData];
    };
    void (^failure)(NSURLSessionDataTask *task, NSError *error) = ^void(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error! %@", error);
    };
    
    //my_submissions
    //?uid=
    [[DataService sharedInstance] getSubmissionsFromPath:path withParams:dict callback:success failure:failure];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RAPlayerQueueCell *submissionCell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Submission *sub = [self.ds.submissions objectAtIndex:indexPath.row];
    submissionCell.cellDate.text = [Utils formatDate:sub.createdAt format:@"M/dd"];
    submissionCell.avatarImage.profileID = sub.user.uid;
    [submissionCell.image1 sd_setImageWithURL:[NSURL URLWithString:@"http://img.ehowcdn.com/other-people/viper/media/e1635fa1-96fb-4251-ace9-4dcb9393c8f2/jpeg/d0e5284b-bd4d-4242-adc4-b006cee8b008_0.jpg"] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    [submissionCell.image2 sd_setImageWithURL:[NSURL URLWithString:@"http://img.ehowcdn.com/other-people/viper/media/e1635fa1-96fb-4251-ace9-4dcb9393c8f2/jpeg/d0e5284b-bd4d-4242-adc4-b006cee8b008_0.jpg"] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    return submissionCell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.ds.submissions count];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
