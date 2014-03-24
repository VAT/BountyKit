//
//  BKCCNavigationController.m
//  BountyKit
//
//  Created by denizz.tret on 12.02.14.
//  Copyright (c) 2014 pythongem. All rights reserved.
//

#import "BKCCNavigationController.h"

@interface BKCCNavigationController () {

    BOOL _isCocosViewActive;
}

@end

@implementation BKCCNavigationController

- (void) viewDidLoad {

    [super viewDidLoad];

    [self registerApplicationDelegateNotifications];
}

- (void) didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];

    [[CCDirector sharedDirector] purgeCachedData];
}


#pragma mark -

- (void) cocosViewDidLoad {
	_isCocosViewActive = YES;
}
- (void) cocosViewDidLoadAgain {
	_isCocosViewActive = YES;
}
- (void) cocosViewDidDisappear {
	_isCocosViewActive = NO;
}


#pragma mark - Notification handlers

- (void) registerApplicationDelegateNotifications {
	// Capture certain UIApplicationDelegate messages to move the AppDelegate code here
	// Credit to Jerod Putman (Tiny Tim's) CCViewController, available here:
	// http://www.tinytimgames.com/2012/02/07/cocos2d-and-storyboards/
	[[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillResignActive:)
                                                 name:UIApplicationWillResignActiveNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidBecomeActive:)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidEnterBackground:)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillEnterForeground:)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillTerminate:)
                                                 name:UIApplicationWillTerminateNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationSignificantTimeChange:)
                                                 name:UIApplicationSignificantTimeChangeNotification
                                               object:nil];
}
- (void) unregisterApplicationDelegateNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillResignActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillTerminateNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationSignificantTimeChangeNotification object:nil];
}

- (void) applicationWillResignActive:(NSNotification *)notification {
    [[CCDirector sharedDirector] pause];
}
- (void) applicationDidBecomeActive:(NSNotification *)notification {
    if (_isCocosViewActive) {
        [[CCDirector sharedDirector] resume];
    }
}
- (void) applicationDidEnterBackground:(NSNotification *)notification {
    if (_isCocosViewActive) {
        [[CCDirector sharedDirector] stopAnimation];
    }
}
- (void) applicationWillEnterForeground:(NSNotification *)notification {
    if (_isCocosViewActive) {
        [[CCDirector sharedDirector] startAnimation];
    }
}
- (void) applicationWillTerminate:(NSNotification *)notification {
    if (_isCocosViewActive) {
        [self unregisterApplicationDelegateNotifications];
        [[CCDirector sharedDirector] end];
    }
}
- (void) applicationSignificantTimeChange:(NSNotification *)notification {
    if (_isCocosViewActive) {
        [[CCDirector sharedDirector] setNextDeltaTimeZero:YES];
    }
}


#pragma mark - Implementation CCDirectorDelegate

- (void) directorDidReshapeProjection:(CCDirector*)director {

	if ([CCDirector sharedDirector].runningScene == nil) {
        [self cocosViewDidLoad];
	}
}


@end
