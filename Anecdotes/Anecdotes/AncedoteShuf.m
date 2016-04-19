//
//  AncedoteShuf.m
//  Anecdotes
//
//  Created by lanou3g on 16/4/18.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "AncedoteShuf.h"

@implementation AncedoteShuf

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"description"]) {
        self.Description = value;
    }
    if ([key isEqualToString:@"id"]) {
        self.Id = (NSInteger)value;
    }

    
}
//-(void)setValue:(id)value forKey:(NSString *)key{
//
//
//}


@end
