//
//  ReadViewController.m
//  Anecdotes
//
//  Created by lanou3g on 16/4/16.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "ReadViewController.h"
#import "AnecdoteViewController.h"
#include "GossipViewController.h"
#include "InteresViewController.h"
#include "OtherViewController.h"

@interface ReadViewController ()<UITabBarControllerDelegate>

@end


@implementation ReadViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    
  
    
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{

    viewController.tabBarController.tabBar.tintColor = [UIColor greenColor];
}

@end
