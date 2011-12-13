//
//  RootViiewController.m
//  Quotes
//
//  Created by Pavel on 12/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

- (void)loadView
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    tabCntrl = [[TabBarController alloc]init];
    [self.view addSubview:tabCntrl.view];
}

- (void) dealloc
{
    [tabCntrl release];
    [super dealloc];
}

@end
