
//
//  ZZFMessageModel.m
//  LifeOfHouse
//
//  Created by qf on 16/4/12.
//  Copyright (c) 2016年 qf. All rights reserved.
//

#import "ZZFMessageModel.h"

@implementation ZZFMessageModel
{
    CGFloat _cellHeight;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}


-(CGFloat)cellHeight{
    
    if ([self.article hasPrefix:@"htttp://"]) {
        _cellHeight = 200;
        return _cellHeight;
    }else{
    // 文字的最大尺寸
    CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 2* 10, MAXFLOAT);
    // 计算文字的高度
    CGFloat textH = [self.article boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16]} context:nil].size.height;
    // c文字部分的高度
    _cellHeight = textH + 10;
        return _cellHeight;
    }
    
    
}




@end
