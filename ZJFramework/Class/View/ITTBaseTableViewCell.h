//
//  ITTBaseTableViewCell.h
//  DaoyitongCode
//
//  Created by 周杰 on 15/3/4.
//  Copyright (c) 2015年 爱康国宾. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITTXibViewUtils.h"
@interface ITTBaseTableViewCell : UITableViewCell
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UIColor *lineColor;
+(instancetype)loadFromNib;
@end
