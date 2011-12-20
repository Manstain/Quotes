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
    
    [self leftButtonCreateWithFrame:CGRectMake(15, 20, 80, 30)];
    [self titleLabelCreateWithFrame:CGRectMake(110,20 ,200 ,30)];
    [self contentViewCreate];
    [self favorViewCreateWithFrame:CGRectMake(-5, 300, 45, 45)];
    [self grayViewCreateWithFrame:CGRectMake(0, 15, 320, 40)];
    [self favorImageViewCrete];
    [self activeImageViewCreate];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(favorTapped)];
	[tapRecognizer setNumberOfTapsRequired:1];
	[tapRecognizer setDelegate:self];
	[favorView addGestureRecognizer:tapRecognizer];
    
    [self.view addSubview:contentView];
    [self.view addSubview:grayView];
    [self.view addSubview:leftButton];
    [self.view addSubview:titleLabal];
    [self.view addSubview:favorView];
    [self.view addSubview:favorImageView];
    [self.view addSubview:activFavorImageView];
    
}


- (void)favorTapped
{
    [activFavorImageView setHidden:NO];
}

- (void)favorImageViewCrete
{
    favorImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"favor.png"]];
    favorImageView.frame = favorView.frame;
}
- (void)activeImageViewCreate
{
    activFavorImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"activfavor.png"]];
    activFavorImageView.frame = favorView.frame;
    [activFavorImageView setHidden:YES];
}

- (void)grayViewCreateWithFrame:(CGRect)frame
{
    grayView = [[UIView alloc]initWithFrame:frame];
    grayView.backgroundColor = [UIColor grayColor];
    grayView.alpha = 0.7;}

- (void)favorViewCreateWithFrame:(CGRect)frame
{
    favorView = [[UIView alloc]initWithFrame:frame];
    favorView.backgroundColor = [UIColor darkGrayColor];
    favorView.layer.cornerRadius = 10;
    favorView.clipsToBounds = YES;
    favorView.alpha = 0.7;}

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
    titleLabal.text = @"title";
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
    [favorView release];
    [favorImageView release];
    [activFavorImageView release];
    [super dealloc];
}

@end
