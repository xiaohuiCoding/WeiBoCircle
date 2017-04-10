//
//  LastestModel.h
//  XGCircle
//
//  Created by xiaohui on 2017/4/5.
//  Copyright © 2017年 XIAOHUI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
#import "UserBasicInfo.h"

@interface LastestModel : BaseModel

@property (nonatomic, strong) UserBasicInfo *userInfo; // 用户基本信息
@property (nonatomic, assign) BOOL          collect;   // 收藏的状态

@end
