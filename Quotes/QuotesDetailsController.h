//
//  QuotesDetailsController.h
//  Quotes
//
//  Created by Pavel on 12/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "myNavBar.h"

#define NAVBARHEIGHT 70

@interface QuotesDetailsController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    MyNavBar *myNavbar;
    UITableView *contentView;
    NSString *content;
}

@end
