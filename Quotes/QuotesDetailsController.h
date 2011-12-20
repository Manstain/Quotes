//
//  QuotesDetailsController.h
//  Quotes
//
//  Created by Pavel on 12/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailCell.h"

#define NAVBARHEIGHT 70

@interface QuotesDetailsController : UIViewController <UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>
{
    UIButton *leftButton;
    UIView *grayView;
    UILabel *titleLabal;
    UITableView *contentView;
    NSString *content;
    UIView *favorView;
    UIImageView *favorImageView;
    UIImageView *activFavorImageView;
}

-(IBAction)leftButtonPushed:(id)sender;
- (void)leftButtonCreateWithFrame:(CGRect)frame;
- (void)titleLabelCreateWithFrame:(CGRect)frame;
- (void)contentViewCreate;
- (void)favorViewCreateWithFrame:(CGRect)frame;
- (void)grayViewCreateWithFrame:(CGRect)frame;
- (void)favorImageViewCrete;
- (void)activeImageViewCreate;
- (void)favorTapped;

@end
