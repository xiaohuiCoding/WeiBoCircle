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

#define CellFooterHeight     80
#define ResponseButtonHeight 40

@implementation SimpleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    
    // header
    self.cellHeader = [[CellHeader alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, CellFooterHeight)];
    [self addSubview:self.cellHeader];
    
    // footer
    self.cellFooter = [[CellFooter alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, ResponseButtonHeight)];
    [self addSubview:self.cellFooter];
    [self.cellFooter al_setSize:self.cellFooter.frame.size];
    [self.cellFooter al_alignSuperHorizontalCenter];
    [self.cellFooter al_layBelowOf:self.cellHeader distance:0];
}

- (void)updateCellWithModel:(BaseModel *)baseModel {
    
    [self.cellHeader updateHeader];
    [self.cellFooter updateFooter];
}

//- (void)updateCellWithModel:(BaseModel *)baseModel {
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

- (void)setLikeButtonClicked:(LikeButtonClicked)likeButtonClicked {
    
    self.cellFooter.likeButtonClicked = likeButtonClicked;
}

- (void)setCommentButtonClicked:(CommentButtonClicked)commentButtonClicked {
    
    self.cellFooter.commentButtonClicked = commentButtonClicked;
}

@end
