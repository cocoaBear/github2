//
//  ZZFNewCell.h
//  LifeOfHouse
//
//  Created by qf on 16/4/6.
//  Copyright (c) 2016年 qf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZZFNewModel.h"
@interface ZZFNewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic,strong)ZZFNewModel * model;

@end
