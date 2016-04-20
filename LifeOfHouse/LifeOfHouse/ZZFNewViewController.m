//
//  ZZFNewViewController.m
//  LifeOfHouse
//
//  Created by qf on 16/4/6.
//  Copyright (c) 2016年 qf. All rights reserved.
//

#import "ZZFNewViewController.h"
#import "ZZFNewModel.h"
#import "ZZFNewCell.h"
#import "MJRefresh.h"
#import "ZZFNewDatabase.h"
#import "ZZFMessageVC.h"
@interface ZZFNewViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>
@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong)NSMutableArray *dataList;

@property (nonatomic,assign)int page;



@end

@implementation ZZFNewViewController


-(NSMutableArray *)dataList{
    if (_dataList == nil) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _page = 0;
//    创建UI
    [self createUI];
    
    
    //    获取网络数据
    [self loadData];
//    添加上下拉刷新
    [self addMJRefresh];
//    数据库缓存
    [self getDataFormDataBase];
    
}


-(void)getDataFormDataBase{
    ZZFNewDatabase * single = [ZZFNewDatabase shareDatabase];
    
    [self.dataList addObjectsFromArray:[single searchFromDatabase]];
    [_collectionView reloadData];
}


-(void)addMJRefresh{
    __weak typeof(self) weakSelf = self;
    
//    下拉刷新
    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.page = 0;
        [weakSelf loadData];
    }];
    
    
    
//    上拉刷新
    self.collectionView.footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        weakSelf.page ++;
        [weakSelf loadData];
    }];
}

-(void)headerAddData{
    [self.collectionView reloadData];
    [self.collectionView.header endRefreshing];
}

-(void)footerAddData{
    
    [self.collectionView reloadData];
    [self.collectionView.footer endRefreshing];
}


#pragma mark - collectionView代理方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"%@",_dataList);
    return _dataList.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ZZFNewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZZFNewCell" forIndexPath:indexPath];
    ZZFNewModel * model = _dataList[indexPath.row];
    cell.model = model;
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(self.view.bounds.size.width/2 - 10,self.view.bounds.size.width/2 *1.2 );
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ZZFMessageVC *vc = [[ZZFMessageVC alloc]init];
    ZZFNewModel *model = _dataList[indexPath.row];
    NSString * urlStr = [NSString stringWithFormat:DETAIL_URL,model.albumId];
    vc.urlStr = [NSString stringWithFormat:@"%@%@",urlStr,DETAIL_STR];
    [self.navigationController pushViewController:vc animated:YES];
}




#pragma mark - 获取网络数据
-(void)loadData{
    __weak typeof(self) weakself = self;
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[NSString stringWithFormat:L_NEWURL,_page] parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        ZZFNewDatabase *single = [ZZFNewDatabase shareDatabase];

        if (weakself.page == 0) {
            weakself.dataList = [NSMutableArray array];
            [single deleteFromDatase];
        }

        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray * arr = dic[@"data"];
        for (NSDictionary *dict in arr) {
            ZZFNewModel * model = [[ZZFNewModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            [_dataList addObject:model];
        }
        [weakself.collectionView reloadData];
        // 结束上/下刷新
        if (weakself.page == 0) {
            [weakself.collectionView.header endRefreshing];
        }else{
            [weakself.collectionView.footer endRefreshing];
        }
    
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"获取数据失败");
    }];
}


//创建UI
-(void)createUI{
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.title = @"家居生活馆";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64 -40) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_collectionView];
    _dataList = [NSMutableArray array];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"ZZFNewCell" bundle:nil] forCellWithReuseIdentifier:@"ZZFNewCell"];
    
    
}

@end
