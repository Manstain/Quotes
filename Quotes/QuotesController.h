//
//  QuotesController.h
//  Quotes
//
//  Created by Pavel on 12/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCell.h"
#import "QuotesDetailsController.h"

#define finderHeight 70

@interface QuotesController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    UIView *finder;
    UITableView *myTableView;
}

@end
