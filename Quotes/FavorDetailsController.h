//
//  FavorDeailsController.h
//  Quotes
//
//  Created by Pavel on 12/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Quote.h"
#import "CoreDataManager.h"
#import "QuoteCell.h"

#define NAVBARHEIGHT 70

@interface FavorDetailsController:UIViewController <UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>
{
    UIButton *leftButton;
    UIView *grayView;
    UILabel *titleLabal;
    UITableView *contentView;
    NSString *content;
}

@property(nonatomic,retain)Quote *quoteModel;

- (IBAction)leftButtonPushed:(id)sender;
- (void)leftButtonCreateWithFrame:(CGRect)frame;
- (void)titleLabelCreateWithFrame:(CGRect)frame;
- (void)contentViewCreate;
- (void)grayViewCreateWithFrame:(CGRect)frame;

@end
