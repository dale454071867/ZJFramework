//
//  ZJNIBView.h
//  ZJFramework
//
//  Created by DL on 15/3/27.
//  Copyright (c) 2015年 DL. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface ZJNIBView : UIView
typedef NS_OPTIONS(NSInteger, Border){
    Border_None,
    Border_Bottom,
    Border_Left,
    Border_Top,
    Border_Right
};

@property IBInspectable(nonatomic) CGFloat   borderWidth;
@property IBInspectable(nonatomic) CGFloat   cornerRadius;
@property IBInspectable(nonatomic) UIColor*  borderColor;
@property IBInspectable(nonatomic) BOOL      borderBottom;
@property IBInspectable(nonatomic) BOOL      borderRight;
@property IBInspectable(nonatomic) BOOL      borderLeft;
@property IBInspectable(nonatomic) BOOL      borderTop;

//@property IBInspectable(nonatomic) UIColor *nibshadowColor;
//@property IBInspectable(nonatomic) CGSize nibshadowOffset;
//@property IBInspectable(nonatomic) double nibshadowOpacity;
//@property IBInspectable(nonatomic) double nibshadowRadius;
-(id)initWithFrame:(CGRect)frame border:(Border)border radius:(double)radius color:(UIColor *)color borderWidth:(double)width;
- (void)updateView;
@end
