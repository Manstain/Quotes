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
    
    
    grayView = [[UIView alloc]initWithFrame:CGRectMake(0, 15, 320, 40)];
    grayView.backgroundColor = [UIColor grayColor];
    grayView.alpha = 0.7;
    
    leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(15, 20, 80, 30)];
    leftButton.layer.cornerRadius = 10;
    leftButton.clipsToBounds = YES;
    [leftButton setTitle:@"Back" forState:UIControlStateNormal];
    [leftButton setBackgroundColor:[UIColor lightGrayColor]];
    [leftButton addTarget:self action:@selector(leftButtonPushed:) forControlEvents:UIControlEventTouchUpInside];
    
    titleLabal = [[UILabel alloc]initWithFrame:CGRectMake(110,20 ,200 ,30)];
    titleLabal.text = @"title";
    titleLabal.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"selectedCellBackground.jpg"]];
    titleLabal.textAlignment = UITextAlignmentCenter;
    titleLabal.layer.cornerRadius = 10;
    titleLabal.clipsToBounds = YES;

    contentView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,0 , 0) style:UITableViewStyleGrouped];
    contentView.delegate = self;
    contentView.dataSource = self;
    contentView.backgroundColor = [UIColor clearColor];
    contentView.bounces = NO;
        

    [self.view addSubview:contentView];
    [self.view addSubview:grayView];
    [self.view addSubview:leftButton];
    [self.view addSubview:titleLabal];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
   
    CGRect frame = CGRectMake(self.view.frame.origin.x, NAVBARHEIGHT, self.view.frame.size.width, self.view.frame.size.height - NAVBARHEIGHT);
    contentView.frame = frame;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"DetailCell";
    
    DetailCell *cell = (DetailCell *)[tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil)
    {
        cell = [[DetailCell alloc] init];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.title.text = cellId;
    
    return cell;

}

-(IBAction)leftButtonPushed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc 
{
    [titleLabal release];
    [grayView release];
    [contentView release];
    [content release];
    [super dealloc];
}

@end
