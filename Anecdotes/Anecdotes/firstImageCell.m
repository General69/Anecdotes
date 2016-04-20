//
//  firstImageCell.m
//  Anecdotes
//
//  Created by lanou3g on 16/4/19.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "firstImageCell.h"
#import <UIImageView+WebCache.h>
@implementation firstImageCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.firstimageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, self.frame.size.width / 3 , 80)];

        self.firstimageView.layer.borderColor = [UIColor colorWithRed:200/255.0 green:180/255.0 blue:240/255.0 alpha:0.8].CGColor;
        self.firstimageView.layer.borderWidth = 5;
        [self addSubview:self.firstimageView];
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.firstimageView.frame) + 20, 10, self.bounds.size.width - (CGRectGetMaxX(self.firstimageView.bounds)+5) , 50) ];
             self.label.textColor = [UIColor orangeColor];
        self.label.numberOfLines = 0;
        [self addSubview:self.label];
        
        self.newsLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.firstimageView.frame) + 20, CGRectGetMaxY(self.label.bounds) + 10, self.bounds.size.width - (CGRectGetMaxX(self.firstimageView.bounds) + 5) / 2, 30)];
        [self addSubview:self.newsLabel];
        
        self.timeLabel  = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.newsLabel.bounds) , CGRectGetMaxY(self.label.bounds) + 10, self.bounds.size.width - (CGRectGetMaxX(self.firstimageView.bounds) + 5 ) , 30)];
        [self addSubview:self.timeLabel];
        
        
    }
    
    return self;
}

-(void)setDataWithModel:(AnecdoteModel *)model{
    self.label.text = model.title;
    
    NSMutableArray *array  = model.imgSids;
    NSString *firest = array[0];

    [self.firstimageView sd_setImageWithURL:[NSURL URLWithString:firest]];
    
    self.newsLabel.text = model.site;
    
    self.timeLabel.text = model.time;
    
}

@end
