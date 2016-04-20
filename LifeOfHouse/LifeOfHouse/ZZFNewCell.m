//
//  ZZFNewCell.m
//  LifeOfHouse
//
//  Created by qf on 16/4/6.
//  Copyright (c) 2016年 qf. All rights reserved.
//

#import "ZZFNewCell.h"

@implementation ZZFNewCell

-(void)setModel:(ZZFNewModel *)model{
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    _titleLabel.text = model.title;
    
}

@end
