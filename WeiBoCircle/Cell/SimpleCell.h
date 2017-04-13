//
//  SimpleCell.h
//  XGCircle
//
//  Created by xiaohui on 2017/4/5.
//  Copyright © 2017年 XIAOHUI. All rights reserved.
//

#import "Cell.h"
#import "CellHeader.h"
#import "CellVideoContent.h"
#import "CellFooter.h"

@interface SimpleCell : Cell

@property (nonatomic, strong) CellHeader *cellHeader;
@property (nonatomic, strong) CellVideoContent *cellVideoContent;
@property (nonatomic, strong) CellFooter *cellFooter;

@end
