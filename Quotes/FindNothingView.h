//
//  FindNothingView.h
//  Quotes
//
//  Created by Pavel on 12/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuartzCore/QuartzCore.h"

@interface FindNothingView : UIView
{
    UIButton *findNothingButton;
    UILabel *findNothingTitle;
}

- (void)findNothingButtonCreate;
- (void)findNothingTitleCreate;
- (void)backButtonPushed;

@end
