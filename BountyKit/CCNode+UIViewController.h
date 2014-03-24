//
//  BKScene.h
//  BountyKit
//
//  Created by denizz.tret on 12.02.14.
//  Copyright (c) 2014 pythongem. All rights reserved.
//

#import <cocos2d/CCNode.h>

@class BKScene;

@interface CCNode(UIViewController)

// goes back up its hierarchy until it finds a BBScene node and asks for its viewController property
@property (nonatomic, readonly) UIViewController *viewController;
@property (nonatomic, readonly) BKScene *scene;

@end
