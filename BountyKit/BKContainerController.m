//
//  BKContainerController.m
//  BountyKit
//
//  Created by denizz.tret on 14.02.14.
//  Copyright (c) 2014 pythongem. All rights reserved.
//

#import "BKContainerController.h"
#import "BKContainerSegue.h"

#import <cocos2d/cocos2d.h>

@interface BKContainerController ()

@property (nonatomic, assign) BOOL transitionInProgress;

@end


@implementation BKContainerController

- (void) viewDidAppear:(BOOL)animated {

    [self performSegueWithIdentifier:@"segueFirstScene" sender:self];
}

- (void) swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController {

    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];

    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//    toViewController.view.hidden = YES;

    [self transitionFromViewController:fromViewController
                      toViewController:toViewController
                              duration:0.0f
                               options:UIViewAnimationOptionTransitionNone
                            animations:nil
                            completion:^(BOOL finished) {
                                [fromViewController removeFromParentViewController];
                                [toViewController didMoveToParentViewController:self];
                            }];
}

- (void) swapViewControllersTo:(UIViewController *)toViewController {

    [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:toViewController];
}

- (void) swapViewControllersToFirst:(UIViewController *)toViewController {

    [self addChildViewController:toViewController];
    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    toViewController.view.frame = frame;
//    toViewController.view.hidden = YES;
    [self.view addSubview:toViewController.view];
    [toViewController didMoveToParentViewController:self];
}


#pragma mark - CCTouchDelegate

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    [super touchesBegan:touches withEvent:event];
    [[CCDirector sharedDirector].touchDispatcher touchesBegan:touches withEvent:event];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {

    [super touchesMoved:touches withEvent:event];
    [[CCDirector sharedDirector].touchDispatcher touchesMoved:touches withEvent:event];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

    [super touchesEnded:touches withEvent:event];
    [[CCDirector sharedDirector].touchDispatcher touchesEnded:touches withEvent:event];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {

    [super touchesCancelled:touches withEvent:event];
    [[CCDirector sharedDirector].touchDispatcher touchesCancelled:touches withEvent:event];
}

@end
