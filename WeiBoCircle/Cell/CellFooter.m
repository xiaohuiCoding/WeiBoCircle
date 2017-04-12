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
    
    // 点赞按钮
    self.likeButton = [[CellResponseButton alloc] initWithFrame:CGRectZero pictureType:Like];
    [self.likeButton addTarget:self action:@selector(thumbUp) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.likeButton];
    [self.likeButton al_alignSuperRight:10];
    [self.likeButton al_alignSuperVerticalCenter];
    
    // 评论按钮
    self.commentButton = [[CellResponseButton alloc] initWithFrame:CGRectZero pictureType:Comment];
    [self.commentButton addTarget:self action:@selector(writeComment) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.commentButton];
    [self.commentButton al_alignSuperVerticalCenter];
    [self.commentButton al_layLeftOf:self.likeButton distance:100];
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
    self.amount = 0;
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
