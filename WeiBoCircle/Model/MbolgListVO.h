//
//  MbolgListVO.h
//  WeiBoCircle
//
//  Created by xiaohui on 2017/4/13.
//  Copyright © 2017年 XIAOHUI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MbolgListVO : NSObject

@property (nonatomic, assign) long mbolgId; // 微博id
@property (nonatomic, copy) NSString *type; // 类型，01-图集，02-视频
@property (nonatomic, copy) NSString *content; // 正文
@property (nonatomic, strong) NSArray<NSString *> *appendixs; // 图集url/视频url
@property (nonatomic, assign) int likeCount; // 点赞数
@property (nonatomic, assign) int commentCount; // 评论数
@property (nonatomic, assign) int favor; // 0-未收藏，1-已收藏
@property (nonatomic, assign) int like; // 0-未点赞，1-已点赞
@property (nonatomic, copy) NSString *publishTime; // 发布时间
@property (nonatomic, assign) long creator; // 作者id
@property (nonatomic, copy) NSString *creatorName; // 作者姓名
@property (nonatomic, copy) NSString *avatar; // 头像url

@end
