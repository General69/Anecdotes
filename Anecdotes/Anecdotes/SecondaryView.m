//
//  SecondaryView.m
//  Anecdotes
//
//  Created by lanou3g on 16/4/19.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "SecondaryView.h"
#import "NSString+Html.h"
#import "NetWorkRequestManager.h"
@interface SecondaryView ()<UIWebViewDelegate>;
@property(nonatomic,strong)UIWebView *textWebView;
@property(nonatomic,strong)NSString *string;
@end
@implementation SecondaryView

-(void)viewDidLoad{
     [super viewDidLoad];

    if (self.ancedoteShuf.linkUrl != nil) {
        self.string = self.ancedoteShuf.linkUrl;
        
    }
    else if (self.anecdotemodel.detailPath != nil){
    self.string = self.anecdotemodel.detailPath;
        
    }else{
        NSLog(@"地址无效");
    }
    self.textWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _textWebView.delegate = self;
    _textWebView.scalesPageToFit = NO;
    
    [self requesData:(self.string)];
    
    [self.view addSubview:self.textWebView];
    
    
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
// [ [UIApplication sharedApplication]setNetworkActivityIndicatorVieible:YES];
}
-(void)webViewDidFinishLoad{
[ [UIApplication sharedApplication]setNetworkActivityIndicatorVisible:NO];
    }
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [ [UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];}

-(void)requesData:(NSString *)string{
    
    
    [NetWorkRequestManager requestWithType:GET urlString:string parDic:nil finsh:^(NSData *data) {
        
        
        NSString *dataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
         NSString *newString = [NSString importStyleWithHtmlString:dataString];
        NSURL *baseurl = [NSURL fileURLWithPath:[NSBundle mainBundle].bundlePath];
        
        [_textWebView loadHTMLString:newString baseURL:baseurl];
        
        
        
    } error:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    

    
    
}

@end
