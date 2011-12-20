//
//  QuotesController.h
//  Quotes
//
//  Created by Pavel on 12/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuoteCell.h"
#import "QuotesDetailsController.h"

#define HEADERHEIGHT 90

@interface TableController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    UIView *grayView;
    UITableView *quotesTableView;
}

- (void)grayViewCreateWithFrame:(CGRect)frame;


@end
