//
//  QuotesController.m
//  Quotes
//
//  Created by Pavel on 12/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TableController.h"

@implementation TableController

- (id)init
{
    self = [super init];
    
    if (self) 
    {
        self.tabBarItem =  [[UITabBarItem alloc] initWithTitle:@"Quotes" image:[UIImage imageNamed:@"Quotes.png"] tag:1]; 
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background.jpeg"]];
    
    quotesData = [[NSMutableArray alloc]init];
    
    CGRect frame = CGRectMake(0, 0 , 0, 0);
    
    quotesTableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
    quotesTableView.backgroundColor = [UIColor clearColor];
    quotesTableView.bounces = NO;

    quotesTableView.delegate = self;
    quotesTableView.dataSource = self;
    
    [self grayViewCreateWithFrame:frame];
    
    [self.view addSubview:grayView];
    [self.view addSubview:quotesTableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [quotesData count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"QuoteCell";
    
    QuoteCell *cell = (QuoteCell *)[tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil)
    {
        cell = [[QuoteCell alloc] init];
    }

    Quote *quote = [quotesData objectAtIndex:indexPath.section];
    
    cell.title.text = quote.title;
    cell.selectedBackgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"selectedCellBackground.jpg"]];
    cell.selectedBackgroundView.frame = cell.bounds;
    cell.selectedBackgroundView.layer.cornerRadius = 10;
    cell.selectedBackgroundView.clipsToBounds = YES;
    
    return cell;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    quotesTableView.frame = CGRectMake(self.view.frame.origin.x, HEADERHEIGHT, self.view.frame.size.width, self.view.frame.size.height - HEADERHEIGHT);
    grayView.frame = CGRectMake(self.view.frame.origin.x, 5, self.view.frame.size.width, 40);
}



- (void)grayViewCreateWithFrame:(CGRect)frame
{
    grayView = [[UIView alloc]initWithFrame:frame];
    grayView.backgroundColor = [UIColor grayColor];
    grayView.alpha = 0.7;}



- (void)dealloc 
{
    [grayView release];
    [quotesTableView release];
    [quotesData release];
    [super dealloc];
}

@end
