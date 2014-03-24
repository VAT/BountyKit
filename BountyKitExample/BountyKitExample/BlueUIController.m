//
//  BlueUIController.m
//  BountyKitExample
//
//  Created by denizz.tret on 14.02.14.
//  Copyright (c) 2014 pythongem. All rights reserved.
//

#import "BlueUIController.h"
#import "BlueScene.h"

@interface BlueUIController ()

@end

@implementation BlueUIController

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

    [self loadSceneWithClass:[BlueSceneLayer class]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
