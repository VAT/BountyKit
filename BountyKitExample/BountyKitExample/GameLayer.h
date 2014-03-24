//  Created by Thomas Visser on 10/10/2009.


#import <Foundation/Foundation.h>
#import <cocos2d/cocos2d.h>

#import "Loadable.h"
#import "LoadableDelegate.h"


@interface GameLayer : CCLayer <Loadable, LoadableDelegate> {
	NSArray * gameElements;
	id        loadDelegate;
}

- (void) startGame;

@end