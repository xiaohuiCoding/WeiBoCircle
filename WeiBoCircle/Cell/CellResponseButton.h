//
//  CellResponseButton.h
//  XGCircle
//
//  Created by xiaohui on 2017/4/5.
//  Copyright © 2017年 XIAOHUI. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PictureType) {
    Like = 0, // 点赞
    Comment   // 评论
};

@interface CellResponseButton : UIButton

@property (nonatomic, strong) UIImageView *customImageView;
@property (nonatomic, strong) UILabel     *amountLabel;

@property (nonatomic, assign) PictureType picType;

@property (nonatomic, assign) BOOL isLike;
@property (nonatomic, assign) int  amount;

@end
