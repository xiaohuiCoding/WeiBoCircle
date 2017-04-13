//
//  CellFooter.h
//  XGCircle
//
//  Created by xiaohui on 2017/4/5.
//  Copyright © 2017年 XIAOHUI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellResponseButton.h"

typedef void (^LikeButtonClicked)();
typedef void (^CommentButtonClicked)();

@interface CellFooter : UIView

@property (nonatomic, strong) CellResponseButton *likeButton;
@property (nonatomic, strong) CellResponseButton *commentButton;

@property (nonatomic, copy) LikeButtonClicked    likeButtonClicked;
@property (nonatomic, copy) CommentButtonClicked commentButtonClicked;

@property (nonatomic, assign) BOOL isLike;
@property (nonatomic, assign) int  likeAmount;
@property (nonatomic, assign) int  commentAmount;

- (void)updateFooter;

@end
