//
//  ZZFNewDatabase.h
//  LifeOfHouse
//
//  Created by qf on 16/4/7.
//  Copyright (c) 2016年 qf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZFNewModel.h"
@interface ZZFNewDatabase : NSObject

+(instancetype)shareDatabase;

@property (nonatomic,strong)ZZFNewModel *model;
-(NSArray *)searchFromDatabase;
-(void)deleteFromDatase;
@end
