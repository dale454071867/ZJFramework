//
//  ZJNIBButton.m
//  ZJFramework
//
//  Created by DL on 15/3/27.
//  Copyright (c) 2015年 DL. All rights reserved.
//

#import "ZJNIBButton.h"

@implementation ZJNIBButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)updateView
{
    self.layer.cornerRadius = self.cornerRadius;
    self.layer.borderWidth = self.borderWidth;
    self.layer.borderColor = self.borderColor.CGColor;
}
-(void)setCornerRadius:(double)cornerRadius
{
    _cornerRadius = cornerRadius;
    [self updateView];
}
-(void)setBorderWidth:(double)borderWidth
{
    _borderWidth = borderWidth;
    [self updateView];
}
-(void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    [self updateView];
}
@end
