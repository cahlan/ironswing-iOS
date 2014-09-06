//
//  PageViewController.h
//  ironswing
//
//  Created by Ryan Allred on 9/5/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageViewController : UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;


//- (IBAction)startWalkthrough:(id)sender;
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;


@end
