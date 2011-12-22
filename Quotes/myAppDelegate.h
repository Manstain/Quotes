//
//  myAppDelegate.h
//  Quotes
//
//  Created by Pavel on 12/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface myAppDelegate : UIResponder <UIApplicationDelegate>
{
    RootViewController *rootCtrl;
}

@property (strong, nonatomic) UIWindow *window;



@end
