//
//  ImageFlowScrollView.h
//  ZJFramework
//
//  Created by DL on 15/3/27.
//  Copyright (c) 2015年 DL. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol imageFlowScrollViewDataSource;
@protocol imageFlowScrollViewDelegate;
@interface ImageFlowScrollView : UIScrollView
@property(nonatomic,weak)id <imageFlowScrollViewDelegate> imageFlowDelegate;
@property(nonatomic,weak)id <imageFlowScrollViewDataSource> detaSource;
@end

@protocol imageFlowScrollViewDataSource <NSObject>



@end

@protocol imageFlowScrollViewDelegate <NSObject>


@end