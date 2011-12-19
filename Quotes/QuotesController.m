//
//  QuotesController.m
//  Quotes
//
//  Created by Pavel on 12/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "QuotesController.h"

@implementation QuotesController

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
    
    CGRect frame = CGRectMake(0, 0 , 0, 0);
    quotesTableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
    quotesTableView.backgroundColor = [UIColor clearColor];
    quotesTableView.bounces = NO;

    quotesTableView.delegate = self;
    quotesTableView.dataSource = self;
    
    finder = [[UIView alloc]init];
    finder.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:quotesTableView];
    [self.view addSubview:finder];    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 15;
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

    cell.title.text = cellId;
    cell.selectedBackgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"selectedCellBackground.jpg"]];
    cell.selectedBackgroundView.frame = cell.bounds;
    cell.selectedBackgroundView.layer.cornerRadius = 10;
    cell.selectedBackgroundView.clipsToBounds = YES;
    
    return cell;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CGRect frame = CGRectMake(self.view.frame.origin.x, finderHeight, self.view.frame.size.width, self.view.frame.size.height - finderHeight);
    quotesTableView.frame = frame;
    
    frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, finderHeight);
    finder.frame = frame;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuotesDetailsController *details = [[QuotesDetailsController alloc]init];
    [self.navigationController pushViewController:details animated:YES];
    [details release];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



- (void)dealloc 
{
    [quotesTableView release];
    [finder release];
    [super dealloc];
}

@end
