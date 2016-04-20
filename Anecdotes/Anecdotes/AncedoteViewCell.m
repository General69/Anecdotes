//
//  AncedoteViewCell.m
//  Anecdotes
//
//  Created by lanou3g on 16/4/19.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "AncedoteViewCell.h"
#import <UIImageView+WebCache.h>
@implementation AncedoteViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0,self.bounds.size.width + 10, 35)];
        self.label.textColor = [UIColor brownColor];
        [self addSubview: self.label];
        self.firstImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 38, self.bounds.size.width / 3+ 10 , 90)];
        self.firstImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;;
        self.firstImageView.layer.borderWidth = 5;
        [self addSubview:self.firstImageView];
        
        self.secondImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.firstImageView.frame)+ 20, 38, self.bounds.size.width / 3 + 10, 90)];
        self.secondImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;;
        self.secondImageView.layer.borderWidth = 5;
        [self addSubview:self.secondImageView];
        
        self.thirdImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.secondImageView.frame) + 20, 38, self.bounds.size.width / 3 + 10 , 90)];
        self.thirdImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;;
        self.thirdImageView.layer.borderWidth = 5;
        
        [self addSubview: self.thirdImageView];
        
        self.newsLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.thirdImageView.frame) + 10, 75, 30)];
        self.newsLabel.textColor= [UIColor colorWithWhite:0.5 alpha:0.8];;
        [self addSubview: self.newsLabel];
       
        self.timeLabel =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.newsLabel.bounds)+ 10, CGRectGetMaxY(self.thirdImageView.frame) + 10, 100, 30)];
        self.timeLabel.textColor= [UIColor colorWithWhite:0.3 alpha:0.8];;
        [self addSubview: self.timeLabel];
        
    }
    
    return self;
}
-(void)setDataWithModel:(AnecdoteModel *)model{
    self.label.text = model.title;
    
    NSMutableArray *array  = model.imgSids;
    NSString *firest = array[0];
    NSString *secone = array[1];
    NSString *third = array[2];
    [self.firstImageView sd_setImageWithURL:[NSURL URLWithString:firest]];
    [self.secondImageView sd_setImageWithURL:[NSURL URLWithString:secone]];
    [self.thirdImageView sd_setImageWithURL:[NSURL URLWithString:third]];
    
    self.newsLabel.text = model.site;
    
    self.timeLabel.text = model.time;
    
}

@end
