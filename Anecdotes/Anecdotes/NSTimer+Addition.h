//
//  NSTimer+Addition.h
//  循环轮播图
//
//  Created by lanou3g on 16/4/12.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Addition)

-(void)pauserTimer;
-(void)resumeTimer;
-(void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
