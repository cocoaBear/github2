//
//  ZZFDetailDatabase.m
//  LifeOfHouse
//
//  Created by qf on 16/4/10.
//  Copyright (c) 2016年 qf. All rights reserved.
//

#import "ZZFDetailDatabase.h"

@interface ZZFDetailDatabase ()

@property (nonatomic,strong)FMDatabase * database;

@end

@implementation ZZFDetailDatabase

+(instancetype)shareDatabase{
    
    //  静态的指针
    static ZZFDetailDatabase *single = nil;
    
    // 类似一个线程锁的效果
    static dispatch_once_t token;
    //  保证block内部的代码在整个应用程序当中只会执行一次
    dispatch_once(&token, ^{
        
        //判断可省略
        //new = alloc + init
        single = [ZZFDetailDatabase new];
        
    });
    
    return single;
}
// 重写init方法
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //数据库路径
        NSString *databasePath = [NSHomeDirectory() stringByAppendingString:@"/Documents/detailClass.rdb"];
        
        //创建并且打开数据库
        _database = [[FMDatabase alloc] initWithPath:databasePath];
        
        NSLog(@"databasePath = %@",databasePath);
        
        if (![_database open]) {
            NSLog(@"打开数据库失败");
        }
        //   starCurrentLabel expireDatetime  currentPriceLabel lastPrice
        //创建表
        if (![_database executeUpdate:@"create table if not exists ZZFDetailList (album_type,albumId,img,title)"]) {
            NSLog(@"创建表失败");
            
        }
        
    }
    return self;
}


-(void)setModel:(ZZFDetailModel *)model{
    if (![self.database executeUpdate:@"insert into ZZFDetailList (album_type,albumId,img,title) values (?,?,?,?)",model.album_type,model.albumId,model.img,model.title]) {
        NSLog(@"插入失败");
    }
}


-(NSArray *)searchFromDatabase{
    
    FMResultSet *set = [self.database executeQuery:@"select * from ZZFDetailList"];
    NSMutableArray *newArr = [NSMutableArray new];
    
    while ([set next]) {
        
        //实例化对象
        ZZFDetailModel * model = [ZZFDetailModel new];
        model.album_type = [set stringForColumn:@"album_type"];
        model.albumId = [set stringForColumn:@"albumId"];
        model.img = [set stringForColumn:@"img"];
        model.title = [set stringForColumn:@"title"];
        
        [newArr addObject:model];
        
    }
    //返回加载完成的数据
    return newArr;
}

-(void)deleteFromDatase{
    if (![self.database executeUpdate:@"delete from ZZFDetailList"]) {
        NSLog(@"删除失败");
    }
    
}

@end
