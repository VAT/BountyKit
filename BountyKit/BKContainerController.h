//
//  BKContainerController.h
//  BountyKit
//
//  Created by denizz.tret on 14.02.14.
//  Copyright (c) 2014 pythongem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BKContainerController : UIViewController

- (void) swapViewControllersTo:(UIViewController *)toViewController;
- (void) swapViewControllersToFirst:(UIViewController *)toViewController;

@end
