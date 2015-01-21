//
//  BFProductsViewController.h
//  Score
//
//  Created by Wang Long on 1/14/15.
//  Copyright (c) 2015 Wang Long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BFShopsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *productsTable;

- (IBAction)backToShopsView:(UIStoryboardSegue *)segue;

@end
