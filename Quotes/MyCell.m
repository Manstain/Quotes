//
//  MyCell.m
//  Quotes
//
//  Created by Pavel on 12/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

@synthesize title;

- (id)init 
{
    self = [super init];
    if (self) 
    {
        CGRect frame = CGRectMake(20, 5, 280, 15);
        title = [[UILabel alloc]initWithFrame:frame];
        title.textAlignment = UITextAlignmentCenter;
        [self addSubview:title];
        //self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (void)dealloc
{
    [title release];
    [super dealloc];
}


@end
