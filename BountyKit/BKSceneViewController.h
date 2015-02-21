//
//  BKSceneViewController.h
//  BountyKit
//
//  Created by Denis Tretyakov on 14.02.14.
//  Copyright (c) 2014 pythongem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BKSceneControllerProtocol.h"

@class CCScene;

@interface BKSceneViewController : UIViewController

@property (nonatomic, weak) CCScene<BKSceneControllerProtocol> *scene;

- (void) loadSceneWithClass:(Class<BKSceneControllerProtocol>)sceneClass;

@end
