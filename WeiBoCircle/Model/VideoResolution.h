//
//  VideoResolution.h
//  WeiBoCircle
//
//  Created by xiaohui on 2017/4/13.
//  Copyright © 2017年 XIAOHUI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoResolution : NSObject

@property (nonatomic, assign) NSInteger height;
@property (nonatomic, assign) NSInteger width;
@property (nonatomic, copy  ) NSString  *name;
@property (nonatomic, copy  ) NSString  *type;
@property (nonatomic, copy  ) NSString  *url;

@end
