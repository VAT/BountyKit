//
//  OrangeUIController.m
//  BountyKitExample
//
//  Created by Denis Tretyakov on 14.02.14.
//  Copyright (c) 2014 pythongem. All rights reserved.
//

#import "OrangeUIController.h"
#import "OrangeScene.h"

@interface OrangeUIController ()

@end

@implementation OrangeUIController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    [self loadSceneWithClass:[OrangeSceneLayer class]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
