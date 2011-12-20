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
    
    QuotesController *quotes = [[QuotesController alloc]init];
    FavoritesController *favorites = [[FavoritesController alloc]init];
    
    UINavigationController *favoritesNavCtrl = [[UINavigationController alloc]initWithRootViewController:quotes];
    UINavigationController *quotesNavCtrl = [[UINavigationController alloc]initWithRootViewController:favorites];
    
    [self setViewControllers:[NSArray arrayWithObjects:favoritesNavCtrl, quotesNavCtrl, nil] animated:YES];
    
    [quotes release];
    [favorites release];
    [favoritesNavCtrl release];
    [quotesNavCtrl release];
}


@end
