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
        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background1.jpeg"]];
    
    CGRect frame = CGRectMake(0, 0 , 0, 0);
    myTableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
    myTableView.backgroundColor = [UIColor clearColor];

    myTableView.delegate = self;
    myTableView.dataSource = self;
    
    finder = [[UIView alloc]init];
    finder.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:myTableView];
    [self.view addSubview:finder];    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"QuoteCell";
    
    MyCell *cell = (MyCell *)[tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil)
    {
        cell = [[MyCell alloc] init];
    }

    cell.title.text = cellId;
    
    return cell;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CGRect frame = CGRectMake(self.view.frame.origin.x, finderHeight, self.view.frame.size.width, self.view.frame.size.height - finderHeight);
    myTableView.frame = frame;
    
    frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, finderHeight);
    finder.frame = frame;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    QuotesDetailsController *details = [[QuotesDetailsController alloc]init];
    [self.navigationController pushViewController:details animated:YES];
    [details release];
}

- (void)dealloc 
{
    [myTableView release];
    [finder release];
    [super dealloc];
}

@end
