//
//  ZZFDetailCell.h
//  LifeOfHouse
//
//  Created by qf on 16/4/10.
//  Copyright (c) 2016年 qf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZZFDetailModel.h"
@interface ZZFDetailCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *decLabel;

@property (nonatomic,strong)ZZFDetailModel *model;
@end
