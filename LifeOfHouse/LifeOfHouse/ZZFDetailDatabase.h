//
//  ZZFDetailDatabase.h
//  LifeOfHouse
//
//  Created by qf on 16/4/10.
//  Copyright (c) 2016年 qf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZFDetailModel.h"
@interface ZZFDetailDatabase : NSObject

+(instancetype)shareDatabase;

@property (nonatomic,strong)ZZFDetailModel *model;
-(NSArray *)searchFromDatabase;
-(void)deleteFromDatase;

@end
