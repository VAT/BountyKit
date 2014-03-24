//
//  OrangeScene.m
//  BountyKitExample
//
//  Created by denizz.tret on 14.02.14.
//  Copyright (c) 2014 pythongem. All rights reserved.
//

#import "OrangeScene.h"
#import "CCNode+UIViewController.h"

#import "BKScene.h"

@implementation OrangeSceneLayer

+ (CCScene<BKSceneControllerProtocol> *) sceneWithViewController:(UIViewController *)viewController {

    CCScene<BKSceneControllerProtocol> *scene = [BKScene sceneWithViewController:viewController];

    OrangeSceneLayer *layer = [[[self class] alloc] init];
    [scene addChild:layer];

    return scene;
}

- (id) init {
    self = [super init];
    if (self) {

        [self createScene];
    }
    return self;
}

- (void) createScene {

    CGSize windowSize = [[CCDirector sharedDirector] winSize];

    ccColor4B bgColor = ccc4(255*0.4, 255*0.2, 255*0.1, 255);
    CCLayerColor *bgl = [CCLayerColor layerWithColor:bgColor width:windowSize.width height:windowSize.height];
    [self addChild:bgl z:-100];
}

@end