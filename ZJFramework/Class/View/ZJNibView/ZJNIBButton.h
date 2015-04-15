//
//  ZJNIBButton.h
//  ZJFramework
//
//  Created by DL on 15/3/27.
//  Copyright (c) 2015年 DL. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface ZJNIBButton : UIButton
#pragma mark View
@property IBInspectable(nonatomic) double cornerRadius;
@property IBInspectable(nonatomic) double borderWidth;
@property IBInspectable(nonatomic) UIColor *borderColor;
@end
