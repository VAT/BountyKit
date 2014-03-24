//  Created by Thomas Visser on 10/10/2009.


#import "GameScene.h"
#import "LoadProgressLayer.h"
#import "GameLayer.h"
#import "Loader.h"


@implementation GameScene

- (id) init {

	if( self = [super init] ) {
		loadLayer = [[LoadProgressLayer alloc] init];
		[self addChild: loadLayer];
		gameLayer = [[GameLayer alloc] init];
		loadingCondition = [[NSCondition alloc] init];
	}

	return self;
}

- (void) loadAndStart {
	// should be called after the scene became the currentScene
	// starts the loading of the game and makes sure the game is
	// started when the loading is done

	Loader * gameLoader = [Loader loaderWithLoadable:gameLayer asynchronous:YES];
	[gameLoader loadWithDelegate: self]; // loading starts in a new thread,
    // the execution of this thread continues
	[loadingCondition lock];
	[loadingCondition wait]; // the execution on this thread will pause
    // untill [loadingCondition signal] is called
	[loadingCondition unlock];

	// loading is done, show and start the game
	[self removeChild:loadLayer cleanup:YES];
	[self addChild: gameLayer];
	[gameLayer startGame];
}

# pragma mark LoadableDelegate

- (void) loadable: (id <Loadable>) ldble reportingProgress: (float) progrs {
	// receiving load updates from the gameLoader created in loadAndStart
	[loadLayer displayProgress: progrs]; // you could do this in GameScene itself
	if( progrs == 1.0 ) { // the game is loaded
		[loadingCondition lock];
		[loadingCondition signal];
		[loadingCondition unlock];
		// signals the other thread (the one that called loadAndStart that the
		// gameLayer is loaded. Don't call [self addChild: gameLayer] and [gameLayer startGame]
		// here because that will cause the game to be played in the Loader thread.
	}
}


@end