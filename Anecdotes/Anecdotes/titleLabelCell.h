//
//  titleLabelCell.h
//  Anecdotes
//
//  Created by lanou3g on 16/4/19.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnecdoteModel.h"
@interface titleLabelCell : UITableViewCell
@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong)UILabel *newsLabel;
@property(nonatomic,strong)UILabel *timeLabel;
-(void)setDataWithModel:(AnecdoteModel *)model;

@end
