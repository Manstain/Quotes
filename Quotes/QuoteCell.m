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

        CGRect frame = CGRectMake(self.frame.origin.x+15,self.frame.origin.y , self.frame.size.width-30, self.frame.size.height);
        title = [[UILabel alloc]initWithFrame:frame];
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
