//
//  CellHeader.h
//  XGCircle
//
//  Created by xiaohui on 2017/4/5.
//  Copyright © 2017年 XIAOHUI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserBasicInfo.h"

typedef void (^AvatarTapped)();
typedef void (^CollectButtonClicked)();

@interface CellHeader : UIView

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel     *nameLabel;
@property (nonatomic, strong) UILabel     *commitTimeLabel;
@property (nonatomic, strong) UIButton    *collectButton;

@property (nonatomic, strong) NSString      *userId;
@property (nonatomic, strong) UserBasicInfo *userInfo;
@property (nonatomic, assign) BOOL          collect;

@property (nonatomic, copy) AvatarTapped          avatarTapped;
@property (nonatomic, copy) CollectButtonClicked  collectButtonClicked;

- (void)updateHeaderWithDeadData;

@end
