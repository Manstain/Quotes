//
//  QuotesController.m
//  Quotes
//
//  Created by Pavel on 12/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "QuotesController.h"

@implementation QuotesController

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [[UIColor alloc]initWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
    self.navigationController.navigationBarHidden = YES;
    
    CGRect frame = CGRectMake(0, 10, 320, 50);
    myNavBar = [[UIView alloc]initWithFrame:frame];
    self.tableView.tableHeaderView = myNavBar;
    [self.view addSubview:self.tableView.tableHeaderView];
    
        
    
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    QuotesDetailsController *details = [[QuotesDetailsController alloc]init];
    [self.navigationController pushViewController:details animated:YES];
    [details release];
}

- (void)dealloc 
{
    [myNavBar release];
    [super dealloc];
}

@end
