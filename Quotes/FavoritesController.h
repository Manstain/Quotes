//
//  FavoritesController.h
//  Quotes
//
//  Created by Pavel on 12/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableController.h"
#import "FavorDetailsController.h"

@interface FavoritesController : TableController
{
    UIButton *editButton;
}

- (void) editButtonPushed;

@end
