//
//  FavoritesController.m
//  Quotes
//
//  Created by Pavel on 12/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "FavoritesController.h"

@implementation FavoritesController

- (id)init 
{
    self = [super init];
    
    if (self)
    {   
        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
    }
    return self;
}

- (void)loadView
{
    [super loadView];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    FavorDetailsController *details = [[FavorDetailsController alloc]init];
    [self.navigationController pushViewController:details animated:YES];
    [details release];
}

@end
