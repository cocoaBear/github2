//
//  ZZFClassViewController.m
//  LifeOfHouse
//
//  Created by qf on 16/4/6.
//  Copyright (c) 2016年 qf. All rights reserved.
//

#import "ZZFClassViewController.h"
#import "ZZFClassCell.h"
#import "ZZFDetailClassVC.h"
@interface ZZFClassViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UICollectionView *collectionView;
//图片数据
@property (nonatomic,strong)NSMutableArray * dataList;
//标题数据
@property (nonatomic,strong)NSMutableArray * titleList;

@end

@implementation ZZFClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataList = [NSMutableArray array];
    _titleList = [NSMutableArray array];
    [self getData];
    
    [self createUI];
}



-(void)getData{
    _dataList = [[NSMutableArray alloc]initWithObjects:@"bjjx",@"jj-zxsl",@"jj-gonglue",@"jj-zxqd",@"jj-jiashi",@"jj-mnhx",@"jj-xhx",@"jj-dzh",@"jj-yijia",@"jj-xdjy",@"jj-tianyuan",@"jj-meishi",@"jj-oushi",@"jj-keting",@"jj-xuanguan",@"jj-woshi",@"jj-etf",@"jj-chufang",@"jj-canting",@"jj-wyj",@"jj-yangtai",@"jj-shufang",@"jj-qita",nil];
    _titleList = [[NSMutableArray alloc]initWithObjects:@"编辑精选",@"装修案例",@"攻略",@"装修清单",@"家饰",@"迷你户型",@"小户型",@"地中海",@"宜家",@"现代",@"田园",@"美式",@"欧式",@"客厅",@"玄关",@"卧室",@"儿童房",@"厨房",@"餐厅",@"卫浴间",@"阳台",@"书房",@"其他", nil];
}

-(void)createUI{
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.title = @"分类";
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64 - 40) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"ZZFClassCell" bundle:nil] forCellWithReuseIdentifier:@"ZZFClassCell"];
}


#pragma mark - collectionView代理方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataList.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ZZFClassCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZZFClassCell" forIndexPath:indexPath];
    cell.iconView.image = [UIImage imageNamed:_dataList[indexPath.row]];
    cell.iconView.layer.masksToBounds = YES;
    cell.iconView.layer.cornerRadius =(self.view.bounds.size.width/3.0 - 20)/2 - 10;
    cell.label.text = _titleList[indexPath.row];
    
    return cell;
                           
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.view.bounds.size.width/3.0 - 10,self.view.bounds.size.width/3.0 + 20 );
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 0, 0);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *array = @[CLASS_1,CLASS_2,CLASS_3,CLASS_4,CLASS_5,CLASS_6,CLASS_7,CLASS_8,CLASS_9,CLASS_10,CLASS_11,CLASS_12,CLASS_13,CLASS_14,CLASS_15,CLASS_16,CLASS_17,CLASS_18,CLASS_19,CLASS_20,CLASS_21,CLASS_22,CLASS_23];
    ZZFDetailClassVC *vc = [[ZZFDetailClassVC alloc]init];
    vc.urlStr = array[indexPath.row];
    vc.num = (int)indexPath.row;
    [self.navigationController pushViewController:vc animated:YES];
}



@end
