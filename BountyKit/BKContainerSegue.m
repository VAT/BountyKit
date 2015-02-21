//
//  BKSceneSegue.m
//  BountyKit
//
//  Created by Denis Tretyakov on 14.02.14.
//  Copyright (c) 2014 pythongem. All rights reserved.
//

#import "BKContainerSegue.h"
#import "BKContainerController.h"

@implementation BKContainerSegue

- (void) perform {

    UIViewController *fromViewController = (UIViewController *) self.sourceViewController;
    UIViewController *toViewController = (UIViewController *) self.destinationViewController;
    UIViewController *parentViewController = fromViewController.parentViewController;

    if ([parentViewController isKindOfClass:BKContainerController.class]) {
        [(BKContainerController *)parentViewController swapViewControllersTo:toViewController];
    }
    else if ([fromViewController isKindOfClass:BKContainerController.class]) {
        [(BKContainerController *)fromViewController swapViewControllersToFirst:toViewController];
    }
}

@end
