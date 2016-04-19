//
//  NetWorkRequestManager.m
//  Leisures
//
//  Created by lanou3g on 16/3/30.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "NetWorkRequestManager.h"

@implementation NetWorkRequestManager


+(void)requestWithType:(RequestType)Type urlString:(NSString *)urlString parDic:(NSDictionary *)parDic finsh:(RequestFinish)finish error:(RequestError)errorReq{
    
    NetWorkRequestManager *manager = [[NetWorkRequestManager alloc] init];
    
    [manager requestWithType:Type urlString:urlString parDic:parDic finsh:finish error:errorReq];

}

//网络请求方法
-(void)requestWithType:(RequestType)type urlString:(NSString *)uslString parDic:(NSDictionary *)parDic finsh:(RequestFinish)finish error:(RequestError)errorReq{
//1，生成URL
    NSURL *url = [NSURL URLWithString:uslString];

//    创建一个可变的网络请求类
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //    设置网络请求方式，GET或POST
//    默认为GET
    if (type == POST) {
//        设置请求方式
        [request setHTTPMethod:@"POST"];
//        判断参数列表是否有值
        if(parDic.count > 0){
//            做参数列表转化 由字典转成Data
            NSData *data = [self parDicToDataWithDic:parDic];
//            设置请求体
            [request setHTTPBody:data];
            
        }
    }
//    4,创建请求任务
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(data){
            
            dispatch_async(dispatch_get_main_queue(), ^{
                finish(data);
            });
            
            
        }
        if (error) {
            errorReq(error);
            NSLog(@"%@",error);
        }
        
    }];
//    网络请求
    
    [task resume];
}

//将参数列表格式化  key = value & key = value

-(NSData *)parDicToDataWithDic:(NSDictionary *)dic{

    NSMutableArray *array = [NSMutableArray array];
   //遍历字典，得到每一个键
    for (NSString *key in dic) {
        
          NSString *str = [NSString stringWithFormat:@"%@=%@",key,dic[key]];
        [array addObject:str];
        
    }
    
//    将数组中的值通过&拼接成字符串
    NSString *parString = [array componentsJoinedByString:@"&"];
    
    NSData *data = [parString dataUsingEncoding:NSUTF8StringEncoding];

    return data;

}

@end
