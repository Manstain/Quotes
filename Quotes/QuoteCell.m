//
//  MyCell.m
//  Quotes
//
//  Created by Pavel on 12/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "QuoteCell.h"

@implementation QuoteCell

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

        CGRect frame = CGRectMake(0,0, self.frame.size.width, self.frame.size.height);
        title = [[UILabel alloc]initWithFrame:frame];
        title.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        title.textAlignment = UITextAlignmentCenter;
        title.numberOfLines = 0;

        title.backgroundColor = [UIColor clearColor];
        [self addSubview:title];
    }
    return self;
}

- (void) setCellFrame:(CGRect)frame
{
    self.frame = frame;
    title.frame = CGRectMake(frame.origin.x+10, frame.origin.y+10, frame.size.width - 20, frame.size.height - 20);
}

- (void)dealloc
{
    [title release];
    [super dealloc];
}


@end
