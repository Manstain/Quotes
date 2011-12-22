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

- (void)favorImageViewCrete;
- (void)activeImageViewCreate;
- (void)favorTapped;
- (void)favorViewCreateWithFrame:(CGRect)frame;

@end
