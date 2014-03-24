//  Created by Thomas Visser on 10/10/2009.


#import "Loadable.h"


@protocol LoadableDelegate

- (void) loadable: (id <Loadable>) ldble reportingProgress: (float) progrs;

@end
