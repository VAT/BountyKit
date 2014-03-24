//
//  BKSceneViewController.m
//  BountyKit
//
//  Created by denizz.tret on 14.02.14.
//  Copyright (c) 2014 pythongem. All rights reserved.
//

#import "BKSceneViewController.h"
#import "BKCCNavigationController.h"

#import <cocos2d/cocos2d.h>

#import "BKScene.h"


@interface BKSceneViewController ()

@property (nonatomic, strong) Class<BKSceneControllerProtocol> sceneClass;

@end

@implementation BKSceneViewController

- (void) viewDidLoad {

    [super viewDidLoad];

    self.view.backgroundColor = [UIColor clearColor];
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
}

- (void) viewDidDisappear:(BOOL)animated {

    [super viewDidDisappear:animated];

    CCDirector *director = [CCDirector sharedDirector];
    BKCCNavigationController *directorDelegate = (BKCCNavigationController *)director.delegate;

    // inform the cocos nav controller, it may want to pop the running scene to reduce memory usage
	[directorDelegate cocosViewDidDisappear];
}


- (void) loadSceneWithClass:(Class<BKSceneControllerProtocol>)sceneClass {

    self.sceneClass = sceneClass;
    self.scene = [sceneClass sceneWithViewController:self];

    [self loadSceneLazy];
}

- (void) loadSceneLazy {

    if (!self.scene && !self.sceneClass) {
        self.sceneClass = [BKScene class];
        self.scene = [self.sceneClass sceneWithViewController:self];
    }

    CCDirector *director = [CCDirector sharedDirector];
    if (director.runningScene) {
        [director replaceScene:self.scene];
    }
    else {
        [director runWithScene:self.scene];
    }
}

@end
