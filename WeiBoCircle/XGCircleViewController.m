//
//  XGCircleViewController.m
//  XGCircle
//
//  Created by xiaohui on 2017/4/5.
//  Copyright © 2017年 XIAOHUI. All rights reserved.
//
#import "XGCircleViewController.h"
#import "Cell.h"
#import "SimpleCell.h"
#import "VideoCell.h"
#import "VideoModel.h"

#define SimpleBlogCellIdentifier @"simple"
//#define VideoBlogCellIdentifier  @"video"

@interface XGCircleViewController ()<ZFPlayerDelegate>

//@property (nonatomic, strong) NSArray             *list;
@property (nonatomic, strong) UITableView         *tableView;
@property (nonatomic, strong) NSMutableArray      *dataSource;
@property (nonatomic, strong) ZFPlayerView        *playerView;
@property (nonatomic, strong) ZFPlayerControlView *controlView;

@end

@implementation XGCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.list = @[];
    
    self.tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[SimpleCell class] forCellReuseIdentifier:SimpleBlogCellIdentifier];
//    [self.tableView registerClass:[VideoCell class] forCellReuseIdentifier:VideoBlogCellIdentifier];
    [self.view addSubview:self.tableView];
    
    [self requestData];
}

- (void)requestData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"videoData" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    self.dataSource = @[].mutableCopy;
    NSArray *videoList = [rootDict objectForKey:@"videoList"];
    for (NSDictionary *dataDic in videoList) {
        VideoModel *model = [[VideoModel alloc] init];
        [model setValuesForKeysWithDictionary:dataDic];
        [self.dataSource addObject:model];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 10;
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CellHeaderHeight + CellVideoContentHeight + CellFooterHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    Cell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleBlogCellIdentifier forIndexPath:indexPath];
//    [cell updateCellWithModel:nil];
//    cell.avatarTapped = ^ {
//        NSLog(@"点击用户头像！");
//    };
    
    NSString *identifier        = [SimpleBlogCellIdentifier stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)indexPath.row]];
    
    SimpleCell *cell                 = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[SimpleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [cell updateCellWithModel:nil];
    cell.avatarTapped = ^ {
            NSLog(@"点击用户头像！");
    };
    
    // 取到对应cell的model
    __block VideoModel *model        = self.dataSource[indexPath.row];
    // 赋值model
    cell.cellVideoContent.model                         = model;
    __block NSIndexPath *weakIndexPath = indexPath;
    __block SimpleCell *weakCell     = cell;
    __weak typeof(self)  weakSelf      = self;
    // 点击播放的回调
    cell.cellVideoContent.playBlock = ^(UIButton *btn){
        
        // 分辨率字典（key:分辨率名称，value：分辨率url)
        NSMutableDictionary *dic = @{}.mutableCopy;
        for (VideoResolution * resolution in model.playInfo) {
            [dic setValue:resolution.url forKey:resolution.name];
        }
        // 取出字典中的第一视频URL
        NSURL *videoURL = [NSURL URLWithString:dic.allValues.firstObject];
        ZFPlayerModel *playerModel = [[ZFPlayerModel alloc] init];
        playerModel.title            = model.title;
        playerModel.videoURL         = videoURL;
        playerModel.placeholderImageURLString = model.coverForFeed;
        playerModel.resolutionDic    = dic;
        playerModel.tableView        = weakSelf.tableView; //不设置则无法进行小窗口续播
        playerModel.indexPath        = weakIndexPath;
        playerModel.fatherView       = weakCell.cellVideoContent.picView;
        
        // 设置播放控制层和model
        [weakSelf.playerView playerControlView:weakSelf.controlView playerModel:playerModel];
        
        // 点击中心位置的播放按钮可自动播放
        [weakSelf.playerView autoPlayTheVideo];
        
        // 下载功能开启
        weakSelf.playerView.hasDownload = YES;
    };
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath---%zd",indexPath.row);
}

- (ZFPlayerView *)playerView
{
    if (!_playerView) {
        
        _playerView = [ZFPlayerView sharedPlayerView];
        _playerView.delegate = self;
        
        // 当cell播放视频由全屏变为小屏时候，不回到中间位置
        _playerView.cellPlayerOnCenter = NO;
        
        //        // 当cell划出屏幕的时候停止播放（若不停止则可在屏幕右下角进行小窗口续播）
        //        _playerView.stopPlayWhileCellNotVisable = YES;
        
        //        //（可选设置）可以设置视频的填充模式，默认为（等比例填充，直到一个维度到达区域边界）
        //        _playerView.playerLayerGravity = ZFPlayerLayerGravityResizeAspect;
        
        //        // 静音
        //        _playerView.mute = YES;
    }
    return _playerView;
}

- (ZFPlayerControlView *)controlView
{
    if (!_controlView) {
        _controlView = [[ZFPlayerControlView alloc] init];
    }
    return _controlView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
