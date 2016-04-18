//
//  DrawerViewController.h
//  Anecdotes
//
//  Created by lanou3g on 16/4/15.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawerViewController : UIViewController<UIGestureRecognizerDelegate>
@property(nonatomic,strong)UIViewController *rootViewController;
@property(nonatomic,strong)UIViewController *leftViewController;
@property(nonatomic,strong)UITapGestureRecognizer *tap;

@property(nonatomic,assign)NSUInteger uinterger;

-(id)initWithRootController:(UIViewController *)controller;

-(void)setRootViewController:(UIViewController *)controller animated:(BOOL)animated;




@end
