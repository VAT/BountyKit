//  Created by Thomas Visser on 10/10/2009.


#import "GameLayer.h"
#import "LoadableDelegate.h"
#import "GraphicObject.h"
#import "Loader.h"


@implementation GameLayer

- (id) init {
	if( self = [super init] ) {
		// prepare the loading, don't do any time consuming things here
		gameElements = [[NSArray alloc] initWithObjects:
                        [[GraphicObject alloc] init], // an array with all objects that
                        [[GraphicObject alloc] init], //  need loading
                        [[GraphicObject alloc] init],
                        [[GraphicObject alloc] init],
                        nil];


	}
	return self;
}

#pragma mark Loadable

- (void) loadWithDelegate: (id <LoadableDelegate>) delegate {
	// load the game elements, do some time consuming calculations
	loadDelegate = delegate;
	for( int i = 0; i < 100000000; i++ ) { }
	[delegate loadable:self reportingProgress: 0.2];

	for( int i = 0; i < 100000000; i++ ) { }
	[delegate loadable:self reportingProgress: 0.4];

	Loader *loader = [Loader loaderWithLoadables:gameElements asynchronous:NO];
	[loader loadWithDelegate: self];
    // We allready are in a seperate thread, the loading can be done asynchronous now.
    //  This could be implemented the other way around (making the loader in GameScene non-asynchronous
    //  and letting this one create a new thread)
}

- (BOOL) loadingUsesOpenGL {
	return YES;
}

#pragma mark LoadableDelegate
- (void) loadable: (id <Loadable>) ldble reportingProgress: (float) progrs {
	// receiving progress updates from the loader created above
	[loadDelegate loadable:self reportingProgress: 0.4+(progrs*0.6)];
}


- (void) startGame {
	// start the game here
	NSLog(@"Game started");
}

@end
