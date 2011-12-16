//
//  FavoritesController.m
//  Quotes
//
//  Created by Pavel on 12/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "FavoritesController.h"

@implementation FavoritesController

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    FavorDetailsController *details = [[FavorDetailsController alloc]init];
    [self.navigationController pushViewController:details animated:YES];
    [details release];
}

@end
