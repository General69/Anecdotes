//
//  AnecdoteViewController.m
//  Anecdotes
//
//  Created by lanou3g on 16/4/16.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "AnecdoteViewController.h"

@interface AnecdoteViewController ()

@end

@implementation AnecdoteViewController


- (void)viewDidLoad {
    [super viewDidLoad];


    UIImage *bgImage = [UIImage imageNamed:@"Menu.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:bgImage];
    
    [self.navigationController.navigationBar setTranslucent:NO];
  
   
   
  
    
}
@end
