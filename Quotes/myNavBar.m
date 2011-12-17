//
//  myNavBar.m
//  Quotes
//
//  Created by Pavel on 12/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "myNavBar.h"

@implementation MyNavBar

-  (id) initWithButton:(UIButton*)button
{
    self = [super init];
    
    if (self)
    {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background1.jpeg"]];
        
        leftButton = button;
        
        CGRect frame = CGRectMake(0, 15, 320, 40);
        grayView = [[UIView alloc]initWithFrame:frame];
        grayView.backgroundColor = [UIColor lightGrayColor];
        grayView.alpha = 0.5;
        
        [self addSubview:leftButton];
        [self addSubview:grayView];
    }
    
    return [self autorelease];
}

- (void)dealloc 
{
    [grayView release];
    [super dealloc];
}

@end
