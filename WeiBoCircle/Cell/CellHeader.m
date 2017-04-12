//
//  CellHeader.m
//  XGCircle
//
//  Created by xiaohui on 2017/4/5.
//  Copyright © 2017年 XIAOHUI. All rights reserved.
//

#import "CellHeader.h"

#define CellHeaderHeight    80
#define AvatarLeftMargin    20
#define AvatarWidth         60
#define CommitTimeTopMargin 10

typedef NS_ENUM(NSInteger, PictureType) {
    DefaultAvatar = 0, // 默认头像
    UnCollect,         // 未收藏
    Collected          // 已收藏
};

@implementation CellHeader

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    
    self.collect = NO; //
    
    // 头像
    self.avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, AvatarWidth, AvatarWidth)];
    self.avatarImageView.image = [self selectPictureWithType:DefaultAvatar];
    self.avatarImageView.layer.cornerRadius = 10;
    self.avatarImageView.layer.masksToBounds = YES;
    self.avatarImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showUserHomePage)];
    [self.avatarImageView addGestureRecognizer:tap];
    [self addSubview:self.avatarImageView];
    [self.avatarImageView al_alignSuperLeft:AvatarLeftMargin];
    [self.avatarImageView al_alignSuperVerticalCenter];
    [self.avatarImageView al_setSize:self.avatarImageView.frame.size];
    
    // 名字
    UILabel *lb1 = [[UILabel alloc] init];
    lb1.font = [UIFont systemFontOfSize:14.0];
    lb1.text = @"测";
    
    UILabel *lb2 = [[UILabel alloc] init];
    lb2.font = [UIFont systemFontOfSize:11.0];
    lb2.text = @"测";
    
    CGFloat nameLabelTopMargin = (CellHeaderHeight - lb1.finalHeight - CommitTimeTopMargin - lb2.finalHeight) / 2;
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.font = [UIFont systemFontOfSize:14.0];
    [self addSubview:self.nameLabel];
    [self.nameLabel al_layRightOf:self.avatarImageView distance:AvatarLeftMargin];
    [self.nameLabel al_alignSuperUpon:nameLabelTopMargin];
    [self.nameLabel al_setMaxWidth:[[UIScreen mainScreen] bounds].size.width / 2];
    
    // 提交时间
    self.commitTimeLabel = [[UILabel alloc] init];
    self.commitTimeLabel.font = [UIFont systemFontOfSize:11.0];
    self.commitTimeLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:self.commitTimeLabel];
    [self.commitTimeLabel al_layRightOf:self.avatarImageView distance:AvatarLeftMargin];
    [self.commitTimeLabel al_layBelowOf:self.nameLabel distance:CommitTimeTopMargin];
    
    // 收藏
    self.collectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.collectButton sizeToFit];
    [self.collectButton addTarget:self action:@selector(collectBlog) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.collectButton];
    [self.collectButton al_alignSuperRight:CommitTimeTopMargin];
    [self.collectButton al_alignSuperVerticalCenter];
}

- (UIImage *)selectPictureWithType:(PictureType)type {
    
    switch (type) {
            
        case DefaultAvatar:
            return [UIImage imageNamed:@"default_avatar"];
            
        case UnCollect:
            return [UIImage imageNamed:@"unCollected"];
            
        case Collected:
            return [UIImage imageNamed:@"collected"];
    }
}

- (void)setUserInfo:(UserBasicInfo *)userInfo {
    
    [self updateHeader];
    self.userId = userInfo.userId;
}

- (void)setCollect:(BOOL)collect {
    
    [self.collectButton setImage:(collect ? [self selectPictureWithType:Collected] : [self selectPictureWithType:UnCollect]) forState:UIControlStateNormal];
}

- (void)updateHeader {
    
    self.avatarImageView.image = [UIImage imageNamed:@"avatar"];
    self.nameLabel.text = @"小A";
    self.commitTimeLabel.text = @"2017.4.5";
    self.collect = NO;
}

//- (void)updateHeader {
//
//    if (self.userInfo) {
//        [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:self.userInfo.avatar]];
//        self.nameLabel.text = self.userInfo.name;
//        self.commitTimeLabel.text = self.userInfo.commitTime;
////        self.collect = model.collect;
//    }
//}

// 展示用户主页
- (void)showUserHomePage {
    
    if (self.avatarTapped) {
        self.avatarTapped();
    }
}

// 收藏博文
- (void)collectBlog {
    
    NSLog(@"收藏或取消收藏！");
    
    if (self.userId) {
        if (self.collect) {
            // 取消收藏
        } else {
            // 收藏
        }
    }
}

@end
