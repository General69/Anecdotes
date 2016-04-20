//
//  UIImage+Additon.h
//  Anecdotes
//
//  Created by lanou3g on 16/4/19.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Additon)


+(UIImage *)resizeUIImage:(UIImage *)image toWith:(CGFloat)width height:(CGFloat)height;

+(UIImage *)resizeToTabIcon:(UIImage *)iconImage;
@end
