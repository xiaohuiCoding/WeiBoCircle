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

#define SimpleBlogCellIdentifier @"simple"
#define VideoBlogCellIdentifier  @"video"

@interface XGCircleViewController ()

@property (nonatomic, strong) NSArray     *list;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation XGCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.list = @[];
    
    self.tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[SimpleCell class] forCellReuseIdentifier:SimpleBlogCellIdentifier];
//    [self.tableView registerClass:[VideoCell class] forCellReuseIdentifier:VideoBlogCellIdentifier];
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleBlogCellIdentifier forIndexPath:indexPath];
    [cell updateCellWithModel:nil];
    cell.avatarTapped = ^ {
        NSLog(@"点击用户头像！");
    };
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
