//
//  BFWeiboLoginViewController.m
//  Score
//
//  Created by Wang Long on 12/23/14.
//  Copyright (c) 2014 Wang Long. All rights reserved.
//

#import "BFWeiboLoginViewController.h"
#import "BFAppDelegate.h"

@interface BFWeiboLoginViewController ()

@end

@implementation BFWeiboLoginViewController

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
	// Do any additional setup after loading the view.
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"In View Appear");
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    //[self setNeedsStatusBarAppearanceUpdate];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    NSLog(@"In preferred Status Style");
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancelPressed:(id)sender
{
    BFAppDelegate *delegate = (BFAppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate.rootNavigationVC popViewControllerAnimated:YES];
}

@end
