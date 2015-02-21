//
//  BKSceneControllerProtocol.h
//  BountyKit
//
//  Created by Denis Tretyakov on 28.02.14.
//  Copyright (c) 2014 pythongem. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CCScene;

@protocol BKSceneControllerProtocol <NSObject>

+ (CCScene<BKSceneControllerProtocol> *) sceneWithViewController:(UIViewController*)viewController;

@end