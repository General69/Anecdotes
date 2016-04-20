//
//  AnecdoteModel.h
//  Anecdotes
//
//  Created by lanou3g on 16/4/18.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnecdoteModel : NSObject

@property(nonatomic,strong)NSString *ad;
@property(nonatomic,strong)NSString *detailPath;
@property(nonatomic,strong)NSString *down;
@property(nonatomic,strong)NSString *fav;
@property(nonatomic,strong)NSString *haveImg;
@property(nonatomic,strong)NSString *Id;
@property(nonatomic,strong)NSString *image;
@property(nonatomic,strong)NSString *imgGroup;
@property(nonatomic,strong)NSMutableArray *imgIds;
@property(nonatomic,strong)NSMutableArray *imgSids;
@property(nonatomic,strong)NSMutableArray *imgSizes;
@property(nonatomic,strong)NSString *imgSummarys;
@property(nonatomic,strong)NSMutableArray *imgurls;
@property(nonatomic,strong)NSString *index;
@property(nonatomic,strong)NSString *recommend;
@property(nonatomic,strong)NSString *site;
@property(nonatomic,strong)NSString *summary;
@property(nonatomic,strong)NSMutableArray *tags;
@property(nonatomic,strong)NSString *time;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *up;
@property(nonatomic,strong)NSString *url;
@end
