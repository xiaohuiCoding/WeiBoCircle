//
//  CellFooter.m
//  XGCircle
//
//  Created by xiaohui on 2017/4/5.
//  Copyright © 2017年 XIAOHUI. All rights reserved.
//

#import "CellFooter.h"

@implementation CellFooter

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectZero];
    [self addSubview:leftView];
    [leftView al_alignSuperLeft:0];
    [leftView al_alignSuperUpon:0];
    [leftView al_setSize:CGSizeMake(DSWidth / 2, CellFooterHeight)];
    
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectZero];
    [self addSubview:rightView];
    [rightView al_alignSuperLeft:DSWidth / 2];
    [rightView al_alignSuperUpon:0];
    [rightView al_setSize:CGSizeMake(DSWidth / 2, CellFooterHeight)];
    
    // 点赞按钮
    self.likeButton = [[CellResponseButton alloc] initWithFrame:CGRectZero pictureType:Like];
    [self.likeButton addTarget:self action:@selector(thumbUp) forControlEvents:UIControlEventTouchUpInside];
    [rightView addSubview:self.likeButton];
    [self.likeButton al_alignSuperHorizontalCenter];
    [self.likeButton al_alignSuperVerticalCenter];
    
    // 评论按钮
    self.commentButton = [[CellResponseButton alloc] initWithFrame:CGRectZero pictureType:Comment];
    [self.commentButton addTarget:self action:@selector(writeComment) forControlEvents:UIControlEventTouchUpInside];
    [leftView addSubview:self.commentButton];
    [self.commentButton al_alignSuperHorizontalCenter];
    [self.commentButton al_alignSuperVerticalCenter];
}

- (void)setIsLike:(BOOL)isLike {
    
    self.likeButton.isLike = isLike;
}

- (void)setAmount:(int)amount {
    
    self.likeButton.amount = amount;
    self.commentButton.amount = amount;
}

- (void)updateFooter {
    
    self.isLike = YES;
    self.amount = 999;
}

- (void)thumbUp {
    
    NSLog(@"点赞或取消点赞！");
    
    if (self.likeButtonClicked) {
        self.likeButtonClicked();
    }
}

- (void)writeComment {
    
    NSLog(@"写评论！");
    
    if (self.commentButtonClicked) {
        self.commentButtonClicked();
    }
}

@end
