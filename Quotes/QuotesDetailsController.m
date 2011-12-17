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
    
    self.view.backgroundColor = [[UIColor alloc]initWithPatternImage:[UIImage imageNamed:@"background1.jpeg"]];
    
    myNavbar = [[MyNavBar alloc]initWithButton:nil];
    
    contentView = [[UITableView alloc]init];
    contentView.delegate = self;
    contentView.dataSource = self;
        
    [self.view addSubview:myNavbar];
    [self.view addSubview:contentView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CGRect frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.x, self.view.frame.size.width, NAVBARHEIGHT);
    myNavbar.frame = frame;
    
    frame = CGRectMake(self.view.frame.origin.x, NAVBARHEIGHT, self.view.frame.size.width, self.view.frame.size.height - NAVBARHEIGHT);
    contentView.frame = frame;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
