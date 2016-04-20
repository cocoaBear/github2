//
//  ZZFDetailClassVC.m
//  LifeOfHouse
//
//  Created by qf on 16/4/9.
//  Copyright (c) 2016年 qf. All rights reserved.
//

#import "ZZFDetailClassVC.h"
#import "ZZFDetailCell.h"
#import "ZZFDetailModel.h"
#import "ZZFDetailDatabase.h"
#import "MJRefresh.h"
#import "ZZFMessageVC.h"

@interface ZZFDetailClassVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
//表格
@property (nonatomic,strong)UICollectionView *collectionView;
//网络数据
@property (nonatomic,strong)NSMutableArray *dataArr;
//标题
@property (nonatomic,strong)NSMutableArray *titleArr;
@property (nonatomic,assign)int page;

@end

@implementation ZZFDetailClassVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArr = [NSMutableArray array];
    
    [self createTitle];
//    获取网络数据
    [self loadData];
//    创建表格
    [self initUI];
    
    //    添加上下拉刷新
    [self addMJRefresh];
    //    数据库缓存
    [self getDataFormDataBase];
}

-(void)getDataFormDataBase{
    ZZFDetailDatabase * single = [ZZFDetailDatabase shareDatabase];
    
    [self.dataArr addObjectsFromArray:[single searchFromDatabase]];
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



-(void)createTitle{
    _titleArr = [[NSMutableArray alloc]initWithObjects:@"编辑精选",@"装修案例",@"攻略",@"装修清单",@"家饰",@"迷你户型",@"小户型",@"地中海",@"宜家",@"现代",@"田园",@"美式",@"欧式",@"客厅",@"玄关",@"卧室",@"儿童房",@"厨房",@"餐厅",@"卫浴间",@"阳台",@"书房",@"其他", nil];
    self.title = _titleArr[self.num];
    _page = 0;
}

-(void)loadData{
    __weak typeof(self) weakself = self;

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *str = [NSString stringWithFormat:CLASS,_page];
    [manager GET:[NSString stringWithFormat:@"%@%@",str,_urlStr] parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        ZZFDetailDatabase *single = [ZZFDetailDatabase shareDatabase];
        if (weakself.page == 0) {
            weakself.dataArr = [NSMutableArray array];
            [single deleteFromDatase];
        }
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *array = [dic objectForKey:@"data"];
        for (NSDictionary *dict in array) {
            
            ZZFDetailModel *model = [[ZZFDetailModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            [_dataArr addObject:model];
        }
        [_collectionView reloadData];
        // 结束上/下刷新
        if (weakself.page == 0) {
            [weakself.collectionView.header endRefreshing];
        }else{
            [weakself.collectionView.footer endRefreshing];
        }

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"网络数据获取失败");
    }];
}

-(void)initUI{
    self.automaticallyAdjustsScrollViewInsets = NO;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height -64 -40) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"ZZFDetailCell" bundle:nil] forCellWithReuseIdentifier:@"ZZFDetailCell"];

}


#pragma mark - collectionView的代理方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZZFDetailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZZFDetailCell" forIndexPath:indexPath];
    ZZFDetailModel *model = _dataArr[indexPath.row];
    cell.model = model;
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"-------");
    return CGSizeMake(self.view.bounds.size.width/2 -20, self.view.bounds.size.width/2 +20);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 10, 10, 10);
}



#pragma mark - 选择CELL
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ZZFMessageVC * vc = [[ZZFMessageVC alloc]init];
    ZZFDetailModel *model = _dataArr[indexPath.row];
    NSString * urlStr = [NSString stringWithFormat:DETAIL_URL,model.albumId];
    vc.urlStr = [NSString stringWithFormat:@"%@%@",urlStr,DETAIL_STR];
    [self.navigationController pushViewController:vc animated:YES];
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
