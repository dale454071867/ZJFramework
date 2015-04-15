//
//  TitleCell.m
//  ZJFramework
//
//  Created by DL on 15/4/7.
//  Copyright (c) 2015年 DL. All rights reserved.
//

#import "TitleCell.h"

@implementation TitleCell
+(instancetype)loadFromNib
{
    return [ITTXibViewUtils loadViewFromXibNamed:NSStringFromClass([self class])];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
@end
