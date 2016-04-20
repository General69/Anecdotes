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
#import "AnecdoteModel.h"
#import "AncedoteViewCell.h"
#import "firstImageCell.h"
#import "titleLabelCell.h"
#import "SecondaryView.h"
#import "LORefresh.h"

@interface AnecdoteViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)CycleScrollView *cycleScrollView;
@property(nonatomic,strong)NSMutableArray *shulArray;
@property(nonatomic,strong)NSMutableArray *labelArray;
@property(nonatomic,strong)NSMutableArray *cellListArray;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,assign)NSInteger start;
@end

@implementation AnecdoteViewController




- (void)viewDidLoad {
    [super viewDidLoad];

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 191, self.view.bounds.size.width, self.view.bounds.size.height- 241)];
    
    [self registercell];
    [self.view addSubview: _tableView];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UIImage *bgImage = [UIImage imageNamed:@"Menu.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:bgImage];

    
    [self requestData];
     _shulArray = [NSMutableArray array];
    _labelArray = [NSMutableArray array];
    _cellListArray = [NSMutableArray array];
    [self requestALLlist];
    
    [_tableView addRefreshWithRefreshViewType:LORefreshViewTypeHeaderDefault refreshingBlock:^{
        _start = 0;
        [self.tableView.defaultHeader endRefreshing];
        [self requestALLlist];
        
    }];
    
    
    [_tableView addRefreshWithRefreshViewType:LORefreshViewTypeFooterDefault refreshingBlock:^{
        [_tableView.defaultFooter endRefreshing];
        [self requestALLlist];
    }];
    
}

-(void)registercell{

    [_tableView registerClass:[AncedoteViewCell class] forCellReuseIdentifier:@"AncedoteViewCell"];
    [_tableView registerClass:[firstImageCell class] forCellReuseIdentifier:@"firstImageCell"];
    [_tableView registerClass:[titleLabelCell class] forCellReuseIdentifier:@"titleLabelCell"];
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

-(void)requestALLlist{
[NetWorkRequestManager requestWithType:GET urlString:SHOWCELLGET_URL parDic:nil finsh:^(NSData *data) {
    NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *array = [dataDic valueForKey:@"items"];
    for (NSDictionary *dic in array) {
        AnecdoteModel *model = [[AnecdoteModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.cellListArray addObject:model];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [_tableView reloadData];
    });
    
    
    
    
} error:^(NSError *error) {
   
    NSLog(@"%@",error);
}];
    

}



-(void)createCycleScrollView{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1)];
    [self.view addSubview:view];
    
    
    _cycleScrollView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0,64, [[UIScreen mainScreen] bounds].size.width, 180)animationDution:2];
    
    
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
    
    __weak NSArray *cycleArray = _shulArray;
    __weak AnecdoteViewController *anecdote = self;
    
    _cycleScrollView.tapActionBlock = ^(NSInteger pageIndex){
    
        AncedoteShuf *shuf = [cycleArray objectAtIndex:pageIndex];
        SecondaryView *secondary = [[SecondaryView alloc] init];
        secondary.ancedoteShuf =shuf;
        [anecdote.navigationController pushViewController:secondary animated:YES];
    };
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.cellListArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    AnecdoteModel *model = [self.cellListArray objectAtIndex:indexPath.row];
    
    if (model.imgSids.count == 0) {
        titleLabelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"titleLabelCell" forIndexPath:indexPath];
        [cell setDataWithModel:model];
        return cell;
    }
    else if(model.imgSids.count < 3){
        
        firstImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstImageCell" forIndexPath:indexPath];
        [cell setDataWithModel:model];
        return cell;
    }
    else{
        AncedoteViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AncedoteViewCell" forIndexPath:indexPath];
        [cell setDataWithModel:model];
        return cell;
        
    }
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AnecdoteModel *model = [self.cellListArray objectAtIndex:indexPath.row];
    
    if (model.imgSids.count == 0) {
        return 80;
 
    }
    else if(model.imgSids.count < 3){
        
        return 110;
   
    }
    else{
         return 170;
        
    }
   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SecondaryView *secondarView = [[SecondaryView alloc] init];
    
    AnecdoteModel *model = [self.cellListArray objectAtIndex:indexPath.row];
    secondarView.anecdotemodel = model;
    [self.navigationController pushViewController:secondarView animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
    
}


@end
