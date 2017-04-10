//
//  UserBasicInfo.h
//  XGCircle
//
//  Created by xiaohui on 2017/4/7.
//  Copyright © 2017年 XIAOHUI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface UserBasicInfo : BaseModel

@property (nonatomic, copy) NSString *userId;     // 用户id
@property (nonatomic, copy) NSString *avatar;     // 头像链接
@property (nonatomic, copy) NSString *name;       // 名字
@property (nonatomic, copy) NSString *commitTime; // 提交时间

@end
