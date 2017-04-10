//
//  Cell.m
//  XGCircle
//
//  Created by xiaohui on 2017/4/5.
//  Copyright © 2017年 XIAOHUI. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (void)updateWithModel:(BaseModel *)model {}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    //选中cell后无样式变化
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

@end
