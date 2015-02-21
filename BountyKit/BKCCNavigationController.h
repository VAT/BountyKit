//
//  BKCCNavigationController.h
//  BountyKit
//
//  Created by Denis Tretyakov on 12.02.14.
//  Copyright (c) 2014 pythongem. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <cocos2d/cocos2d.h>

@interface BKCCNavigationController : UINavigationController <CCDirectorDelegate>

-(void) cocosViewDidLoad;
-(void) cocosViewDidLoadAgain;
-(void) cocosViewDidDisappear;

-(void) applicationWillResignActive:(NSNotification *)notification;
-(void) applicationDidBecomeActive:(NSNotification *)notification;
-(void) applicationDidEnterBackground:(NSNotification *)notification;
-(void) applicationWillEnterForeground:(NSNotification *)notification;
-(void) applicationSignificantTimeChange:(NSNotification *)notification;
-(void) applicationWillTerminate:(NSNotification *)notification;

@end
