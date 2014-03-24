//  Created by Thomas Visser on 10/10/2009.


#import "LoadProgressLayer.h"


@implementation LoadProgressLayer

- (void) displayProgress: (float) prgs {
	// update a loading bar, but for now, we'll just NSLog the progress
	NSLog(@"Displaying progress: %f", prgs);
}

@end