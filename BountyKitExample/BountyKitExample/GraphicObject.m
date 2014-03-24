//  Created by Thomas Visser on 10/10/2009.


#import "GraphicObject.h"
#import "LoadableDelegate.h"


@implementation GraphicObject

- (void) loadWithDelegate: (id <LoadableDelegate>) delegate {
	// called by the Loader created in GameLayer
	for( int i = 0; i < 100000000; i++ ) { }
	// instead of this useless calculation, you would load sprites etc. here

	[delegate loadable:self reportingProgress:1.0];
}

- (BOOL) loadingUsesOpenGL {
	return YES;
}

@end