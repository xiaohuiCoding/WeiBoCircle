//
//  Cell.h
//  XGCircle
//
//  Created by xiaohui on 2017/4/5.
//  Copyright © 2017年 XIAOHUI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseModel.h"

typedef void (^AvatarTapped)();
typedef void (^CollectButtonClicked)();
typedef void (^LikeButtonClicked)();
typedef void (^CommentButtonClicked)();

@interface Cell : UITableViewCell

@property (nonatomic, copy) AvatarTapped         avatarTapped;
@property (nonatomic, copy) CollectButtonClicked collectButtonClicked;
@property (nonatomic, copy) LikeButtonClicked    likeButtonClicked;
@property (nonatomic, copy) CommentButtonClicked commentButtonClicked;

- (void)updateCellWithModel:(BaseModel *)baseModel;

@end
