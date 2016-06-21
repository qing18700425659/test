//
//  ViewController.m
//  测试
//
//  Created by DC-002 on 16/6/21.
//  Copyright © 2016年 DC-002. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
@interface ViewController ()
{
    NSMutableSet *set;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    AFHTTPSessionManager *mang=[AFHTTPSessionManager manager];
    //设置响应类型
    mang.responseSerializer=[AFJSONResponseSerializer serializer];
    //增加text/html支持
    set=[NSMutableSet setWithSet:mang.responseSerializer.acceptableContentTypes];
    
    [set addObject:@"text/html"];
    
    mang.responseSerializer.acceptableContentTypes=set;

    [mang.requestSerializer setValue:@"89add89b1fa1603a2a1837ba4d56f441" forHTTPHeaderField:@"apikey"];
    
    [mang GET:@"http://apis.baidu.com/apistore/mobilenumber/mobilenumber" parameters:@{@"phone":@"18700425659"} progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        NSLog(@"%@",responseObject);
        if ([[responseObject valueForKey:@"errNum"]isEqualToNumber:@0]) {
            NSLog(@"%@",[responseObject valueForKey:@"retData"]);
        }else{
            NSLog(@"啦啦啦啦%@",[responseObject valueForKey:@"retMsg"]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
        NSLog(@"出错%@", error.localizedDescription);
    }];
}


@end
