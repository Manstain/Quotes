//
//  myAppDelegate.m
//  Quotes
//
//  Created by Pavel on 12/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "myAppDelegate.h"

@implementation myAppDelegate

@synthesize window = _window;


- (void)dealloc
{
    [_window release];
    [rootCtrl release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    rootCtrl = [[RootViewController alloc]init];
    [self.window addSubview:rootCtrl.view];
    [self.window makeKeyAndVisible];
    return YES;
}




@end
