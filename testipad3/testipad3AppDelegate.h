//
//  testipad3AppDelegate.h
//  testipad3
//
//  Created by SHYAM SUNDAR GAVARAPET ASHOK on 7/18/12.
//  Copyright 2012 UNIVERSITY AT BUFFALO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"
#import "DMPGridViewController.h"

@class testipad3ViewController;
@class RootViewController;
@class DetailViewController;
@class MGSplitViewController;

@interface testipad3AppDelegate : NSObject <UIApplicationDelegate, FBSessionDelegate, UITabBarControllerDelegate>{
    
    Facebook *facebook;
    UINavigationController *navCon;
    UINavigationController *navCon2;
    UINavigationController *navCon3;
    UINavigationController *navCon4;
    UIWindow *window;
    IBOutlet UITabBarController *tabbarController;
    NSMutableArray *topLevelControllers;
    RootViewController *rootViewController;
    DetailViewController *detailViewController;


}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet Facebook *facebook;
@property (nonatomic, retain) UINavigationController *navCon;
@property (nonatomic, retain) UINavigationController *navCon2;
@property (nonatomic, retain) UITabBarController *tabbarController;
@property (nonatomic, retain) IBOutlet testipad3ViewController *viewController;
@property (nonatomic, retain) IBOutlet RootViewController *rootViewController;
@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;
@property (nonatomic, retain) IBOutlet UINavigationController *navCon3;
@property (nonatomic, retain) IBOutlet UINavigationController *navCon4;


- (void)tabBarSetup;

@end
