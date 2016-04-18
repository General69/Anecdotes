//
//  InteresViewController.m
//  Anecdotes
//
//  Created by lanou3g on 16/4/16.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "InteresViewController.h"

@interface InteresViewController ()

@end

@implementation InteresViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *bgImage = [UIImage imageNamed:@"Inters.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:bgImage];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
