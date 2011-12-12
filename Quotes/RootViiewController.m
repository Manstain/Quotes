//
//  RootViiewController.m
//  Quotes
//
//  Created by Pavel on 12/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViiewController.h"

@implementation RootViiewController

- (void)loadView
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    TabBarController *tabCntrl = [[[TabBarController alloc]init]autorelease];
    [self.view addSubview:tabCntrl.view];
}

@end
