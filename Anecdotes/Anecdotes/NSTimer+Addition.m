//
//  NSTimer+Addition.m
//  循环轮播图
//
//  Created by lanou3g on 16/4/12.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "NSTimer+Addition.h"

@implementation NSTimer (Addition)
//暂停
-(void)pauserTimer{
    if (![self isValid]) {
        return;
    }
    [self setFireDate:[NSDate distantFuture]];
}

-(void)resumeTimer{
    if (![self isValid]) {
        return;
    }
    [self setFireDate:[NSDate date]];
}

-(void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval{
    if (![self isValid]) {
        return;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

@end
