//
//  CCViewController.m
//  BountyKit
//
//  Created by denizz.tret on 12.02.14.
//  Copyright (c) 2014 pythongem. All rights reserved.
//

#import "BKCCViewController.h"
#import "BKCCNavigationController.h"

#import <cocos2d/cocos2d.h>

@interface BKCCViewController ()

@end

@implementation BKCCViewController

- (void) viewDidLoad {
    [super viewDidLoad];

    [self setupDirector];
}

- (void) viewDidDisappear:(BOOL)animated {

    [super viewDidDisappear:animated];

    // inform the cocos nav controller, it may want to pop the running scene to reduce memory usage
	[[self directorDelegate] cocosViewDidDisappear];
}


#pragma mark - Create Director

- (BKCCNavigationController *) directorDelegate {

    CCDirector *director = [CCDirector sharedDirector];

    if (director.delegate) {
        return (BKCCNavigationController *)director.delegate;
    }

    BKCCNavigationController *navigationController = (BKCCNavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;

    NSAssert1([navigationController isKindOfClass:[BKCCNavigationController class]],
              @"storyboards navigation controller (%@) is not of class BKNavigationController", navigationController);

    return navigationController;
}

- (void) directorGLViewSetup {
    // CCGLView creation
    // viewWithFrame: size of the OpenGL view. For full screen use [_window bounds]
    //  - Possible values: any CGRect
    // pixelFormat: Format of the render buffer. Use RGBA8 for better color precision (eg: gradients). But it takes more memory and it is slower
    //	- Possible values: kEAGLColorFormatRGBA8, kEAGLColorFormatRGB565
    // depthFormat: Use stencil if you plan to use CCClippingNode. Use Depth if you plan to use 3D effects, like CCCamera or CCNode#vertexZ
    //  - Possible values: 0, GL_DEPTH_COMPONENT24_OES, GL_DEPTH24_STENCIL8_OES
    // sharegroup: OpenGL sharegroup. Useful if you want to share the same OpenGL context between different threads
    //  - Possible values: nil, or any valid EAGLSharegroup group
    // multiSampling: Whether or not to enable multisampling
    //  - Possible values: YES, NO
    // numberOfSamples: Only valid if multisampling is enabled
    //  - Possible values: 0 to glGetIntegerv(GL_MAX_SAMPLES_APPLE)
    CCGLView *glView = [CCGLView viewWithFrame:[[[UIApplication sharedApplication] keyWindow] bounds]
                                   pixelFormat:kEAGLColorFormatRGB565
                                   depthFormat:0
                            preserveBackbuffer:NO
                                    sharegroup:[[EAGLSharegroup alloc] init]
                                 multiSampling:NO
                               numberOfSamples:0];

    glView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [[CCDirector sharedDirector] setView:glView];
}
- (void) directorSetup {

    CCDirector *director = [CCDirector sharedDirector];

    [director setDisplayStats:YES];
    [director setAnimationInterval:1.0/60];
    [director setProjection:kCCDirectorProjection2D];
    [director enableRetinaDisplay:YES];

    // Default texture format for PNG/BMP/TIFF/JPEG/GIF images
    // It can be RGBA8888, RGBA4444, RGB5_A1, RGB565
    // You can change anytime.
    [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];

    // If the 1st suffix is not found and if fallback is enabled then fallback suffixes are going to searched. If none is found, it will try with the name without suffix.
    // On iPad HD  : "-ipadhd", "-ipad",  "-hd"
    // On iPad     : "-ipad", "-hd"
    // On iPhone HD: "-hd"
    CCFileUtils *sharedFileUtils = [CCFileUtils sharedFileUtils];
    [sharedFileUtils setEnableFallbackSuffixes:NO];				// Default: NO. No fallback suffixes are going to be used
    [sharedFileUtils setiPhoneRetinaDisplaySuffix:@"-hd"];		// Default on iPhone RetinaDisplay is "-hd"
    [sharedFileUtils setiPadSuffix:@"-ipad"];					// Default on iPad is "ipad"
    [sharedFileUtils setiPadRetinaDisplaySuffix:@"-ipadhd"];	// Default on iPad RetinaDisplay is "-ipadhd"

    // Assume that PVR images have premultiplied alpha
    [CCTexture2D PVRImagesHavePremultipliedAlpha:YES];
}
- (void) setupDirector {

    CCDirector *director = [CCDirector sharedDirector];

    [director setDelegate:[self directorDelegate]];

    if(![director isViewLoaded]) {

        [self directorGLViewSetup];

        [self directorSetup];
    }

    // Add the director as a child view controller.
    [self addChildViewController:director];

    // Add the director's OpenGL view, and send it to the back of the view hierarchy so we can place UIKit elements on top of it.
    [self.view addSubview:director.view];
    [self.view sendSubviewToBack:director.view];

    // Ensure we fulfill all of our view controller containment requirements.
    [director didMoveToParentViewController:self];

    // you want multi-touch, right?
	self.view.multipleTouchEnabled = YES;

    // if there's already a running scene, we're re-visiting the existing scene and user may want to replace the scene
	if (director.runningScene) {
		[[self directorDelegate] cocosViewDidLoadAgain];
	}
}


@end
