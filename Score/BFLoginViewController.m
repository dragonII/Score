//
//  BFLoginViewController.m
//  Score
//
//  Created by Wang Long on 12/23/14.
//  Copyright (c) 2014 Wang Long. All rights reserved.
//

#import "BFAppDelegate.h"
#import "BFLoginViewController.h"

@interface BFLoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *sinaButton;
@property (weak, nonatomic) IBOutlet UIButton *phoneButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@property (strong, nonatomic) UINavigationController *rootNavigationVC;

@end

@implementation BFLoginViewController

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
    
    BFAppDelegate *delegate = (BFAppDelegate *)[[UIApplication sharedApplication] delegate];
    self.rootNavigationVC = delegate.rootNavigationVC;
    
    [self initViewScreen];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.rootNavigationVC.navigationBarHidden = YES;
}

- (void)initViewScreen
{
    self.sinaButton.layer.cornerRadius = 5.0f;
    self.phoneButton.layer.cornerRadius = 5.0f;
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    self.rootNavigationVC.navigationBarHidden = NO;
}

@end
