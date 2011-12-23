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
//    
//    Quote *quote = [NSEntityDescription insertNewObjectForEntityForName:@"Quote" inManagedObjectContext:[CoreDataManager sharedInstance].managedObjectContext];
//    [quote setValue:@"gamabunta" forKey:@"title"];
//    [quote setValue:@"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbcccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc" forKey:@"text"];
//    [quote setValue:0 forKey:@"favor"];
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

@end
