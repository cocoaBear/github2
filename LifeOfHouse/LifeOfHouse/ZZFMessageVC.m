//
//  ZZFMessageVC.m
//  LifeOfHouse
//
//  Created by qf on 16/4/11.
//  Copyright (c) 2016年 qf. All rights reserved.
//

#import "ZZFMessageVC.h"
#import "UMSocial.h"
#import "ZZFMessageModel.h"
#import "TYAttributedLabel.h"


@interface ZZFMessageVC ()<UMSocialDataDelegate,UMSocialUIDelegate>

@property (nonatomic,strong)UIScrollView *scrollView;
//block数据
@property (nonatomic,strong)NSMutableArray *dataList;
//product数据
@property (nonatomic,strong)NSMutableArray *productArr;

@property (nonatomic, weak) TYAttributedLabel *label;

@end

@implementation ZZFMessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    初始化
    [self initUI];
//    获取网络数据
    [self loadData];
//    添加scrollView
    [self addScrollView];
    
//    分享
    [self didData];
}

-(void)initUI{
    _dataList = [NSMutableArray array];
    _collectArr = [NSMutableArray array];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)loadData{
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager GET:_urlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dic = responseObject;
        NSArray *arr1 = [dic objectForKey:@"data"];
        NSLog(@"%@",arr1);
        for (NSDictionary *dic1 in arr1) {
            NSDictionary *dict = [dic1 objectForKey:@"block"];
            ZZFMessageModel*model = [[ZZFMessageModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            [_dataList addObject:model];
        }
        // appendAttributedText
        [self addTextAttributedLabel];

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"获取数据失败");
    }];
}

#pragma mark - 视图
- (void)addScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
    [self.view addSubview:scrollView];
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView = scrollView;
}

- (void)addTextAttributedLabel{
    TYAttributedLabel *label = [[TYAttributedLabel alloc]initWithFrame:CGRectMake(10,10, CGRectGetWidth(self.view.frame) -20, 0)];
    [_scrollView addSubview:label];
    
    _label = label;

    for (ZZFMessageModel *model in _dataList) {
        if ([model.article rangeOfString:@"http"].location != NSNotFound) {
            NSArray *arr = [model.article componentsSeparatedByString:@"|"];
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, CGRectGetWidth(label.frame), 200)];
            [imageView sd_setImageWithURL:[NSURL URLWithString:arr[0]] placeholderImage:[UIImage imageNamed:@"icon_pic"]];
            [label appendView:imageView];
        }else{
            [label appendText: model.article];
        }
    }
    [label sizeToFit];
    [_scrollView setContentSize:CGSizeMake(0, CGRectGetMaxY(_label.frame)+10)];
}

#pragma mark - 分享
-(void)didData{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(self.view.bounds.size.width -60, self.view.bounds.size.height - 104, 40, 40);
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 10;
    [button setBackgroundImage:[UIImage imageNamed:@"shareto"] forState:UIControlStateNormal];
    
    [button setBackgroundColor:[UIColor whiteColor]];
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)didFinishGetUMSocialDataResponse:(UMSocialResponseEntity *)response{
    NSLog(@"%@",response);
}

-(void)btnClick:(UIButton *)sender{
    
    ZZFMessageModel *model = _dataList[0];
    
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"570f0aba67e58e97d7001f4c"
                                      shareText:model.article
                                     shareImage:[UIImage imageNamed:@"152"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,nil]
                                       delegate:self];
    
}

@end
