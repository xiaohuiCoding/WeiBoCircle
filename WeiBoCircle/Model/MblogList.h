//
//  MblogList.h
//  WeiBoCircle
//
//  Created by xiaohui on 2017/4/13.
//  Copyright © 2017年 XIAOHUI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MbolgListVO.h"

@interface MblogList : NSObject

@property (nonatomic, strong) NSArray<MbolgListVO *> *list; // 微博列表
@property (nonatomic, assign) int next; // 下一页起始id

@end
