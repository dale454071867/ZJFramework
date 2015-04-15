//
//  ImageFlowScrollView.m
//  ZJFramework
//
//  Created by DL on 15/3/27.
//  Copyright (c) 2015年 DL. All rights reserved.
//

#import "ImageFlowScrollView.h"
#import "ImageFlowTool.h"

@interface ImageFlowScrollView()<ImageFlowToolDelegate>

@end

@implementation ImageFlowScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)init
{
    if (self = [super init]) {
        [self config];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        [self config];
    }
    return self;
    
}
-(void)config
{
    ImageFlowTool *imageFlowTool = [[ImageFlowTool alloc] init];
    imageFlowTool.delegate = self;
}
#pragma mark imageFlowToolDelegate
-(void)scrollViewDidScroll:(ImageFlowScrollView *)imageFlowScrollView
{
    
}
@end
