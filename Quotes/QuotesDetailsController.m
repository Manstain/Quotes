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
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hideActiveImageView) name:@"QuoteRemovedFromFavorities" object:nil];
    
    self.view.backgroundColor = [[UIColor alloc]initWithPatternImage:[UIImage imageNamed:@"Background.jpeg"]];
    
    [self favorViewCreateWithFrame:CGRectMake(-5, 300, 45, 45)];
    [self favorImageViewCreate];
    [self activeImageViewCreate];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(favorTapped:)];
	[tapRecognizer setNumberOfTapsRequired:1];
	[tapRecognizer setDelegate:self];
	[favorView addGestureRecognizer:tapRecognizer];
    
    [self.view addSubview:favorView];
    [self.view addSubview:favorImageView];
    [self.view addSubview:activFavorImageView];
    
}

- (void)hideActiveImageView
{
    [activFavorImageView setHidden:YES];
}

- (IBAction)favorTapped:(id)sender
{
    [activFavorImageView setHidden:NO];
    self.quoteModel.favor = [NSNumber numberWithBool:YES];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Quote" inManagedObjectContext:[CoreDataManager sharedInstance].managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"quoteID = %@", self.quoteModel.quoteID];
    [request setPredicate:predicate];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"quoteID" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptors];
    [sortDescriptors release]; sortDescriptors = nil;
    [sortDescriptor release]; sortDescriptor = nil;
    
    NSError *error;
    Quote *quote = [[[CoreDataManager sharedInstance].managedObjectContext executeFetchRequest:request error:&error] objectAtIndex:0];
    [request release]; request = nil;
    
    quote.favor = [NSNumber numberWithBool:YES];
    [[CoreDataManager sharedInstance].managedObjectContext save:&error];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"QuoteAddaedToFavorites" object:nil];

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
    

    if (![self.quoteModel.favor boolValue])
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
