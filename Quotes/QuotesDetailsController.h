//
//  QuotesDetailsController.h
//  Quotes
//
//  Created by Pavel on 12/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "FavorDetailsController.h"

@interface QuotesDetailsController : FavorDetailsController
{
    UIView *favorView;
    UIImageView *favorImageView;
    UIImageView *activFavorImageView;

}

- (void)favorImageViewCreate;
- (void)activeImageViewCreate;
- (IBAction)favorTapped:(id)sender;
- (void)favorViewCreateWithFrame:(CGRect)frame;
- (void)hideActiveImageView;

@end
