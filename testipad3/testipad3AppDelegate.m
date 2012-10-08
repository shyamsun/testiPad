//
//  testipad3AppDelegate.m
//  testipad3
//
//  Created by SHYAM SUNDAR GAVARAPET ASHOK on 7/18/12.
//  Copyright 2012 UNIVERSITY AT BUFFALO. All rights reserved.
//

#import "testipad3AppDelegate.h"

#import "testipad3ViewController.h"
#import "SecondViewController.h"
#import "SettingsViewController.h"
#import "Demo1ViewController.h"
#import "tableViewController.h"
#import "LocalAdsTableViewViewController.h"
#import "couponViewController.h"
#import "IIViewDeckController.h"
#import "ExampleNestedTablesViewController.h"
#import "listPickerController.h"
#import "listTableViewCont.h"


@implementation testipad3AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize facebook, navCon, tabbarController, navCon2, rootViewController, detailViewController, navCon3, navCon4;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
     
    [self tabBarSetup];
    ExampleNestedTablesViewController *nestedNav = [[ExampleNestedTablesViewController alloc] init];
    listTableViewCont *list = [[listTableViewCont alloc] init];
    IIViewDeckController* deckController =  [[IIViewDeckController alloc] initWithCenterViewController:self.navCon
                                                                                    leftViewController:nil
                                                                                   rightViewController:list];
    deckController.leftLedge = 650;
    deckController.rightLedge = 650;
    [nestedNav release];
    [list release];
    
    self.window.rootViewController = deckController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [facebook handleOpenURL:url]; 
}

// For iOS 4.2+ support
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [facebook handleOpenURL:url]; 
}

- (void) tabBarSetup{
    
    //Tab 1
    tableViewController *deal = [[tableViewController alloc] initWithNibName:nil bundle:nil withType:@"dailyDeal"];
    ExampleNestedTablesViewController *nestedNav = [[ExampleNestedTablesViewController alloc] init];
    listTableViewCont *list = [[listTableViewCont alloc] init];
    self.navCon = [[UINavigationController alloc] initWithRootViewController:deal];
    self.navCon.title = @"Deals";
    self.navCon.navigationBar.topItem.title = @"Deals";
    [self.navCon setNavigationBarHidden:YES];
    IIViewDeckController* deckController =  [[IIViewDeckController alloc] initWithCenterViewController:self.navCon
                                                                                    leftViewController:nil
                                                                                   rightViewController:list];
    deckController.leftLedge = 650;
    deckController.rightLedge = 650;
    [nestedNav release];
    [list release];
    
    //Tab 2
    LocalAdsTableViewViewController *localAd = [[LocalAdsTableViewViewController alloc] init];
    navCon2 = [[UINavigationController alloc] initWithRootViewController:localAd];
    self.navCon2.title = @"Local Ads";
    self.navCon2.navigationBar.topItem.title = @"Local Ads";
    
    //Tab 3
    couponViewController *coupon = [[couponViewController alloc] init];
    navCon3 = [[UINavigationController alloc] initWithRootViewController:coupon];
    self.navCon3.title = @"Coupons";
    self.navCon3.navigationBar.topItem.title = @"Coupons";

    //Tab 4
    Demo1ViewController *demo = [[Demo1ViewController alloc] init];
    navCon4 = [[UINavigationController alloc] initWithRootViewController:demo];
    self.navCon4.title = @"My Products";
    self.navCon4.navigationBar.topItem.title = @"My Products";
    
    //Tab 5
    SettingsViewController *settings = [[SettingsViewController alloc] init];
    settings.title = @"Settings";
    
    topLevelControllers = [[NSMutableArray alloc] init];
    [topLevelControllers addObject: deckController];
    [topLevelControllers addObject: navCon2];
    [topLevelControllers addObject: navCon3];
    [topLevelControllers addObject: navCon4];
    [topLevelControllers addObject: settings];
    
    tabbarController = [[UITabBarController alloc] init];
    tabbarController.delegate = self;
    [tabbarController setViewControllers:topLevelControllers animated:NO];
    tabbarController.selectedIndex = 0;
    
    [deal release];
    [localAd release];
    [coupon release];
    [settings release];
    [demo release];
    
}


- (void)fbDidLogin {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[facebook accessToken] forKey:@"FBAccessTokenKey"];
    [defaults setObject:[facebook expirationDate] forKey:@"FBExpirationDateKey"];
    NSLog(@"facebook access %@ expiration %@", [facebook accessToken], [facebook expirationDate]);
    [defaults synchronize];
    
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [navCon release];
    [navCon2 release];
    [navCon3 release];
    [navCon4 release];
    [_window release];
    [_viewController release];
    [super dealloc];
}

@end
