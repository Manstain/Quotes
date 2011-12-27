//
//  QuotesController.m
//  Quotes
//
//  Created by Pavel on 12/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "QuotesController.h"

@implementation QuotesController

-(void)loadView
{
    [super loadView];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loadQuotes) name:@"QuoteRemovedFromFavorities" object:nil];
    filteredQuotesData = [[NSMutableArray alloc]init];
    
//    Quote *quote = [NSEntityDescription insertNewObjectForEntityForName:@"Quote" inManagedObjectContext:[CoreDataManager sharedInstance].managedObjectContext ];
//    [quote setValue:@"kavabanga" forKey:@"title"];
//    [quote setValue:@"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" forKey:@"text"];
//    [quote setValue:[NSNumber numberWithBool:NO] forKey:@"favor"];
//    [quote setValue:[NSNumber numberWithInt:1] forKey:@"quoteID"];
//    
//    Quote *quote1 = [NSEntityDescription insertNewObjectForEntityForName:@"Quote" inManagedObjectContext:[CoreDataManager sharedInstance].managedObjectContext ];
//    [quote1 setValue:@"gamabunta" forKey:@"title"];
//    [quote1 setValue:@"bbbbbbbbbbbbbbbbbbbbbbbbb" forKey:@"text"];
//    [quote1 setValue:[NSNumber numberWithBool:NO] forKey:@"favor"];
//    [quote1 setValue:[NSNumber numberWithInt:2] forKey:@"quoteID"];
//    
//    Quote *quote2 = [NSEntityDescription insertNewObjectForEntityForName:@"Quote" inManagedObjectContext:[CoreDataManager sharedInstance].managedObjectContext ];
//    [quote2 setValue:@"zalatustra" forKey:@"title"];
//    [quote2 setValue:@"ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc" forKey:@"text"];
//    [quote2 setValue:[NSNumber numberWithBool:NO] forKey:@"favor"];
//    [quote2 setValue:[NSNumber numberWithInt:3] forKey:@"quoteID"];
//    [[CoreDataManager sharedInstance] saveContext];
    
    [self loadQuotes];
    
    finder = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    finder.delegate = self;
    [self.view addSubview:finder];
    
}

- (void)loadQuotes
{
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Quote" inManagedObjectContext:[CoreDataManager sharedInstance].managedObjectContext];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [[CoreDataManager sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (quotesData != nil)
    {
        [quotesData release];
    }
    
    quotesData = [[NSMutableArray arrayWithArray:fetchedObjects]retain];
    [fetchRequest release];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    finder.frame = CGRectMake(0, 45, 320, 45);
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuotesDetailsController *details = [[QuotesDetailsController alloc]init];
    details.quoteModel = [quotesData objectAtIndex:indexPath.section];
    [self.navigationController pushViewController:details animated:YES];
    [details release];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [finder endEditing:YES];
    finder.showsCancelButton = NO;
    [darkView removeFromSuperview];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSMutableArray *tmpArray;
    
    for (Quote *curQuote in quotesData)
    {
        if (![finder.text compare:curQuote.title])
        {
            [filteredQuotesData addObject:curQuote]; 
        }
    }
    
    tmpArray = quotesData;
    quotesData = filteredQuotesData;
    filteredQuotesData = tmpArray;
    
    [quotesTableView reloadData];

    [finder endEditing:YES];
    finder.showsCancelButton = NO;
    [darkView removeFromSuperview];
}

- (void) darkViewCreate
{
    darkView = [[UIView alloc]init];
    darkView.frame = quotesTableView.frame;
    darkView.backgroundColor = [UIColor darkGrayColor];
    darkView.alpha = 0.7;
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    
    if (!darkView)
    {
        [self darkViewCreate];
    }
    
    [self.view addSubview:darkView];

    return finder.showsCancelButton = YES;
    
}

- (void)dealloc
{
    if (darkView)
    {
        [darkView release];
    }
    
    [filteredQuotesData release];
    [finder release];
    [super dealloc];
}

@end
