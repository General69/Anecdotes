//
//  CycleScrollView.m
//  循环轮播图
//
//  Created by lanou3g on 16/4/12.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "CycleScrollView.h"
#import "NSTimer+Addition.h"

@interface CycleScrollView ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrolllView;
@property(nonatomic,strong)UIPageControl *pageControl;
@property(nonatomic,strong)NSMutableArray *contentViews;

@property(nonatomic,strong)NSTimer *animationTimer;
@property(nonatomic,assign)NSTimeInterval animationDuation;

@property(nonatomic,assign)NSInteger currentagendx;

@end

@implementation CycleScrollView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.autoresizesSubviews = YES;
        
        self.currentagendx = 0;
        
        self.scrolllView = [[UIScrollView alloc] initWithFrame:self.bounds];
        
        self.scrolllView.contentMode = UIViewContentModeCenter;
        self.scrolllView.contentSize = CGSizeMake( 3 *CGRectGetWidth(self.scrolllView.frame),CGRectGetHeight(self.scrolllView.frame));
        
        self.scrolllView.delegate = self;
        
        self.scrolllView.contentOffset = CGPointMake(CGRectGetWidth(self.scrolllView.frame), 0);
        self.scrolllView.pagingEnabled = YES;
        self.scrolllView.bounces = NO;
        self.scrolllView.showsHorizontalScrollIndicator = NO;
        [self addSubview:self.scrolllView];
        
        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(self.bounds.size.width - 100, self.bounds.size.height - 35, 100, 35)];
        [self addSubview:self.pageControl];
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 35, 350, 35)];
        self.label.adjustsFontSizeToFitWidth = YES;
        self.label.textColor = [UIColor lightGrayColor];
        self.label.highlighted =YES;
        self.label.shadowColor = [UIColor blackColor];
        self.label.shadowOffset = CGSizeMake(2.0,2.0);
        [self addSubview:self.label];
        
        
    }
    return self;

}
-(void)titleLabe{
    if (self.currentagendx == 0) {
        self.label.text = self.titleArray[0];
    }
    else if (self.currentagendx == - 1){
    self.label.text = self.titleArray[self.currentagendx -1];
    }
    else
    {
    self.label.text = self.titleArray[self.currentagendx];
        
    }
    
}

-(id)initWithFrame:(CGRect)frame animationDution:(NSTimeInterval)animationDuration{
    
    self = [self initWithFrame:frame];
    
    if (animationDuration > 0.0) {
        self.animationTimer = [NSTimer scheduledTimerWithTimeInterval:animationDuration target:self selector:@selector(animationTimerDidFired:) userInfo:nil repeats:YES];
        self.animationDuation = animationDuration;
    }
    return self;

}
-(void)animationTimerDidFired:(NSTimer *)timer{
    
    CGPoint newPoint = CGPointMake(self.scrolllView.contentOffset.x + CGRectGetWidth(self.scrolllView.frame), self.scrolllView.contentOffset.y);
    [self.scrolllView setContentOffset:newPoint animated:YES];
    
}

-(NSInteger)getNextPageIndex:(NSInteger)currentPageIndex{
    if (currentPageIndex == -1) {

        return  self.totalPagesConunt - 1;
    }else if (currentPageIndex == self.totalPagesConunt
              ){
        return 0;
       
    }
    else{
        
        return currentPageIndex;
    }
    
}


-(void)setTotalPagesConunt:(NSInteger)totalPagesConunt{

    _totalPagesConunt = totalPagesConunt;
    
    if (_totalPagesConunt > 0) {
        [self configCoutentView];
        [self.animationTimer resumeTimerAfterTimeInterval:self.animationDuation];
        _pageControl.numberOfPages = _totalPagesConunt;
        
    }
}


-(void)configCoutentView{
    
    [self.scrolllView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self setScrollViewContentData];
    NSInteger count = 0;
    for (UIView *contentView in self.contentViews) {
        contentView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(contentViewTapAction:)];
        [contentView addGestureRecognizer:tapGesture];
        CGRect rightRect = contentView.frame;
        rightRect.origin = CGPointMake(CGRectGetWidth(self.scrolllView.frame) *(count++), 0);
        
        contentView.frame = rightRect;
        
        [self.scrolllView addSubview:contentView];
        
    }
    [_scrolllView setContentOffset:CGPointMake((_scrolllView.frame.size.width), 0)];
    
    
    
}

-(void)setScrollViewContentData{
    if (self.contentViews == nil) {
        self.contentViews = [NSMutableArray array];
    }
    [self.contentViews removeAllObjects];
  
    NSInteger beforePageIndex = [self getNextPageIndex:self.currentagendx - 1];
    NSInteger afterPageIndex = [self getNextPageIndex:self.currentagendx + 1];
    
    
    if (self.fetchContentViewAtIndex) {
        [self.contentViews addObject:self.fetchContentViewAtIndex(beforePageIndex)];
        _label.text = self.titleLable(self.currentagendx );

        [self.contentViews addObject:self.fetchContentViewAtIndex(_currentagendx)];
        [self.contentViews addObject:self.fetchContentViewAtIndex(afterPageIndex)];

    }
    
    
    
}

-(void)contentViewTapAction:(UITapGestureRecognizer *)tap{
    if (self.tapActionBlock) {
        self.tapActionBlock(self.currentagendx);
    }
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    [self.animationTimer pauserTimer];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int contentOffSext = scrollView.contentOffset.x;
    if (contentOffSext >= 2 *CGRectGetWidth(scrollView.frame)) {
        self.currentagendx = [self getNextPageIndex:self.currentagendx + 1];
        [self configCoutentView];
        _label.text = self.titleLable(self.currentagendx );

    }
    if (contentOffSext <= 0) {
        self.currentagendx = [self getNextPageIndex:self.currentagendx -1];
        _label.text = self.titleLable(self.currentagendx );

        [self configCoutentView];
    }
    _pageControl.currentPage = self.currentagendx;
   
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    [scrollView setContentOffset:CGPointMake(CGRectGetWidth(scrollView.frame), 0) animated:YES];
    [self.animationTimer resumeTimerAfterTimeInterval:self.animationDuation];
}




@end
