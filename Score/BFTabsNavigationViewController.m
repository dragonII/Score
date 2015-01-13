//
//  BFTabsNavigationViewController.m
//  Score
//
//  Created by Wang Long on 1/13/15.
//  Copyright (c) 2015 Wang Long. All rights reserved.
//

#import "BFTabsNavigationViewController.h"

@interface BFTabsNavigationViewController ()

@end

@implementation BFTabsNavigationViewController

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
	
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
