//
//  CycleScrollView.h
//  循环轮播图
//
//  Created by lanou3g on 16/4/12.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UIView *(^FetchContentViewAtIndex)(NSInteger pageIndex);
;
typedef void(^TapActionBlock)(NSInteger pageIndex);
typedef NSString *(^LabelTile)(NSInteger pageIndex);
@interface CycleScrollView : UIView

@property(nonatomic,assign)NSInteger totalPagesConunt;
@property(nonatomic,strong)UILabel *label;
@property(nonatomic,copy)FetchContentViewAtIndex fetchContentViewAtIndex;
@property(nonatomic,copy)TapActionBlock tapActionBlock;
@property(nonatomic,copy)LabelTile titleLable;
@property(nonatomic,strong)NSMutableArray *titleArray;


-(id)initWithFrame:(CGRect)frame  animationDution:(NSTimeInterval)animationDuration;
-(void)titleLabele:(NSString *)label;



@end
