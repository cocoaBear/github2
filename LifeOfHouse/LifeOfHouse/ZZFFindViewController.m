//
//  ZZFFindViewController.m
//  LifeOfHouse
//
//  Created by qf on 16/4/6.
//  Copyright (c) 2016年 qf. All rights reserved.
//

#import "ZZFFindViewController.h"
#import "ZZFFindCell.h"
#import "ZZFFindDatabase.h"
#import "ZZFFindSubCell.h"
#import "MJRefresh.h"
#import "ZZFFindSubVC.h"

@interface ZZFFindViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UITableView * myTableView;

@property (nonatomic,assign)int page;


@property (nonatomic,strong)NSMutableArray *dataList;

//@property (nonatomic,strong) UICollectionView *collectionView;


@end

@implementation ZZFFindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
    [self loadData];
    
    //    添加上下拉刷新
    [self addMJRefresh];
    //    数据库缓存
    [self getDataFormDataBase];
}


-(void)getDataFormDataBase{
    ZZFFindDatabase * single = [ZZFFindDatabase shareDatabase];
    
    [self.dataList addObjectsFromArray:[single searchFromDatabase]];
    [_myTableView reloadData];
}


-(void)addMJRefresh{
    __weak typeof(self) weakSelf = self;
    
    //    下拉刷新
    self.myTableView.header = [MJRefreshHeader headerWithRefreshingBlock:^{
        weakSelf.page = 0;
        [weakSelf loadData];
    }];
    
    
    
    //    上拉刷新
    self.myTableView.footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        weakSelf.page ++;
        [weakSelf loadData];
    }];
}

-(void)headerAddData{
    [self.myTableView reloadData];
    [self.myTableView.header endRefreshing];
}

-(void)footerAddData{
    
    [self.myTableView reloadData];
    [self.myTableView.footer endRefreshing];
}




-(void)loadData{
    
    __weak typeof(self) weakSelf = self;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[NSString stringWithFormat:L_FIND,_page] parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        ZZFFindDatabase *single = [ZZFFindDatabase shareDatabase];
        if (_page == 0) {
            _dataList = [NSMutableArray array];
            [single deleteFromDatase];
        }
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray * arr = dic[@"data"];
        for (NSDictionary * dict in arr) {
            
            ZZFFindModel *model = [[ZZFFindModel alloc]init];
            model.subArr = [NSMutableArray array];
            model.tagsArr = [NSMutableArray array];
            model.tags = dict[@"tags"];
            model.picUrl = dict[@"info"][@"picUrl"];
            model.logo = dict[@"logo"];
            model.products = dict[@"products"];
            model.shopName = dict[@"shopName"];
            model.shopSlogon = dict[@"shopSlogon"];
            model.shopUrl = dict[@"shopUrl"];

            for (NSDictionary *subDic in model.products) {
                ZZFFindSubModel *subModel = [[ZZFFindSubModel alloc]init];
                subModel.image = subDic[@"image"];
                subModel.itemid = subDic[@"itemid"];
                subModel.price = subDic[@"price"];
                subModel.title = subDic[@"title"];
                [model.subArr addObject:subModel];
            }
            for (NSDictionary *tagDic in model.tags) {
                ZZFFindTags *tag = [[ZZFFindTags alloc]init];
                [tag setValuesForKeysWithDictionary:tagDic];
                [model.tagsArr addObject:tag];
            }
            
            
            [_dataList addObject:model];
        }
        [_myTableView reloadData];
        // 结束上/下刷新
        if (weakSelf.page == 0) {
            [weakSelf.myTableView.header endRefreshing];
        }else{
            [weakSelf.myTableView.footer endRefreshing];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"数据获取失败");
    }];
}


-(void)initUI{
    
    _dataList = [NSMutableArray array];
    _page = 0;
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.title = @"发现好店";
    
    _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64 - 40) style:UITableViewStylePlain];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    _myTableView.rowHeight = 240;
    [self.view addSubview:_myTableView];
    
    [_myTableView registerNib:[UINib nibWithNibName:@"ZZFFindCell" bundle:nil] forCellReuseIdentifier:@"ZZFFindCell"];
    
}



#pragma mark - tableView的代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZZFFindCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ZZFFindCell"];
    ZZFFindModel *model = _dataList[indexPath.row];
    cell.model = model;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _subArray = [NSMutableArray array];
    _subArray = model.subArr;
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    cell.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(cell.decLabel.frame), cell.contentView.bounds.size.width,cell.contentView.bounds.size.height - CGRectGetMaxY(cell.decLabel.frame) - cell.scrollView.bounds.size.height -10) collectionViewLayout:layout];
    cell.collectionView.delegate = self;
    cell.collectionView.dataSource = self;
    [cell.collectionView registerNib:[UINib nibWithNibName:@"ZZFFindSubCell" bundle:nil] forCellWithReuseIdentifier:@"ZZFFindSubCell"];
    cell.collectionView.backgroundColor = [UIColor whiteColor];
    [cell addSubview:cell.collectionView];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZZFFindSubVC *vc = [[ZZFFindSubVC alloc]init];
    ZZFFindModel *model = _dataList[indexPath.row];
    vc.urlStr = model.shopUrl;
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _subArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZZFFindSubCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZZFFindSubCell" forIndexPath:indexPath];

    ZZFFindSubModel *model = _subArray[indexPath.row];
    cell.model = model;
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.view.bounds.size.width/3 -10,100);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 0, 0);
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
