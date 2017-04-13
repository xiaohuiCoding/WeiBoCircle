//
//  CellVideoContent.h
//  XGCircle
//
//  Created by xiaohui on 2017/4/5.
//  Copyright © 2017年 XIAOHUI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoModel.h"

/** 播放按钮block */
typedef void(^PlayBtnCallBackBlock)(UIButton *);

@interface CellVideoContent : UIView

@property (nonatomic, strong) UIImageView *picView;
//@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIButton *playBtn;

/** model */
@property (nonatomic, strong) VideoModel *model;

/** 播放按钮block */
@property (nonatomic, copy) PlayBtnCallBackBlock playBlock;

@end
