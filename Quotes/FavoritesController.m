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
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loadQuotes) name:@"QuoteAddaedToFavorites" object:nil];
    
    [self loadQuotes];
    
    editButton = [[UIButton alloc]init];
    editButton.backgroundColor = [UIColor lightGrayColor];
    [editButton setTitle:@"Edit" forState:UIControlStateNormal];
    [editButton addTarget:self action:@selector(editButtonPushed) forControlEvents:UIControlEventTouchUpInside];
    editButton.layer.cornerRadius = 10;
    editButton.clipsToBounds = YES;

    
    [self.view addSubview:editButton];
}



- (void)loadQuotes
{
    NSError *error;
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"favor = TRUE"];
    
    NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init]autorelease];
    [fetchRequest setPredicate:predicate];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Quote" inManagedObjectContext:[CoreDataManager sharedInstance].managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSArray *fetchedObjects = [[CoreDataManager sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (quotesData != nil)
    {
        [quotesData release];
    }
    
    quotesData = [[NSMutableArray arrayWithArray:fetchedObjects]retain];
    
    [quotesTableView reloadData];

}


- (void) editButtonPushed
{
    if (quotesTableView.editing)
    {
        [quotesTableView setEditing:NO animated:YES];
        editButton.backgroundColor = [UIColor lightGrayColor];
        [editButton setTitle:@"Edit" forState:UIControlStateNormal];
    }
    else
    {
        [quotesTableView setEditing:YES animated:YES];
        editButton.backgroundColor = [UIColor redColor];
        [editButton setTitle:@"Done" forState:UIControlStateNormal];}
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
forRowAtIndexPath:(NSIndexPath *)indexPath 
{
    if (editingStyle == UITableViewCellEditingStyleDelete) 
    {
        Quote *quote = [quotesData objectAtIndex:indexPath.row];
        
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Quote" inManagedObjectContext:[CoreDataManager sharedInstance].managedObjectContext];
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        [request setEntity:entity];
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"quoteID = %@", quote.quoteID];
        [request setPredicate:predicate];
        
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"quoteID" ascending:YES];
        NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
        [request setSortDescriptors:sortDescriptors];
        [sortDescriptors release]; sortDescriptors = nil;
        [sortDescriptor release]; sortDescriptor = nil;
        
        NSError *error;
        quote = [[[CoreDataManager sharedInstance].managedObjectContext executeFetchRequest:request error:&error] objectAtIndex:0];
        [request release]; request = nil;
        
        quote.favor = [NSNumber numberWithBool:NO];
        [[CoreDataManager sharedInstance].managedObjectContext save:&error];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"QuoteRemovedFromFavorities" object:nil];

        [quotesData removeObjectAtIndex:indexPath.row];
        
        if (quotesData.count == 0)
        {
            [self editButtonPushed];
            [editButton setEnabled:NO];
        }
        
        [quotesTableView reloadData];
    }   
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    if (quotesTableView.editing == NO || !indexPath) return UITableViewCellEditingStyleNone;
    
    
    
    return UITableViewCellEditingStyleDelete;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FavorDetailsController *details = [[FavorDetailsController alloc]init];
    details.quoteModel = [quotesData objectAtIndex:indexPath.section];
    [self.navigationController pushViewController:details animated:YES];
    [details release];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    editButton.frame = CGRectMake(25, 10, 80, 30);
    
    if (quotesData.count != 0)
    {
        [editButton setEnabled:YES];
    }
    else
    {
        [editButton setEnabled:NO];
    }
}



- (void)dealloc {
    [editButton release];
    [super dealloc];
}

@end
