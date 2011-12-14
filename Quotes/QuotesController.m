//
//  QuotesController.m
//  Quotes
//
//  Created by Pavel on 12/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "QuotesController.h"

@implementation QuotesController

- (void)loadView
{
    [super loadView];
    [self.tableView setG];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 20;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"QuoteCell";
    
    MyCell *cell = (MyCell *)[tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle]loadNibNamed:@"MyCell" owner:nil options:nil];
        
        for (id curObject in topLevelObjects)
        {
            if ([curObject isKindOfClass:[UITableViewCell class]])
            {
                cell = (MyCell*)curObject;
                break;
            }
        }
    }

    cell.title.text = cellId;
    
    return cell;
    
}





@end
