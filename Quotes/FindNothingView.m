//
//  FindNothingView.m
//  Quotes
//
//  Created by Pavel on 12/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "FindNothingView.h"

@implementation FindNothingView



- (id)init
{
    self = [super init];
    
    if (self)
    {
        
        self.frame = CGRectMake(0, 0, 200, 150);
        self.center = CGPointMake(160, 200);
        self.layer.cornerRadius = 10;
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor darkGrayColor];
        self.alpha = 0.7;
        
        [self findNothingTitleCreate];
        [self findNothingButtonCreate];
        
    }
    return self;
}

- (void)findNothingTitleCreate
{
        findNothingTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
        findNothingTitle.center = CGPointMake(100,50);
        findNothingTitle.text = @"Nothing has been finded";
        findNothingTitle.backgroundColor = [UIColor clearColor];
        findNothingTitle.textColor = [UIColor orangeColor];
        findNothingTitle.textAlignment = UITextAlignmentCenter;
        [self addSubview:findNothingTitle];

}

- (void)backButtonPushed
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"NothinHasBeenFinded" object:nil];
}

- (void)findNothingButtonCreate
{
        findNothingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [findNothingButton setFrame:CGRectMake(0, 0, 100, 30)];
        findNothingButton.center = CGPointMake(100, 100);
        findNothingButton.layer.cornerRadius = 10;
        findNothingButton.clipsToBounds = YES;
        [findNothingButton setTitle:@"Back" forState:UIControlStateNormal];
        [findNothingButton setBackgroundColor:[UIColor lightGrayColor]];
        [findNothingButton addTarget:self action:@selector(backButtonPushed) forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:findNothingButton];
}




- (void)dealloc
{
    [findNothingButton release];
    [findNothingTitle release];
    [super dealloc];
}

@end
