//
//  BFHomeTabsViewController.m
//  Score
//
//  Created by Wang Long on 12/24/14.
//  Copyright (c) 2014 Wang Long. All rights reserved.
//

#import "BFMainTabsViewController.h"
#import "BFAppDelegate.h"

@interface BFMainTabsViewController ()

@end

@implementation BFMainTabsViewController

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
    
    self.tabBar.tintColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
