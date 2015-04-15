//
//  TitleCell.h
//  ZJFramework
//
//  Created by DL on 15/4/7.
//  Copyright (c) 2015年 DL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITTXibViewUtils.h"
@interface TitleCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *connetLabel;
+(instancetype)loadFromNib;
@end
