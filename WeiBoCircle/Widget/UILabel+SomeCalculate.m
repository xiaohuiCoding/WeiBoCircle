//
//  UILabel+SomeCalculate.m
//  XGCircle
//
//  Created by xiaohui on 2017/4/6.
//  Copyright © 2017年 XIAOHUI. All rights reserved.
//

#import "UILabel+SomeCalculate.h"

@implementation UILabel (SomeCalculate)

- (CGFloat)finalWidth {
    if (self.text) {
        NSString *str = [[NSString alloc] initWithUTF8String:[self.text cStringUsingEncoding:NSUTF8StringEncoding]];
        CGRect rect = [str boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, self.bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.font} context:nil];
        return rect.size.width;
    }
    return 0;
}

- (CGFloat)finalHeight {
    if (self.text) {
        NSString *str = [[NSString alloc] initWithUTF8String:[self.text cStringUsingEncoding:NSUTF8StringEncoding]];
        CGRect rect = [str boundingRectWithSize:CGSizeMake(self.bounds.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.font} context:nil];
        return rect.size.height;
    }
    return 0;
}

@end
