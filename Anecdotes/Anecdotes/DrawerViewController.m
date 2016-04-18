//
//  DrawerViewController.m
//  Anecdotes
//
//  Created by lanou3g on 16/4/15.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "DrawerViewController.h"
#import "MenuView.h"
#define KMenuFullWidth [UIScreen mainScreen].bounds.size.width
#define KmenuDisplayedWidth 280.f
#import "AppDelegate.h"

@interface DrawerViewController (){

    BOOL canShowLeft;

}
@property(nonatomic,strong)AppDelegate *app;

@end
@implementation DrawerViewController

-(id)initWithRootController:(UIViewController *)controller{
    if (self = [super init]) {
        self.rootViewController = controller;
    }
    return self;

}
-(void)viewDidLoad{
    [super viewDidLoad];
    canShowLeft = NO;

    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    
    [self.view addGestureRecognizer:self.tap];
    self.tap.enabled = NO;
    self.tap.delegate = self;
    
}
-(void)tapAction{
    [UIView animateWithDuration:0.5 animations:^{
        self.leftViewController.view.frame = CGRectMake(-280, 0, 280, [UIScreen mainScreen].bounds .size.height);
        self.rootViewController.view.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
        
    } completion:^(BOOL finished) {
        self.tap.enabled = NO;
        self.rootViewController.view.userInteractionEnabled = YES;
        [self.leftViewController.view removeFromSuperview];
        canShowLeft = NO;
        
    }];
    

    
}
-(void)setRootViewController:(UIViewController *)rootViewController{

    if (!_rootViewController) {
        _rootViewController = rootViewController;
        _rootViewController.view.frame = self.view.bounds;
        [self.view addSubview:_rootViewController.view];
        UIViewController *currentController = ((UINavigationController *)self.rootViewController).viewControllers[0];
        currentController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"669.png"] style:(UIBarButtonItemStylePlain) target:self action:@selector(leftAction)];
        NSLog(@"%ld",self.uinterger);
        
        currentController.title = @"趣闻";
    }
}

-(void)leftAction{
    if (self.leftViewController == nil) {
        return;
    }
    if (canShowLeft) {
        return;
    }
    self.leftViewController.view.frame = CGRectMake(-280, 0, 280, [[UIScreen mainScreen] bounds].size.height);
    [self.view addSubview:self.leftViewController.view];
    [UIView animateWithDuration:0.5 animations:^{
        self.leftViewController.view.frame = CGRectMake(0, 0, 280, [[UIScreen mainScreen] bounds].size.height);
        self.rootViewController.view.frame = CGRectMake(280, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    } completion:^(BOOL finished) {
        self.rootViewController.view.userInteractionEnabled = NO;
        self.tap.enabled = YES;
        
    }];
    canShowLeft = YES;

}

-(void)setRootViewController:(UIViewController *)controller animated:(BOOL)animated{
    [UIView setAnimationsEnabled:animated];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.leftViewController.view.frame = CGRectMake(-280, 0, 280, [[UIScreen mainScreen] bounds].size.height);
        self.rootViewController.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.rootViewController.view.bounds.size.height);
    } completion:^(BOOL finished) {
        self.tap.enabled = NO;
        self.rootViewController.view.userInteractionEnabled = YES;
        [self.leftViewController.view removeFromSuperview];
        canShowLeft = NO;
        [self.rootViewController.view removeFromSuperview];
        _rootViewController = nil;
        self.rootViewController = controller;
        [UIView setAnimationsEnabled:YES];
    }];

}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{

    if (gestureRecognizer == self.tap) {
        if (self.rootViewController &&  self.leftViewController) {
            return CGRectContainsPoint(self.rootViewController.view.frame, [gestureRecognizer locationInView:self.view]);
        }
        return NO;
    }
    return YES;
    
}


@end
