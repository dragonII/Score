//
//  BFAppDelegate.h
//  Score
//
//  Created by Wang Long on 12/23/14.
//  Copyright (c) 2014 Wang Long. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BFNavigationController.h"

@interface BFAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) BFNavigationController *rootNavigationVC;
@property (nonatomic) BOOL showWizard;

@end
