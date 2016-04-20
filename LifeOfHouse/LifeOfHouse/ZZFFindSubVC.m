//
//  ZZFFindSubVC.m
//  LifeOfHouse
//
//  Created by qf on 16/4/13.
//  Copyright (c) 2016年 qf. All rights reserved.
//

#import "ZZFFindSubVC.h"

@interface ZZFFindSubVC ()

@end

@implementation ZZFFindSubVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height )];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:_urlStr]];
    [webView loadRequest:request];
    [self.view addSubview:webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
