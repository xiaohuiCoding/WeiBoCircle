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
    self.cellHeader = [[CellHeader alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, CellHeaderHeight)];
    [self addSubview:self.cellHeader];
    
    // seperator line
    UIView *seperatorLineView = [[UIView alloc] initWithFrame:CGRectZero];
    seperatorLineView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:seperatorLineView];
    [seperatorLineView al_alignSuperLeft:0];
    [seperatorLineView al_layBelowOf:self.cellHeader distance:0];
    [seperatorLineView al_setSize:CGSizeMake(DSWidth, SeperatorLineViewHeight)];
    
    // footer
    self.cellFooter = [[CellFooter alloc] initWithFrame:CGRectZero];
    [self addSubview:self.cellFooter];
    [self.cellFooter al_alignSuperLeft:0];
    [self.cellFooter al_layBelowOf:seperatorLineView distance:0];
    [self.cellFooter al_setSize:CGSizeMake(DSWidth, CellFooterHeight)];
    
    // bottom view
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectZero];
    bottomView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:bottomView];
    [bottomView al_alignSuperLeft:0];
    [bottomView al_layBelowOf:self.cellFooter distance:0];
    [bottomView al_setSize:CGSizeMake(DSWidth, SeperatorViewHeight)];
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
