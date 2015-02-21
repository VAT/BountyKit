//
//  BKScene.m
//  BountyKit
//
//  Created by Denis Tretyakov on 12.02.14.
//  Copyright (c) 2014 pythongem. All rights reserved.
//

#import "BKScene.h"


@implementation BKScene

+ (BKScene *) sceneWithViewController:(UIViewController *)viewController {

    BKScene *scene = [self node];
    scene.viewController = viewController;

    return scene;
}

- (void) onEnter {

    [super onEnter];

    self.viewController.view.hidden = YES;
}

- (void) onEnterTransitionDidFinish {

    [super onEnterTransitionDidFinish];

    self.viewController.view.hidden = NO;
}

@end
