//
//  AnecdoteModel.m
//  Anecdotes
//
//  Created by lanou3g on 16/4/18.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "AnecdoteModel.h"

@implementation AnecdoteModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

   
    if ([key isEqualToString:@"id"]) {
        self.Id = value;
    }
    
    
}
@end
