//
//  TabBarController.m
//  Quotes
//
//  Created by Pavel on 12/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TabBarController.h"
#import "FavoritesController.h"

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
    quotes.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
    
    
    UINavigationController *quotesNavCtrl = [[UINavigationController alloc]initWithRootViewController:favorites];
    favorites.tabBarItem =  [[UITabBarItem alloc] initWithTitle:@"Quotes" image:[UIImage imageNamed:@"quotes.jpeg"] tag:1]; 
    [self setViewControllers:[NSArray arrayWithObjects:favoritesNavCtrl, quotesNavCtrl, nil] animated:YES];
    
    [quotes release];
    [favorites release];
    [favoritesNavCtrl release];
    [quotesNavCtrl release];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    
}

@end
