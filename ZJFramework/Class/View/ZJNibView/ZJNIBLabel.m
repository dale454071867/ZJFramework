//
//  ZJNibLabel.m
//  ZJFramework
//
//  Created by DL on 15/3/26.
//  Copyright (c) 2015年 DL. All rights reserved.
//

#import "ZJNIBLabel.h"

@implementation ZJNIBLabel
@synthesize nibCornerRadius = _nibCornerRadius;
@synthesize nibBorderColor = _nibBorderColor,nibBorderWidth = _nibBorderWidth;

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self updateView];
}
-(void)updateView
{
    self.layer.cornerRadius = self.nibCornerRadius;
    self.layer.borderWidth = self.nibBorderWidth;
    self.layer.borderColor = self.nibBorderColor.CGColor;
    }
-(double)dcornerRadius
{
    return self.nibCornerRadius;
}


-(void)setNibCornerRadius:(double)cornerRadius
{
    _nibCornerRadius = cornerRadius;
    [self updateView];
}
-(double)borderWidth
{
    return self.borderWidth;
}

-(void)setNibBorderWidth:(double)borderWidth
{
    _nibBorderWidth = borderWidth;
    [self updateView];
}
-(void)setNibBorderColor:(UIColor *)borderColor
{
    _nibBorderColor = borderColor;
    [self updateView];
}

@end
