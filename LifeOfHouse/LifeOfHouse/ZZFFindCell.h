//
//  ZZFFindCell.h
//  LifeOfHouse
//
//  Created by qf on 16/4/7.
//  Copyright (c) 2016年 qf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZZFFindModel.h"
@interface ZZFFindCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic,strong)ZZFFindModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *decLabel;

@property (nonatomic,strong) UICollectionView *collectionView;



@property (nonatomic,strong)NSMutableArray *tagsArr;

@end
