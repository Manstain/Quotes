//
//  QuotesController.m
//  Quotes
//
//  Created by Pavel on 12/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "QuotesController.h"

@implementation QuotesController

-(void)loadView
{
    [super loadView];
    
    finder = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    finder.delegate = self;
    [self.view addSubview:finder];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    finder.frame = CGRectMake(0, 45, 320, 45);
}

@end
