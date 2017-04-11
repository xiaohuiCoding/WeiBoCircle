//
//  CellResponseButton.m
//  XGCircle
//
//  Created by xiaohui on 2017/4/5.
//  Copyright © 2017年 XIAOHUI. All rights reserved.
//

#import "CellResponseButton.h"

@implementation CellResponseButton

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviewsWithPictureWithType:self.picType];
    }
    return self;
}

- (void)initSubviewsWithPictureWithType:(PictureType)type {
    
    self.isLike = NO; //
    self.amount = 0;  //
    
    self.
    
    self.customImageView = [[UIImageView alloc] init];
}

- (UIImage *)selectNormalPicture {
    
    switch (self.picType) {
            
        case Like:
            return [UIImage imageNamed:@"like_icon"];
            
        case Comment:
            return [UIImage imageNamed:@"Talk_icon"];
    }
}

- (UIImage *)selectHighLightPicture {
    
    switch (self.picType) {
            
        case Like:
            return [UIImage imageNamed:@"click_like_icon"];
            
        default:
            return [UIImage imageNamed:@""];
    }
}

- (NSString *)selectPlaceholderText {
    
    switch (self.picType) {
            
        case Like:
            return @"点赞";
            
        case Comment:
            return @"评论";
            
        default:
            return @"";
    }
}

- (void)setIsLike:(BOOL)isLike {
    
    switch (self.picType) {
            
        case Like:
            self.customImageView.image = isLike ? [self selectHighLightPicture] : [self selectNormalPicture];
            break;
            
        default:
            break;
    }
}

- (void)setAmount:(int)amount {
    self.amountLabel.text = self.amount == 0 ? [self selectPlaceholderText] : [NSString stringWithFormat:@"%d", self.amount];
}







































@end
