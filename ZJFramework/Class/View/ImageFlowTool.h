//
//  ImageFlowTool.h
//  ZJFramework
//
//  Created by DL on 15/3/27.
//  Copyright (c) 2015年 DL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageFlowScrollView.h"

@protocol ImageFlowToolDelegate;
@interface ImageFlowTool : NSObject<UIScrollViewDelegate>
@property(nonatomic,weak)id <ImageFlowToolDelegate>delegate;
@end
@protocol ImageFlowToolDelegate <NSObject>


-(void)scrollViewDidScroll:(ImageFlowScrollView*)imageFlowScrollView;
@end