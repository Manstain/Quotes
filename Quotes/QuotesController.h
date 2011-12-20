//
//  QuotesController.h
//  Quotes
//
//  Created by Pavel on 12/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TableController.h"

@interface QuotesController : TableController <UISearchBarDelegate>
{
    UISearchBar *finder;
}

@end
