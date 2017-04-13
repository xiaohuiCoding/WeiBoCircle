//
//  CellResponseButton.m
//  XGCircle
//
//  Created by xiaohui on 2017/4/5.
//  Copyright © 2017年 XIAOHUI. All rights reserved.
//

#import "CellResponseButton.h"

@implementation CellResponseButton

- (instancetype)initWithFrame:(CGRect)frame pictureType:(PictureType)type {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.isLike = NO; //
        self.amount = 0;  //
        
        self.picType = type;
        
        // 数量
        self.amountLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.amountLabel.font = [UIFont systemFontOfSize:12.0];
        self.amountLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:self.amountLabel];
        [self.amountLabel al_alignSuperRight:0];
        [self.amountLabel al_alignSuperVerticalCenter];
        
        // 图标
        self.customImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.customImageView.image = [self selectNormalPicture];
        [self addSubview:self.customImageView];
        [self.customImageView al_layLeftOf:self.amountLabel distance:CustomImageViewRightMargin];
        [self.customImageView al_alignSuperVerticalCenter];
        
        self.amountLabel.text = @"0";
        [self reSetResponseButtonWidth];
    }
    return self;
}

- (void)reSetResponseButtonWidth {
    
//    [self.amountLabel sizeToFit];
//    [self.customImageView sizeToFit];
//
//    [self al_setSize:CGSizeMake(self.amountLabel.finalWidth + CustomImageViewRightMargin + self.customImageView.frame.size.width, CellFooterHeight)];
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

- (void)setAmount:(int)amount {
    
    self.amountLabel.text = (amount == 0) ? [self selectPlaceholderText] : [NSString stringWithFormat:@"%d", amount];
    
    [self reSetResponseButtonWidth];
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

@end
