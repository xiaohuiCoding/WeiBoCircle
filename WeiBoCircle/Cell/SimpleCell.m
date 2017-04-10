//
//  SimpleCell.m
//  XGCircle
//
//  Created by xiaohui on 2017/4/5.
//  Copyright © 2017年 XIAOHUI. All rights reserved.
//

#import "SimpleCell.h"
#import "LastestModel.h"
#import "VideoModel.h"

@implementation SimpleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    
    self.cellHeader = [[CellHeader alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 80)];
    [self addSubview:self.cellHeader];
}

- (void)updateWithModel:(BaseModel *)baseModel {
    
    [self.cellHeader updateWithDeadData];
}

//- (void)updateWithModel:(BaseModel *)baseModel {
//    
//    LastestModel *lastestModel = (LastestModel *)baseModel;
//    if (lastestModel) {
//        self.cellHeader.userInfo = lastestModel.userInfo;
//        self.cellHeader.collect = lastestModel.collect;
//    }
//    
//    VideoModel *videoModel = (VideoModel *)baseModel;
//    if (videoModel) {
//        self.cellHeader.userInfo = videoModel.userInfo;
//        self.cellHeader.collect = videoModel.collect;
//    }
//}

- (void)setAvatarTapped:(AvatarTapped)avatarTapped {
    self.cellHeader.avatarTapped = avatarTapped;
}

- (void)setCollectButtonClicked:(CollectButtonClicked)collectButtonClicked {
    self.cellHeader.collectButtonClicked = collectButtonClicked;
}

@end
