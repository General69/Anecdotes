//
//  NetWorkRequestManager.h
//  Leisures
//
//  Created by lanou3g on 16/3/30.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

//定义枚举 用来标识请求类型
typedef NS_ENUM(NSUInteger, RequestType) {
    GET,
    POST,
    
};

//网络请求完成的block
typedef void (^RequestFinish)(NSData *data);

//网络请求失败的block
typedef void(^RequestError)(NSError *error);

@interface NetWorkRequestManager : NSObject

//用来进行网络请求的调用
+(void)requestWithType:(RequestType )Type urlString:(NSString *)urlString parDic:(NSDictionary *)parDic finsh:(RequestFinish)finish error:(RequestError)errorReq;











@end
