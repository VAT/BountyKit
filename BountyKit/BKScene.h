//
//  BKScene.h
//  BountyKit
//
//  Created by denizz.tret on 12.02.14.
//  Copyright (c) 2014 pythongem. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <cocos2d/cocos2d.h>

#import "CCNode+UIViewController.h"
#import "BKSceneControllerProtocol.h"


@interface BKScene : CCScene <BKSceneControllerProtocol>

@property (nonatomic, weak) UIViewController *viewController;

@end