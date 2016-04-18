//
//  MenuView.m
//  Anecdotes
//
//  Created by lanou3g on 16/4/15.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "MenuView.h"

@implementation MenuView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setupView];
    }
    return self;
}
-(void)setupView{
   
    self.name = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width / 2 - 50, 170, 100, 30)];
    self.name.backgroundColor  = [UIColor blackColor];
    [self addSubview:self.name];
}








@end
