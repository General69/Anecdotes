//
//  UIImage+Additon.m
//  Anecdotes
//
//  Created by lanou3g on 16/4/19.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "UIImage+Additon.h"

@implementation UIImage (Additon)
+(UIImage *)resizeUIImage:(UIImage *)image toWith:(CGFloat)width height:(CGFloat)height{
    [image drawInRect:CGRectMake(0.0f, 0.0f, width, height)];
    UIImage *newImage = [[UIImage alloc] init];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
    
}
+(UIImage *)resizeToTabIcon:(UIImage *)iconImage{

    return [UIImage resizeUIImage:iconImage toWith:25.0 height:25.0];
}
@end
