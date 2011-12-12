//
//  TabBarController.m
//  Quotes
//
//  Created by Pavel on 12/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TabBarController.h"

@implementation TabBarController

-(void)loadView
{
    [super loadView];
    
    CGRect frame = self.view.frame;
    frame.origin.y -= 20;
    
    self.view.frame = frame;
    
    UINavigationController *favoritesNavCtrl = [[UINavigationController alloc]init];
    [favoritesNavCtrl.tabBarItem initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
    
    UINavigationController *quotesNavCtrl = [[UINavigationController alloc]init];
    [quotesNavCtrl.tabBarItem initWithTitle:@"Quotes" image:[UIImage imageNamed:@"quotes.jpeg"] tag:1];
    
    self.viewControllers = [NSArray arrayWithObjects:favoritesNavCtrl,quotesNavCtrl, nil];
    
    [favoritesNavCtrl release];
    [quotesNavCtrl release];
}

@end
