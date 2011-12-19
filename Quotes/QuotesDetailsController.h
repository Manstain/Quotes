//
//  QuotesDetailsController.h
//  Quotes
//
//  Created by Pavel on 12/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailCell.h"

#define NAVBARHEIGHT 70

@interface QuotesDetailsController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    UIButton *leftButton;
    UIView *grayView;
    UILabel *titleLabal;
    UITableView *contentView;
    NSString *content;
}

-(IBAction)leftButtonPushed:(id)sender;

@end
