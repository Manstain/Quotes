//
//  QuotesDetailsController.m
//  Quotes
//
//  Created by Pavel on 12/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "QuotesDetailsController.h"

@implementation QuotesDetailsController

- (void)loadView
{
    [super loadView];
    
    self.view.backgroundColor = [[UIColor alloc]initWithPatternImage:[UIImage imageNamed:@"Background.jpeg"]];
    
    [self favorViewCreateWithFrame:CGRectMake(-5, 300, 45, 45)];
    [self favorImageViewCreate];
    [self activeImageViewCreate];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(favorTapped)];
	[tapRecognizer setNumberOfTapsRequired:1];
	[tapRecognizer setDelegate:self];
	[favorView addGestureRecognizer:tapRecognizer];
    
  
    [self.view addSubview:favorView];
    [self.view addSubview:favorImageView];
    [self.view addSubview:activFavorImageView];
    
}


- (IBAction)favorTapped:(id)sender
{
    [activFavorImageView setHidden:NO];
}

- (void)favorImageViewCreate
{
    favorImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"favor.png"]];
    favorImageView.frame = favorView.frame;
}
- (void)activeImageViewCreate
{
    activFavorImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"activfavor.png"]];
    activFavorImageView.frame = favorView.frame;
    
    if (!self.quoteModel.favor)
    {
            [activFavorImageView setHidden:YES];
    }

}

- (void)favorViewCreateWithFrame:(CGRect)frame
{
    favorView = [[UIView alloc]initWithFrame:frame];
    favorView.backgroundColor = [UIColor darkGrayColor];
    favorView.layer.cornerRadius = 10;
    favorView.clipsToBounds = YES;
    favorView.alpha = 0.7;}


@end
