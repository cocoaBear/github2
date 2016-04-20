//
//  ZZFFindModel.h
//  LifeOfHouse
//
//  Created by qf on 16/4/7.
//  Copyright (c) 2016年 qf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZFFindSubModel.h"
#import "ZZFFindTags.h"
@interface ZZFFindModel : NSObject


@property (nonatomic,strong)NSArray *products;

@property (nonatomic,strong)NSString *picUrl;

@property (nonatomic,strong)NSString *logo;

@property (nonatomic,strong)NSString *shopName;

@property (nonatomic,strong)NSString *shopSlogon;

@property (nonatomic,strong)NSString *shopUrl;

@property (nonatomic,strong)NSArray *tags;

//@property (nonatomic,strong)ZZFFindSubModel *subModel;
//
//@property (nonatomic,strong)ZZFFindTags * tagsModel;

@property (nonatomic,strong)NSMutableArray *subArr;

@property (nonatomic,strong)NSMutableArray *tagsArr;

@end



