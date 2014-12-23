//
//  BFLoginViewController.m
//  Score
//
//  Created by Wang Long on 12/23/14.
//  Copyright (c) 2014 Wang Long. All rights reserved.
//

#import "BFLoginViewController.h"

@interface BFLoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *sinaButton;
@property (weak, nonatomic) IBOutlet UIButton *phoneNumButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
