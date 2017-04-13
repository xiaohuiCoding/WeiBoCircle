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
    [rightView al_layRightOf:leftView distance:0];
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
    
    // middle separate view
    UIView *middleSeparateView = [[UIView alloc] initWithFrame:CGRectZero];
    middleSeparateView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:middleSeparateView];
    [middleSeparateView al_alignSuperHorizontalCenter];
    [middleSeparateView al_alignSuperVerticalCenter];
    [middleSeparateView al_setSize:CGSizeMake(1, 20)];
}

- (void)setIsLike:(BOOL)isLike {
    
    self.likeButton.isLike = isLike;
}

- (void)setLikeAmount:(int)likeAmount {
    self.likeButton.amount = likeAmount;
}

- (void)setCommentAmount:(int)commentAmount {
    self.commentButton.amount = commentAmount;
}

- (void)updateFooter {
    
    self.isLike = YES;
    self.likeAmount = 999;
    self.commentAmount = 666;
}

//- (void)updateFooter {
//    
//}

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
