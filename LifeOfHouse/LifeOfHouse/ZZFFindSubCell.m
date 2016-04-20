//
//  ZZFFindSubCell.m
//  LifeOfHouse
//
//  Created by qf on 16/4/7.
//  Copyright (c) 2016年 qf. All rights reserved.
//

#import "ZZFFindSubCell.h"

@implementation ZZFFindSubCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(ZZFFindSubModel *)model{
    [self.myImageView sd_setImageWithURL:[NSURL URLWithString:model.image]];
        
    self.priceLabel.text = [NSString stringWithFormat:@"¥%@",model.price];
    
}


//-(instancetype)init{
//    self.myImageView.frame = CGRectMake(0, 0, self.window.bounds.size.width, self.window.bounds.size.width);
//    self.priceLabel.frame = CGRectMake(0, self.window.bounds.size.width, self.window.bounds.size.width, 20);
//    return self;
//}

@end
