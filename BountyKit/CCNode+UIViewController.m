//
//  BKScene.m
//  BountyKit
//
//  Created by Denis Tretyakov on 12.02.14.
//  Copyright (c) 2014 pythongem. All rights reserved.
//

#import "CCNode+UIViewController.h"
#import "BKScene.h"

@implementation CCNode(UIViewController)

- (UIViewController*) viewController {

    return self.scene.viewController;
}

- (BKScene*) scene {

    CCNode *parent = self;
    while (parent && ![parent isKindOfClass: [BKScene class]]) {
        parent = parent.parent;
    }
 
    BKScene *scene = (BKScene*)parent;
    
    if (scene) {
        NSAssert([scene isKindOfClass: [BKScene class]], @"Should have found a BKScene object");
    }
    
    return scene;
}

@end
