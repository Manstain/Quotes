//
//  MyCell.h
//  Quotes
//
//  Created by Pavel on 12/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuartzCore/QuartzCore.h"

@interface QuoteCell : UITableViewCell


@property(nonatomic,retain) UILabel* title;

- (void) setCellFrame:(CGRect)frame;

@end
