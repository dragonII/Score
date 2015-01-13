//
//  BFHomeTabViewController.h
//  Score
//
//  Created by Wang Long on 12/24/14.
//  Copyright (c) 2014 Wang Long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BFHomeTabViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *headerImageView;

- (IBAction)cancelQScan:(UIStoryboardSegue *)segue;

@end
