//
//  ZZFDetailCell.m
//  LifeOfHouse
//
//  Created by qf on 16/4/10.
//  Copyright (c) 2016年 qf. All rights reserved.
//

#import "ZZFDetailCell.h"

@implementation ZZFDetailCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(ZZFDetailModel *)model{
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    

    _decLabel.text = model.title;
}

@end
