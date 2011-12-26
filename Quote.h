//
//  Quote.h
//  Quotes
//
//  Created by Pavel on 12/26/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Quote : NSManagedObject

@property (nonatomic, retain) NSNumber * favor;
@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * quoteID;

@end
