//  Created by Thomas Visser on 10/10/2009.


#import <Foundation/Foundation.h>
#import <cocos2d/cocos2d.h>

#import "LoadableDelegate.h"


@class LoadProgressLayer, GameLayer;

@interface GameScene : CCScene <LoadableDelegate> {
	LoadProgressLayer *loadLayer; // a layer displaying the progress
	GameLayer *gameLayer; // the layer that has to be loaded
	NSCondition *loadingCondition;
}

- (void) loadAndStart;

@end