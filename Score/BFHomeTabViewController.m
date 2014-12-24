//
//  BFHomeTabViewController.m
//  Score
//
//  Created by Wang Long on 12/24/14.
//  Copyright (c) 2014 Wang Long. All rights reserved.
//

#import "BFHomeTabViewController.h"

@interface BFHomeTabViewController ()

@end

@implementation BFHomeTabViewController

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
    self.navigationController.navigationBar.hidden = YES;
    
    [self initButtonsInView];
}

- (void)buttonWithColor:(UIColor *)color Rect:(CGRect)rect Tag:(int)tag
{
    UIButton *button = [[UIButton alloc] initWithFrame:rect];
    button.backgroundColor = color;
    button.layer.cornerRadius = 5.0f;
    button.tag = tag;
    
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)buttonPressed:(UIButton *)button
{
    NSLog(@"Button %d Pressed", button.tag);
}

- (void)initButtonsInView
{
    [self buttonWithColor:[UIColor
                           colorWithRed:221/255.0f
                           green:76/255.0f
                           blue:97/255.0f
                           alpha:1.0f]
                     Rect:CGRectMake(5, 93, 153, 129)
                      Tag:2001];
    
    [self buttonWithColor:[UIColor
                           colorWithRed:241/255.0f
                           green:118/255.0f
                           blue:62/255.0f
                           alpha:1.0f]
                     Rect:CGRectMake(5, 227, 153, 63)
                      Tag:2002];
    
    [self buttonWithColor:[UIColor
                           colorWithRed:233/255.0f
                           green:165/255.0f
                           blue:61/255.0f
                           alpha:1.0f]
                     Rect:CGRectMake(5, 295, 74, 63)
                      Tag:2003];
    
    [self buttonWithColor:[UIColor
                           colorWithRed:233/255.0f
                           green:165/255.0f
                           blue:61/255.0f
                           alpha:1.0f]
                     Rect:CGRectMake(83, 295, 74, 63)
                      Tag:2004];
    
    [self buttonWithColor:[UIColor
                           colorWithRed:187/255.0f
                           green:197/255.0f
                           blue:63/255.0f
                           alpha:1.0f]
                     Rect:CGRectMake(5, 363, 74, 63)
                      Tag:2005];
    
    [self buttonWithColor:[UIColor
                           colorWithRed:187/255.0f
                           green:197/255.0f
                           blue:63/255.0f
                           alpha:1.0f]
                     Rect:CGRectMake(83, 363, 74, 63)
                      Tag:2006];

    [self buttonWithColor:[UIColor
                           colorWithRed:114/255.0f
                           green:120/255.0f
                           blue:222/255.0f
                           alpha:1.0f]
                     Rect:CGRectMake(163, 93, 153, 62)
                      Tag:2007];
    
    [self buttonWithColor:[UIColor
                           colorWithRed:96/255.0f
                           green:154/255.0f
                           blue:230/255.0f
                           alpha:1.0f]
                     Rect:CGRectMake(163, 160, 153, 130)
                      Tag:2008];
    
    [self buttonWithColor:[UIColor
                           colorWithRed:65/255.0f
                           green:173/255.0f
                           blue:222/255.0f
                           alpha:1.0f]
                     Rect:CGRectMake(163, 295, 74, 63)
                      Tag:2009];
    
    [self buttonWithColor:[UIColor
                           colorWithRed:65/255.0f
                           green:173/255.0f
                           blue:222/255.0f
                           alpha:1.0f]
                     Rect:CGRectMake(241, 295, 74, 63)
                      Tag:2010];
    
    [self buttonWithColor:[UIColor
                           colorWithRed:59/255.0f
                           green:198/255.0f
                           blue:203/255.0f
                           alpha:1.0f]
                     Rect:CGRectMake(163, 363, 74, 63)
                      Tag:2011];
    
    [self buttonWithColor:[UIColor
                           colorWithRed:59/255.0f
                           green:198/255.0f
                           blue:203/255.0f
                           alpha:1.0f]
                     Rect:CGRectMake(241, 363, 74, 63)
                      Tag:2012];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
