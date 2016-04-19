//
//  AnecdoteViewController.m
//  Anecdotes
//
//  Created by lanou3g on 16/4/16.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "AnecdoteViewController.h"
#import "CycleScrollView.h"
#import "UrHeadersDefine.h"
#import "UIImageView+Addion.h"
#import <UIImageView+WebCache.h>
#import "NetWorkRequestManager.h"
#import "AncedoteShuf.h"
@interface AnecdoteViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)CycleScrollView *cycleScrollView;
@property(nonatomic,strong)NSMutableArray *shulArray;
@property(nonatomic,strong)NSMutableArray *labelArray;


@end

@implementation AnecdoteViewController




- (void)viewDidLoad {
    [super viewDidLoad];


    UIImage *bgImage = [UIImage imageNamed:@"Menu.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:bgImage];

    
    [self requestData];
     _shulArray = [NSMutableArray array];
    _labelArray = [NSMutableArray array];
}

-(void)requestData{
    
  [NetWorkRequestManager requestWithType:GET urlString:SHOWGET_URL parDic:nil finsh:^(NSData *data) {
    NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *array = [dataDic valueForKey:@"items"];
    for (NSDictionary *dic  in array) {
        AncedoteShuf *model = [[AncedoteShuf alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.shulArray addObject:model];
        
    }
    [self createCycleScrollView];
    
    
    
} error:^(NSError *error) {
    NSLog(@"%@",error);
}];
    
    
    
    
    
}
-(void)createCycleScrollView{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1)];
    [self.view addSubview:view];
    
    
    _cycleScrollView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0,64, [[UIScreen mainScreen] bounds].size.width, 180)animationDution:1];
    
    
    NSMutableArray *viewsArray = [@[]mutableCopy];
    NSMutableArray *titleArray = [@[]mutableCopy];
    for (int i = 0; i < _shulArray.count; ++i) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:_cycleScrollView.bounds];
        imageView.backgroundColor = [UIColor colorWithRed:arc4random()%256 / 255.f green:arc4random()%256 / 255.f blue:arc4random()%256 / 255.f alpha:1];
        AncedoteShuf *model = _shulArray[i];
        [imageView sd_setImageWithURL:[NSURL URLWithString:model.imageUrl]];
            [viewsArray addObject:imageView];
        [titleArray addObject:model.title];
        
    }
    
    [self.view addSubview:_cycleScrollView];
    
    _cycleScrollView.titleLable = ^NSString *(NSInteger pageIndex){
        return titleArray[pageIndex];
    };
    
    _cycleScrollView.titleArray = titleArray;
    _cycleScrollView.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex){
        
        return viewsArray[pageIndex];
        
    };
    _cycleScrollView.totalPagesConunt = viewsArray.count;
}





@end
