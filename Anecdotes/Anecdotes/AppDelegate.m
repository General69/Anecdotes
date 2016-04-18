//
//  AppDelegate.m
//  Anecdotes
//
//  Created by lanou3g on 16/4/14.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "AppDelegate.h"
#import "ReadViewController.h"
#import "MenuViewController.h"
#import "DrawerViewController.h"
#import "AnecdoteViewController.h"
#include "GossipViewController.h"
#include "InteresViewController.h"
#include "OtherViewController.h"
@interface AppDelegate ()<UITabBarControllerDelegate>
@property(nonatomic,strong)UITabBarController *tab;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    AnecdoteViewController *readTv = [[AnecdoteViewController alloc] init];
    
      [self tabselect];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:self.tab];
    
  
    
    DrawerViewController *rootController = [[DrawerViewController alloc] initWithRootController:navController];
    
    _drawerController = rootController;
    
    MenuViewController *lefrViewController = [[MenuViewController alloc] init];
    
    rootController.leftViewController = lefrViewController;
    self.window.rootViewController = rootController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    
  
    [self.window makeKeyAndVisible];
    
    
    return YES;
}


-(void)tabselect{
    self.tab = [[UITabBarController alloc ] init];
    AnecdoteViewController *anecdote = [[AnecdoteViewController alloc] init];
    GossipViewController *gossip = [[GossipViewController alloc] init];
    InteresViewController *interes = [[InteresViewController alloc] init];
    OtherViewController *other = [[OtherViewController alloc] init];
    self.tab.viewControllers = @[anecdote,gossip,interes,other];
   
    self.tab.tabBar.tintColor = [UIColor grayColor];
    self.tab.delegate = self;
    
    UIImage *fitstImage = [[UIImage imageNamed:@"tabbar_contacts@3x"]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    
    anecdote.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"趣闻" image:fitstImage selectedImage:[[UIImage imageNamed:@"tabbar_contactsHL@3x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    gossip.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"杂谈" image:[[UIImage imageNamed:@"tabbar_discover@3x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_discoverHL@3x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ]];
    
    interes.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"兴趣" image:[[UIImage imageNamed:@"tabbar_mainframe@3x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]selectedImage:[[UIImage imageNamed:@"tabbar_mainframeHL@3x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    other.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"其他" image:[[UIImage imageNamed:@"tabbar_me@3x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] selectedImage:[[UIImage imageNamed:@"tabbar_meHL@3x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
}


-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    DrawerViewController *draw = [[DrawerViewController alloc] init];
    draw.uinterger = tabBarController.selectedIndex;
    [draw setRootViewController:0];
    
    
    viewController.tabBarController.tabBar.tintColor = [UIColor greenColor];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
