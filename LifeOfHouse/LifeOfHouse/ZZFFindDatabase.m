//
//  ZZFFindDatabase.m
//  LifeOfHouse
//
//  Created by qf on 16/4/10.
//  Copyright (c) 2016年 qf. All rights reserved.
//

#import "ZZFFindDatabase.h"

@interface ZZFFindDatabase ()

@property (nonatomic,strong)FMDatabase * database;

@end

@implementation ZZFFindDatabase

+(instancetype)shareDatabase{
    
    //  静态的指针
    static ZZFFindDatabase *single = nil;
    
    // 类似一个线程锁的效果
    static dispatch_once_t token;
    //  保证block内部的代码在整个应用程序当中只会执行一次
    dispatch_once(&token, ^{
        
        //判断可省略
        //new = alloc + init
        single = [ZZFFindDatabase new];
        
    });
    
    return single;
}
// 重写init方法
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //数据库路径
        NSString *databasePath = [NSHomeDirectory() stringByAppendingString:@"/Documents/find.rdb"];
        
        //创建并且打开数据库
        _database = [[FMDatabase alloc] initWithPath:databasePath];
        
        NSLog(@"databasePath = %@",databasePath);
        
        if (![_database open]) {
            NSLog(@"打开数据库失败");
        }
        //   starCurrentLabel expireDatetime  currentPriceLabel lastPrice
        //创建表
        if (![_database executeUpdate:@"create table if not exists ZZFFindList (products,pocUrl,logo,shopName,shopSlogon,shopUrl,tags)"]) {
            NSLog(@"创建表失败");
            
        }
        
    }
    return self;
}


-(void)setModel:(ZZFFindModel *)model{
    if (![self.database executeUpdate:@"insert into ZZFFindList (products,pocUrl,logo,shopName,shopSlogon,shopUrl,tags) values (?,?,?,?,?,?,?)",model.products,model.picUrl,model.logo,model.shopName,model.shopSlogon,model.shopUrl,model.tags]) {
        NSLog(@"插入失败");
    }
}


-(NSArray *)searchFromDatabase{
    
    FMResultSet *set = [self.database executeQuery:@"select * from ZZFNewList"];
    NSMutableArray *newArr = [NSMutableArray new];
    
    while ([set next]) {
        
        //实例化对象
        ZZFFindModel *model = [[ZZFFindModel alloc]init];
        model.products = [set objectForColumnName:@"products"];
        model.logo = [set stringForColumn:@"logo"];
        model.shopName = [set stringForColumn:@"shopName"];
        model.shopSlogon = [set stringForColumn:@"shopSlogon"];
        model.shopUrl = [set stringForColumn:@"shopUrl"];
        model.tags = [set objectForColumnName:@"tags"];
        [newArr addObject:model];
        
    }
    //返回加载完成的数据
    return newArr;
}

-(void)deleteFromDatase{
    if (![self.database executeUpdate:@"delete from ZZFNewList"]) {
        NSLog(@"删除失败");
    }
    
}


@end

