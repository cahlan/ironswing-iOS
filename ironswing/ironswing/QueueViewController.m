//
//  QueueViewController.m
//  ironswing
//
//  Created by Cahlan Sharp on 9/5/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "RAPlayerQueueCell.h"
#import <AFNetworking/AFNetworking.h>
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
    
    self.tableView.dataSource = self;
    
    //get data
    void (^success)(NSURLSessionDataTask *task, id responseObject) = ^void(NSURLSessionDataTask *task, id responseObject) {
        [self.ds setSubmissionsFromArrayOfObjects:responseObject];
        [self.tableView reloadData];
    };
    void (^failure)(NSURLSessionDataTask *task, NSError *error) = ^void(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error! %@", error);
    };
    NSMutableDictionary *dict = [@{} mutableCopy];
    [[DataService sharedInstance] getSubmissionsWithParams:dict callback:success failure:failure];
    
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
