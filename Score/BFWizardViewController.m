//
//  BFWizardViewController.m
//  Score
//
//  Created by Wang Long on 12/24/14.
//  Copyright (c) 2014 Wang Long. All rights reserved.
//

#import "BFWizardViewController.h"
#import "BFAppDelegate.h"

@interface BFWizardViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSMutableArray *images;

@end

@implementation BFWizardViewController

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
    [delegate.rootNavigationVC.navigationBar setHidden:YES];
    
    if(delegate.showWizard == NO)
    {
        [self performSegueWithIdentifier:@"ShowHomeTabs" sender:nil];
    }
    
    self.images = [NSMutableArray array];
    [self.images addObject:@"wizard_p1"];
    [self.images addObject:@"wizard_p2"];
    [self.images addObject:@"wizard_p3"];
    
    [self addSwipeGestureRecognizer];
}

- (void)addSwipeGestureRecognizer
{
    UISwipeGestureRecognizer *horRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(horizontalSwipe:)];
    horRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:horRecognizer];
}

- (void)horizontalSwipe:(UIGestureRecognizer *)recognizer
{
    static int pageIndex = 0;
    UIImage *image;
    UIButton *button;
    CGFloat height = self.view.bounds.size.height;
    //NSLog(@"Swipe detected");
    
    pageIndex++;
    NSLog(@"pageIndex = %d", pageIndex);
    if(pageIndex < [self.images count])
    {
        NSLog(@"changing image");
        image = [UIImage imageNamed:self.images[pageIndex]];
        self.imageView.image = image;
    }
    
    if(pageIndex == [self.images count] - 1)
    {
        button = [[UIButton alloc] initWithFrame:CGRectMake(80.0f, height - 45.0f - 45.0f, 160.0f, 45.0f)];
        button.backgroundColor = [UIColor whiteColor];
        //button.titleLabel.textColor = [UIColor blackColor];
        //[button setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:226/255.0f green:185/255.0f blue:107/255.0f alpha:1.0f] forState:UIControlStateNormal];
        [button setTitle:@"马上进入" forState:UIControlStateNormal];
        
        button.layer.cornerRadius = 5.0f;
        
        [button addTarget:self action:@selector(enterPressed) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
    }
    
    //self.imageView.image = image;
}

- (void)enterPressed
{
    [self performSegueWithIdentifier:@"ShowHomeTabs" sender:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.imageView.image = [UIImage imageNamed:@"wizard_p1"];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    //[self dismissViewControllerAnimated:NO completion:nil];
}


- (void)dealloc
{
    NSLog(@"dealloc %@", self);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
