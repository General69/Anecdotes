//
//  SecondaryView.h
//  Anecdotes
//
//  Created by lanou3g on 16/4/19.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnecdoteModel.h"
#import "AncedoteShuf.h"
@interface SecondaryView : UIViewController

@property(nonatomic,strong)AnecdoteModel *anecdotemodel;
@property(nonatomic,strong)AncedoteShuf *ancedoteShuf;
@property(nonatomic,strong)NSString *linkUrl;

@end
