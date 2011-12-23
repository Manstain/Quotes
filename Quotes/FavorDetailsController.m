//
//  FavorDeailsController.m
//  Quotes
//
//  Created by Pavel on 12/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "FavorDetailsController.h"

@implementation FavorDetailsController

@synthesize quoteModel;

- (void)loadView
{
    [super loadView];
    
    self.view.backgroundColor = [[UIColor alloc]initWithPatternImage:[UIImage imageNamed:@"Background.jpeg"]];
    
    [self leftButtonCreateWithFrame:CGRectMake(15, 20, 80, 30)];
    [self titleLabelCreateWithFrame:CGRectMake(110,20 ,200 ,30)];
    [self contentViewCreate];
    [self grayViewCreateWithFrame:CGRectMake(0, 15, 320, 40)];
    
    titleLabal.text = quoteModel.title;
    content = quoteModel.text;
    
    
    [self.view addSubview:contentView];
    [self.view addSubview:grayView];
    [self.view addSubview:leftButton];
    [self.view addSubview:titleLabal];
    
}



- (void)grayViewCreateWithFrame:(CGRect)frame
{
    grayView = [[UIView alloc]initWithFrame:frame];
    grayView.backgroundColor = [UIColor grayColor];
    grayView.alpha = 0.7;}



- (void)contentViewCreate
{
    contentView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,0 , 0) style:UITableViewStyleGrouped];
    contentView.delegate = self;
    contentView.dataSource = self;
    contentView.backgroundColor = [UIColor clearColor];
    contentView.bounces = NO;
}

- (void)titleLabelCreateWithFrame:(CGRect)frame;
{
    titleLabal = [[UILabel alloc]initWithFrame:frame];
    titleLabal.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"selectedCellBackground.jpg"]];
    titleLabal.textAlignment = UITextAlignmentCenter;
    titleLabal.layer.cornerRadius = 10;
    titleLabal.clipsToBounds = YES;
}

- (void)leftButtonCreateWithFrame:(CGRect)frame
{
    leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:frame];
    leftButton.layer.cornerRadius = 10;
    leftButton.clipsToBounds = YES;
    [leftButton setTitle:@"Back" forState:UIControlStateNormal];
    [leftButton setBackgroundColor:[UIColor lightGrayColor]];
    [leftButton addTarget:self action:@selector(leftButtonPushed:) forControlEvents:UIControlEventTouchUpInside];}

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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuoteCell *cell = [[QuoteCell alloc]init];
    
    CGSize constrainedSize;
    constrainedSize.width = 320;
    constrainedSize.height = MAXFLOAT;
    
    return [content sizeWithFont:cell.title.font constrainedToSize:constrainedSize].height+20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"DetailCell";
    
    QuoteCell *cell = (QuoteCell *)[tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil)
    {
        cell = [[QuoteCell alloc] init];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    cell.title.numberOfLines = 0;
    cell.title.text = content;
    
    CGSize constrainedSize;
    constrainedSize.width = 320;
    constrainedSize.height = MAXFLOAT;
    
    CGFloat height = [content sizeWithFont:cell.title.font constrainedToSize:constrainedSize].height;
    CGRect frame = CGRectMake(0, 0, constrainedSize.width, height+20);
    [cell setCellFrame:frame];
    
    return cell;
    
}

-(IBAction)leftButtonPushed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)dealloc 
{
    [quoteModel release];
    [titleLabal release];
    [grayView release];
    [contentView release];
    [content release];
    [super dealloc];
}



@end
