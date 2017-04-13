//
//  VideoModel.h
//  XGCircle
//
//  Created by xiaohui on 2017/4/5.
//  Copyright © 2017年 XIAOHUI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
//#import "UserBasicInfo.h"
#import "VideoResolution.h"

@interface VideoModel : BaseModel

//@property (nonatomic, strong) UserBasicInfo *userInfo; // 用户基本信息
//@property (nonatomic, assign) BOOL          collect;   // 收藏的状态

/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 描述 */
@property (nonatomic, copy) NSString *video_description;
/** 视频地址 */
@property (nonatomic, copy) NSString *playUrl;
/** 封面图 */
@property (nonatomic, copy) NSString *coverForFeed;
/** 视频分辨率的数组 */
@property (nonatomic, strong) NSMutableArray *playInfo;

@end
