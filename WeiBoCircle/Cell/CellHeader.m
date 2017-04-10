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
    UnCollectedIcon,   // 未收藏图标
    CollectedIcon      // 已收藏图标
};

@implementation CellHeader

- (UIImage *)getPicture:(PictureType)type {
    
    switch (type) {
            
        case DefaultAvatar:
            return [UIImage imageNamed:@""];
            
        case UnCollectedIcon:
            return [UIImage imageNamed:@"unCollected"];
            
        case CollectedIcon:
            return [UIImage imageNamed:@"collected"];
            
        default:
            return [UIImage imageNamed:@""];
    }
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    
    // 头像
    self.avatarImageView = [[UIImageView alloc] init];
    [self addSubview:self.avatarImageView];
    self.avatarImageView.image = [self getPicture:DefaultAvatar];
    [self.avatarImageView al_alignSuperLeft:AvatarLeftMargin];
    [self.avatarImageView al_alignSuperVerticalCenter];
    [self.avatarImageView al_setSize:CGSizeMake(AvatarWidth, AvatarWidth)];
    self.avatarImageView.layer.cornerRadius = 10;
    self.avatarImageView.layer.masksToBounds = YES;
    self.avatarImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showUserHomePage)];
    [self.avatarImageView addGestureRecognizer:tap];
    
    
    UILabel *lb1 = [[UILabel alloc] init];
    lb1.font = [UIFont systemFontOfSize:14.0];
    lb1.text = @"测";
    
    UILabel *lb2 = [[UILabel alloc] init];
    lb2.font = [UIFont systemFontOfSize:11.0];
    lb2.text = @"测";
    
    CGFloat nameLabelTopMargin = (CellHeaderHeight - lb1.finalHeight - CommitTimeTopMargin - lb2.finalHeight) / 2;
    
    // 名字
    self.nameLabel = [[UILabel alloc] init];
    [self addSubview:self.nameLabel];
    self.nameLabel.font = [UIFont systemFontOfSize:14.0];
    [self.nameLabel al_layRightOf:self.avatarImageView distance:AvatarLeftMargin];
    [self.nameLabel al_alignSuperUpon:nameLabelTopMargin];
    [self.nameLabel al_setMaxWidth:[[UIScreen mainScreen] bounds].size.width / 2];
    
    // 提交时间
    self.commitTimeLabel = [[UILabel alloc] init];
    [self addSubview:self.commitTimeLabel];
    self.commitTimeLabel.font = [UIFont systemFontOfSize:11.0];
    self.commitTimeLabel.textColor = [UIColor lightGrayColor];
    [self.commitTimeLabel al_layRightOf:self.avatarImageView distance:AvatarLeftMargin];
    [self.commitTimeLabel al_layBelowOf:self.nameLabel distance:CommitTimeTopMargin];
    
    // 收藏
    self.collectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.collectButton];
    [self.collectButton setImage:[self getPicture:UnCollectedIcon] forState:UIControlStateNormal];
    [self.collectButton sizeToFit];
    [self.collectButton addTarget:self action:@selector(collectBlog) forControlEvents:UIControlEventTouchUpInside];
    [self.collectButton al_alignSuperRight:CommitTimeTopMargin];
    [self.collectButton al_alignSuperVerticalCenter];
}

- (void)setUserInfo:(UserBasicInfo *)userInfo {
    
    self.userInfo = userInfo;
    [self updateWithUserInfo];
    self.userId = self.userInfo.userId;
}

- (void)setCollect:(BOOL)collect {
    
    self.collect = collect;
    [self.collectButton setImage:(self.collect ? [self getPicture:CollectedIcon] : [self getPicture:UnCollectedIcon]) forState:UIControlStateNormal];
}

// 死数据更新
- (void)updateWithDeadData {
    
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:@"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png"]];
    self.nameLabel.text = @"张三";
    self.commitTimeLabel.text = @"2017.4.6";
}

// 服务器数据更新
- (void)updateWithUserInfo {

    if (self.userInfo) {
        [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:self.userInfo.avatar]];
        self.nameLabel.text = self.userInfo.name;
        self.commitTimeLabel.text = self.userInfo.commitTime;
//        self.collect = model.collect;
    }
}

// 展示用户主页
- (void)showUserHomePage {
    
    if (self.avatarTapped) {
        self.avatarTapped();
    }
}

// 收藏博文
- (void)collectBlog {
    
    if (self.collectButtonClicked) {
        self.collectButtonClicked();
    }
}

@end
