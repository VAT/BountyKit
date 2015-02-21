# BountyKit Project

## Pod source

`source 'https://github.com/denizztret/BountyKit.git'`


## Create Project

- Create new project: "Empty Application"
- Initialize Cocoapods (empty)
- Open the created Workspace
- Edit Podfile. 

Add code:

    platform :ios, "6.0"
    pod 'BountyKit', :git => 'https://github.com/denizztret/BountyKit.git'
    pod 'cocos2d', :podspec => 'cocos2d.podspec'


`$ pod install`


## Setup Project

### Storyboard

- Create new Storyboard
- Add new `Navigation Controller`
- Remove `Table View Controller` from it
- Add new `View Controller`
- Set it as `Root View Controller`
- For `Navigation Controller` set class `BKCCNavigationController`
- Setup Simulated Metrics
- For `View Controller` set class `BKCCViewController`

### AppDelegate

- Comment method `-(BOOL)application:didFinishLaunchingWithOptions:`
- Rename `AppDelegate.m` extension to `.mm`

### Project

- Select `General` at the top of the project editor
	- Select storyboard at the `Main Interface`
	- Select `Device Orientation`
	- Select checkbox `Hide during application launch`
- Select `Info` at the top of the project editor (and Info.plist)
	- Add row `View controller-based status bar appearance`, and set value to `NO`
	
### Container

- Select `Container View` at the Object Library
- Insert `Container View` to view of the `View Controller`
- For `View Controller` of the `Container View` set class `BKcontainerController`

### Container Scenes

- For setup first scene add to storybord new `View Controller`
- Connect `Container Controller` and `View Controller` with segue `container`
- Set segue Identifier to `"segueFirstScene"`
- Create class `FirstScene`
- Create class `FirstViewController`
- For `View Controller` set class `FirstViewController`

#### FirstScene.h

    #import <BountyKit/BountyKit.h>
    @interface FirstScene : CCLayer <BKSceneControllerProtocol>

#### FirstScene.m

    - (CCScene<BKSceneControllerProtocol> *) sceneWithViewController:(UIViewController *)viewController {
    
	    CCScene<BKSceneControllerProtocol> *scene = [BKScene sceneWithViewController:viewController];
	    
	    FirstScene *layer = [[[self class] alloc] init];
	    [scene addChild:layer];
	    
	    return scene;
    }
    
    - (id) init {
	    self = [super init];
	    if (self) {
	    
	        [self createScene];
	    }
	    return self;
    }
    
    - (void) createScene {
    
	    CGSize windowSize = [[CCDirector sharedDirector] winSize];
	    
	    ccColor4B bgColor = ccc4(255*0.2, 255*0.4, 255*0.6, 255);
	    CCLayerColor *bgl = [CCLayerColor layerWithColor:bgColor width:windowSize.width height:windowSize.height];
	    [self addChild:bgl z:-100];
    }

#### FirstViewController.h

    #import <BountyKit/BountyKit.h>
    @interface FirstViewController : BKSceneViewController

#### FirstViewController.m

    #import "FirstScene.h"
    
    - (void) viewDidLoad {
	    [super viewDidLoad];
	    [self loadSceneWithClass:[FirstScene class]];
    }


