//
//  ZZFFindCell.m
//  LifeOfHouse
//
//  Created by qf on 16/4/7.
//  Copyright (c) 2016年 qf. All rights reserved.
//

#import "ZZFFindCell.h"
#import "ZZFFindSubCell.h"
#import "ZZFFindViewController.h"
#import "ZZFFindSubVC.h"

@interface ZZFFindCell ()<UIScrollViewDelegate>


@end

@implementation ZZFFindCell


-(void)setModel:(ZZFFindModel *)model{
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.picUrl] placeholderImage:[UIImage imageNamed:@"taobao"]];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.shopUrl]];
    self.titleLabel.text = model.shopName;
    self.decLabel.text = model.shopSlogon;
}


//重写ScollView
-(void)setScollView:(UIScrollView *)scollView{
    _scrollView.delegate = self;
    for (int i = 0; i <self.tagsArr.count; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        int page = self.window.bounds.size.width/i*50;
        if (page >= 1) {
            button.frame = CGRectMake(50 * i, 0, 50, 20);
        }else{
            button.frame = CGRectMake(50 *(i - (self.window.bounds.size.width/50) +1), 30, 50, 20);
        }
        
        [button setTitle:self.tagsArr[i] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor colorWithRed:240/256.0 green:240/256.0 blue:240/256.0 alpha:1.0]];
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:button];
            }
    [self.contentView addSubview:_scrollView];
}

-(void)btnClick:(UIButton *)sender{
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)pushInNextPage:(id)sender {
    
}

@end
