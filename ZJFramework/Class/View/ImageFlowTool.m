//
//  ImageFlowTool.m
//  ZJFramework
//
//  Created by DL on 15/3/27.
//  Copyright (c) 2015年 DL. All rights reserved.
//

#import "ImageFlowTool.h"

@implementation ImageFlowTool
-(void)scrollViewDidScroll:(ImageFlowScrollView *)scrollView
{
    if (_delegate && [_delegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
        [_delegate scrollViewDidScroll:scrollView];
    }
}
@end
