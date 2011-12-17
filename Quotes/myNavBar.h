//
//  myNavBar.h
//  Quotes
//
//  Created by Pavel on 12/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyNavBar : UIView
{
    UIButton *leftButton;
    UIView *grayView;
}

- (id) initWithButton:(UIButton*)button;

@end
