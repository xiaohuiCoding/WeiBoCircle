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
    
    UIView *leftFunctionView = [[UIView alloc] initWithFrame:CGRectZero];
    [self addSubview:leftFunctionView];
    [leftFunctionView al_alignSuperLeft:0];
    [leftFunctionView al_alignSuperUpon:0];
    [leftFunctionView al_setSize:CGSizeMake(DSWidth / 2, FunctionViewHeight)];
    
    UIView *rightFunctionView = [[UIView alloc] initWithFrame:CGRectZero];
    [self addSubview:rightFunctionView];
    [rightFunctionView al_layRightOf:leftFunctionView distance:0];
    [rightFunctionView al_alignSuperUpon:0];
    [rightFunctionView al_setSize:CGSizeMake(DSWidth / 2, FunctionViewHeight)];
    
    self.commentButton = [[CellResponseButton alloc] initWithFrame:CGRectZero pictureType:Comment];
    [self.commentButton addTarget:self action:@selector(writeComment) forControlEvents:UIControlEventTouchUpInside];
    [leftFunctionView addSubview:self.commentButton];
    [self.commentButton al_alignSuperHorizontalCenter];
    [self.commentButton al_alignSuperVerticalCenter];
    
    self.likeButton = [[CellResponseButton alloc] initWithFrame:CGRectZero pictureType:Like];
    [self.likeButton addTarget:self action:@selector(thumbUp) forControlEvents:UIControlEventTouchUpInside];
    [rightFunctionView addSubview:self.likeButton];
    [self.likeButton al_alignSuperHorizontalCenter];
    [self.likeButton al_alignSuperVerticalCenter];
    
    // separate line between function views
    UIView *separateLine = [[UIView alloc] initWithFrame:CGRectZero];
    separateLine.backgroundColor = [UIColor lightGrayColor];
    [rightFunctionView addSubview:separateLine];
    [separateLine al_alignSuperLeft:0];
    [separateLine al_alignSuperVerticalCenter];
    [separateLine al_setSize:CGSizeMake(1, SeparateLineHeight)];
    
    // top separate view
    UIView *topLine = [[UIView alloc] initWithFrame:CGRectZero];
    topLine.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:topLine];
    [topLine al_alignSuperLeft:0];
    [topLine al_alignSuperUpon:0];
    [topLine al_setSize:CGSizeMake(DSWidth, TopLineHeight)];
    
    // bottom line under function views
    UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectZero];
    bottomLine.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:bottomLine];
    [bottomLine al_alignSuperLeft:0];
    [bottomLine al_layBelowOf:leftFunctionView distance:0];
    [bottomLine al_setSize:CGSizeMake(DSWidth, BottomLineHeight)];
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
