//  Created by Thomas Visser on 10/10/2009.

@protocol LoadableDelegate;

@protocol Loadable

- (void) loadWithDelegate: (id <LoadableDelegate>) delegate;
- (BOOL) loadingUsesOpenGL;

@end