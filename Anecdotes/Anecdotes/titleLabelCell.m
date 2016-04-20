//
//  titleLabelCell.m
//  Anecdotes
//
//  Created by lanou3g on 16/4/19.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "titleLabelCell.h"

@implementation titleLabelCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.label  = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.frame.size.width , 30)];
        self.label.numberOfLines = 0;
        [self addSubview:self.label];
        self.newsLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.label.bounds) + 10, 100, 30)];
        [self addSubview:self.newsLabel];
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.newsLabel.bounds) + 10, CGRectGetMaxY(self.newsLabel.bounds) + 10, 100, 30)];
        [self addSubview:self.timeLabel];
        
    }
    return  self;
}


-(void)setDataWithModel:(AnecdoteModel *)model{
    
    self.label.text = model.title;

    self.newsLabel.text = model.site;
    
    self.timeLabel.text = model.time;
}
@end
