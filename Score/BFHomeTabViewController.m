//
//  BFHomeTabViewController.m
//  Score
//
//  Created by Wang Long on 12/24/14.
//  Copyright (c) 2014 Wang Long. All rights reserved.
//

#import "BFHomeTabViewController.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "MainPageCollectionCell.h"

static NSString *MainPageCellIdentifier = @"MainPageCell";

@interface BFHomeTabViewController () <UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout>

@property (strong, nonatomic) UICollectionView *bodyCollectionView;

@property (strong, nonatomic) NSArray *shopList;

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

- (void)initTestData
{
    self.shopList = @[@{@"name":@"shop1", @"description":@"shop one"},
                      @{@"name":@"shop2", @"description":@"shop two"},
                      @{@"name":@"shop3", @"description":@"shop three"},
                      @{@"name":@"shop4", @"description":@"shop four"},
                      @{@"name":@"shop5", @"description":@"shop five"},
                      @{@"name":@"shop6", @"description":@"shop six"},
                      @{@"name":@"shop7", @"description":@"shop seven"},
                      @{@"name":@"shop8", @"description":@"shop eight"},
                      @{@"name":@"shop9", @"description":@"shop nine"}
                      ];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //q[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];

    //self.navigationController.navigationBar.hidden = YES;
    
    //[self initButtonsInView];
    
    [self initTestData];
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    self.bodyCollectionView = [self makeBodyCollectionView];
    
    [self.view addSubview:self.bodyCollectionView];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self hideNavigationBar];
}

- (void)hideNavigationBar
{
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)showNavigationBar
{
    [self.navigationController.navigationBar setHidden:NO];
}

- (UICollectionView *)makeBodyCollectionView
{
    if(!self.bodyCollectionView)
    {
        CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
        layout.minimumColumnSpacing = 2;
        layout.minimumInteritemSpacing = 2;
        
        CGRect rect = CGRectMake(self.view.bounds.origin.x,
                                 self.view.bounds.origin.y + 184,
                                 self.view.bounds.size.width,
                                 self.view.bounds.size.height - 49 - 184);
        
        self.bodyCollectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:layout];
        self.bodyCollectionView.backgroundColor = [UIColor blackColor];
        self.bodyCollectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.bodyCollectionView.dataSource = self;
        self.bodyCollectionView.delegate = self;
        self.bodyCollectionView.backgroundColor = [UIColor whiteColor];
        
        [self.bodyCollectionView registerClass:[MainPageCollectionCell class] forCellWithReuseIdentifier:MainPageCellIdentifier];
        
        UINib *nib = [UINib nibWithNibName:@"MainPageCollectionCell" bundle:nil];
        [self.bodyCollectionView registerNib:nib forCellWithReuseIdentifier:MainPageCellIdentifier];
    }
    
    return self.bodyCollectionView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(105, 105);
    
    //return CGSizeMake(self.bodyCollectionView.bounds.size.width, 40);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    CHTCollectionViewWaterfallLayout *layout = (CHTCollectionViewWaterfallLayout *)self.bodyCollectionView.collectionViewLayout;

    layout.columnCount = 3;
    
    return [self.shopList count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MainPageCollectionCell *cell = (MainPageCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:MainPageCellIdentifier forIndexPath:indexPath];
    
    NSDictionary *dict = [self.shopList objectAtIndex:indexPath.row];
    cell.nameString = [dict objectForKey:@"name"];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@ Selected", [[self.shopList objectAtIndex:indexPath.row] objectForKey:@"description"]);
    
    [self performSegueWithIdentifier:@"ShowShopsView" sender:self];
}

- (void)buttonWithColor:(UIColor *)color Rect:(CGRect)rect Tag:(int)tag
{
    UIButton *button = [[UIButton alloc] initWithFrame:rect];
    button.backgroundColor = color;
    button.layer.cornerRadius = 5.0f;
    button.tag = tag;
    
    [button addTarget:nil action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)buttonPressed:(UIButton *)button
{
    NSLog(@"Button %ld Pressed", (long)button.tag);
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

    UIButton *qScanButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 30, 40, 40)];
    [qScanButton setImage:[UIImage imageNamed:@"testIcon"] forState:UIControlStateNormal];
    [qScanButton addTarget:nil action:@selector(showScanViewByModal) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:qScanButton];
    
    UIButton *switchButton = [[UIButton alloc] initWithFrame:CGRectMake(275, 30, 40, 40)];
    [switchButton setImage:[UIImage imageNamed:@"testIcon"] forState:UIControlStateNormal];
    [self.view addSubview:switchButton];
}


- (void)showScanViewByModal
{
    [self performSegueWithIdentifier:@"ShowScanView" sender:nil];
}
 

- (IBAction)showScanView:(id)sender
{
    [self performSegueWithIdentifier:@"ShowScanView" sender:nil];
}

- (IBAction)cancelToHomeTab:(UIStoryboardSegue *)segue
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
