//
//  MyCell.m
//  Quotes
//
//  Created by Pavel on 12/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MyCell.h"
#import "QuartzCore/QuartzCore.h"

@implementation MyCell

@synthesize title;

- (id)init 
{
    self = [super init];
    if (self) 
    {
        self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cellBackGround.jpeg"]];
        self.backgroundView.frame = self.bounds;
        self.backgroundView.layer.cornerRadius = 10;
        self.backgroundView.clipsToBounds = YES;

        //CGRect frame = self.frame;
        title = [[UILabel alloc]initWithFrame:self.backgroundView.frame];
        title.textAlignment = UITextAlignmentCenter;
        
        title.backgroundColor = [UIColor clearColor];
        [self addSubview:title];
    }
    return self;
}

- (void)dealloc
{
    [title release];
    [super dealloc];
}


@end
