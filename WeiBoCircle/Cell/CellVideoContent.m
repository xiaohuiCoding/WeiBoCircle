//
//  CellVideoContent.m
//  XGCircle
//
//  Created by xiaohui on 2017/4/5.
//  Copyright © 2017年 XIAOHUI. All rights reserved.
//

#import "CellVideoContent.h"

@implementation CellVideoContent

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    
    self.picView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.picView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"loading_bgView"]];
//    self.picView.tag = 101;
    self.picView.userInteractionEnabled = true;
    [self addSubview:self.picView];
    [self.picView al_alignSuperHorizontalCenter];
    [self.picView al_alignSuperVerticalCenter];
    [self.picView al_setSize:CGSizeMake(DSWidth, CellVideoContentHeight)];
    
    
    // 代码添加playerBtn到imageView上
    self.playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.playBtn setImage:[UIImage imageNamed:@"video_list_cell_big_icon"] forState:UIControlStateNormal];
    [self.playBtn addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
    [self.picView addSubview:self.playBtn];
    [self.playBtn al_alignSuperHorizontalCenter];
    [self.playBtn al_alignSuperVerticalCenter];
}

- (void)setModel:(VideoModel *)model {
    
    [self.picView sd_setImageWithURL:[NSURL URLWithString:model.coverForFeed] placeholderImage:[UIImage imageNamed:@"loading_bgView"]];
//    self.titleLabel.text = model.title;
}

- (void)play:(UIButton *)sender {
    if (self.playBlock) {
        self.playBlock(sender);
    }
}

@end
