//
//  TitleScrollerView.h
//  ZJFramework
//
//  Created by DL on 15/4/7.
//  Copyright (c) 2015年 DL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITTXibView.h"
@protocol TitleScrollerViewDelegate;
@interface TitleScrollerView : ITTXibView

@property(nonatomic,weak)id <TitleScrollerViewDelegate>delegate;
@property(nonatomic,strong)NSArray *titleArray;
@property (nonatomic,strong)UIFont *titleFont;
@property (nonatomic,assign)NSInteger currentItemIndex;
@property (nonatomic,strong)UIColor *sliderColor;
-(void)reloadData;
@end
@protocol TitleScrollerViewDelegate <NSObject>

-(void)titleScrollerView:(TitleScrollerView*)titleScrollerView didSelectIndexPath:(NSInteger)index;

@end