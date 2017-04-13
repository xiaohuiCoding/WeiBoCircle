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
    
    // header
    self.cellHeader = [[CellHeader alloc] initWithFrame:CGRectMake(0, 0, DSWidth, CellHeaderHeight)];
    [self addSubview:self.cellHeader];
    
    // top separate view
    UIView *topSeparateView = [[UIView alloc] initWithFrame:CGRectZero];
    topSeparateView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:topSeparateView];
    [topSeparateView al_alignSuperLeft:0];
    [topSeparateView al_layBelowOf:self.cellHeader distance:0];
    [topSeparateView al_setSize:CGSizeMake(DSWidth, SeperatorLineViewHeight)];
    
    // video content
    self.cellVideoContent = [[CellVideoContent alloc] initWithFrame:CGRectZero];
    [self addSubview:self.cellVideoContent];
    [self.cellVideoContent al_alignSuperHorizontalCenter];
    [self.cellVideoContent al_layBelowOf:self.cellHeader distance:0];
    [self.cellVideoContent al_setSize:CGSizeMake(DSWidth, CellVideoContentHeight)];
    
    // footer
    self.cellFooter = [[CellFooter alloc] initWithFrame:CGRectZero];
    [self addSubview:self.cellFooter];
    [self.cellFooter al_alignSuperLeft:0];
    [self.cellFooter al_layBelowOf:self.cellVideoContent distance:0];
    [self.cellFooter al_setSize:CGSizeMake(DSWidth, CellFooterHeight)];
    
    // bottom separate view
    UIView *bottomSeparateView = [[UIView alloc] initWithFrame:CGRectZero];
    bottomSeparateView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:bottomSeparateView];
    [bottomSeparateView al_alignSuperLeft:0];
    [bottomSeparateView al_layBelowOf:self.cellFooter distance:0];
    [bottomSeparateView al_setSize:CGSizeMake(DSWidth, SeperatorViewHeight)];
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
