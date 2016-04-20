//
//  ZZFFindSubCell.h
//  LifeOfHouse
//
//  Created by qf on 16/4/7.
//  Copyright (c) 2016年 qf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZZFFindSubModel.h"
@interface ZZFFindSubCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (nonatomic,strong)ZZFFindSubModel *model;

@end
