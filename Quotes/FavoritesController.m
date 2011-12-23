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
    
    editButton = [[UIButton alloc]init];
    editButton.backgroundColor = [UIColor lightGrayColor];
    [editButton setTitle:@"Edit" forState:UIControlStateNormal];
    [editButton addTarget:self action:@selector(editButtonPushed) forControlEvents:UIControlStateNormal];
    editButton.layer.cornerRadius = 10;
    editButton.clipsToBounds = YES;

    
    [self.view addSubview:editButton];
}

- (void) editButtonPushed
{
    
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
//forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        //[self.dataArray removeObjectAtIndex:[indexPath row] - 1];
//        
//        // delete the row from the data source
//        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
//    }   
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    FavorDetailsController *details = [[FavorDetailsController alloc]init];
    [self.navigationController pushViewController:details animated:YES];
    [details release];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    editButton.frame = CGRectMake(25, 10, 80, 30);
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath row] == 0) {
        return NO;
    }
    
    return YES;
}

- (void)dealloc {
    [editButton release];
    [super dealloc];
}

@end
