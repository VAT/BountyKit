//
//  Loader.h
//  MatchUp
//
//  Created by Thomas Visser on 12/06/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Loadable.h"
#import "LoadableDelegate.h"
#import "cocos2d.h"

@interface Loader : NSOperation <Loadable, LoadableDelegate> {
	NSArray *						loadables;
	NSObject <LoadableDelegate> *	delegate;
	BOOL							asynchronous;
	float *							progresses;
}
- (id) initWithLoadables: (NSArray *) ploadables asynchronous: (BOOL) asyn;
+ (id) loaderWithLoadables: (NSArray *) loadables asynchronous: (BOOL) asyn;

- (id) initWithLoadable: (NSObject <Loadable> *) loadable asynchronous: (BOOL) asyn;
+ (id) loaderWithLoadable: (NSObject <Loadable> *) loadable asynchronous: (BOOL) asyn;

@end