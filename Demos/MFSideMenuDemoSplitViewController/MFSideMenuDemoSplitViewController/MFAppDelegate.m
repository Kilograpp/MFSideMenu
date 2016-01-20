//
//  MFAppDelegate.m
//  MFSideMenuDemoSplitViewController
//
//  Created by Michael Frederick on 3/29/13.
//  Copyright (c) 2013 Frederick Development. All rights reserved.
//

#import "MFAppDelegate.h"
#import "MFMasterViewController.h"
#import "MFDetailViewController.h"
#import "MFSideMenuContainerViewController.h"
#import "SideMenuViewController.h"

@implementation MFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    MFMasterViewController *masterViewController = [[MFMasterViewController alloc] initWithNibName:@"MFMasterViewController" bundle:nil];
    UINavigationController *masterNavigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
    
    MFDetailViewController *detailViewController = [[MFDetailViewController alloc] initWithNibName:@"MFDetailViewController" bundle:nil];
    UINavigationController *detailNavigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
    
    masterViewController.detailViewController = detailViewController;
    
    self.splitViewController = [[UISplitViewController alloc] init];
    self.splitViewController.delegate = detailViewController;
    CGRect frame = self.splitViewController.view.frame;
    frame.origin = CGPointZero;
    self.splitViewController.view.frame = frame;
    self.splitViewController.viewControllers = @[masterNavigationController, detailNavigationController];

    SideMenuViewController *leftSideMenuController = [[SideMenuViewController alloc] init];
    UIViewController *underLeftViewController  = [[UIViewController alloc] init];
    underLeftViewController.view.layer.borderWidth     = 20;
    underLeftViewController.view.layer.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0].CGColor;
    underLeftViewController.view.layer.borderColor     = [UIColor colorWithWhite:0.8 alpha:1.0].CGColor;
    underLeftViewController.edgesForExtendedLayout     = UIRectEdgeTop | UIRectEdgeBottom | UIRectEdgeLeft; // don't go under the top view

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    view.center = underLeftViewController.view.center;
    [underLeftViewController.view addSubview:view];
    MFSideMenuContainerViewController *container = [MFSideMenuContainerViewController
                                                    containerWithCenterViewController:self.splitViewController
                                                    leftMenuViewController:leftSideMenuController
                                                    rightMenuViewController:underLeftViewController];
    container.rightMenuWidth = 400;
    self.window.rootViewController = container;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
