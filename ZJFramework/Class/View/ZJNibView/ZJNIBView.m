//
//  ZJNIBView.m
//  ZJFramework
//
//  Created by DL on 15/3/27.
//  Copyright (c) 2015年 DL. All rights reserved.
//

#import "ZJNIBView.h"

@implementation ZJNIBView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
@synthesize borderWidth = _borderWidth;
@synthesize borderColor = _borderColor;
@synthesize borderBottom = _borderBottom;
@synthesize borderLeft = _borderLeft;
@synthesize borderRight = _borderRight;
@synthesize borderTop = _borderTop;
@synthesize cornerRadius = _cornerRadius;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //_borderColor = [UIColor whiteColor];
        //_borderWidth = @0;
    }
    return self;
}
-(id)initWithFrame:(CGRect)frame border:(Border)border radius:(double)radius color:(UIColor *)color borderWidth:(double)width{
    self = [super initWithFrame:frame];
    if (self) {
        if ((border & Border_Bottom) != 0) {
            self.borderBottom = YES;
        }
        if ((border & Border_Left) != 0) {
            self.borderLeft = YES;
        }
        if ((border & Border_Right) != 0) {
            self.borderRight = YES;
        }
        if ((border & Border_Top) != 0) {
            self.borderTop = YES;
        }
        self.cornerRadius = radius;
        self.borderColor = color;
        self.borderWidth = width;
        [self updateView];
        //_borderColor = [UIColor whiteColor];
        //_borderWidth = @0;
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self updateView];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

/*-(void)setFrame:(CGRect)frame{
 [super setFrame:frame];
 if ([self.layer.sublayers objectAtIndex:0]) {
 [(CALayer *)[self.layer.sublayers objectAtIndex:0] removeFromSuperlayer];
 }
 [self updateView];
 }*/

- (void)removePreviousBorders{
    if ([self.layer sublayers]) {
        NSMutableArray *toBeRemoved = [NSMutableArray array];
        for (CALayer *layer in self.layer.sublayers) {
            if ([layer.name isEqual:@"Border"]) {
                //[layer removeFromSuperlayer];
                [toBeRemoved addObject:layer];
            }
        }
        for (CALayer *layer in toBeRemoved) {
            [layer removeFromSuperlayer];
        }
        toBeRemoved = nil;
    }
    
}

- (void)updateView{
    [self removePreviousBorders];
    //self.layer.sublayers = [NSArray array];
    // self.layer.sublayers = nil;
    //    for (CALayer *layer in [self.layer sublayers]) {
    //        [layer removeFromSuperlayer];
    //    }
    if (self.cornerRadius && self.cornerRadius != 0) {
        self.layer.cornerRadius = self.cornerRadius;
        self.clipsToBounds = YES;
        
        self.layer.borderWidth = self.borderWidth;
        self.layer.borderColor = self.borderColor.CGColor;
        return;
    }
    if (self.borderBottom) {
        CALayer *sublayerBottom = [CALayer layer];
        sublayerBottom.name = @"Border";
        sublayerBottom.backgroundColor = [self.borderColor CGColor];
        sublayerBottom.frame = CGRectMake(0, self.frame.size.height-self.borderWidth, self.frame.size.width, self.borderWidth);
        [self.layer addSublayer:sublayerBottom];
    }
    if (self.borderTop) {
        CALayer *sublayerBottom = [CALayer layer];
        sublayerBottom.name = @"Border";
        sublayerBottom.backgroundColor = [self.borderColor CGColor];
        sublayerBottom.frame = CGRectMake(0, 0, self.frame.size.width, self.borderWidth);
        [self.layer addSublayer:sublayerBottom];
    }
    if (self.borderRight) {
        CALayer *sublayerBottom = [CALayer layer];
        sublayerBottom.name = @"Border";
        sublayerBottom.backgroundColor = [self.borderColor CGColor];
        sublayerBottom.frame = CGRectMake(self.frame.size.width - self.borderWidth, 0, self.borderWidth, self.frame.size.height);
        [self.layer addSublayer:sublayerBottom];
    }
    if (self.borderLeft) {
        CALayer *sublayerBottom = [CALayer layer];
        sublayerBottom.name = @"Border";
        sublayerBottom.backgroundColor = [self.borderColor CGColor];
        sublayerBottom.frame = CGRectMake(0, 0, self.borderWidth, self.frame.size.height);
        [self.layer addSublayer:sublayerBottom];
    }
//    if (self.nibshadowColor) {
//        self.layer.shadowColor = self.nibshadowColor.CGColor;
//    }
//    self.layer.shadowOffset = self.nibshadowOffset;
//    self.layer.shadowOpacity = self.nibshadowOpacity;
//    self.layer.shadowRadius = self.nibshadowRadius;
}
//-(void)setnibShadowColor:(UIColor *)shadowColor
//{
//    _nibshadowColor = shadowColor;
//    [self updateView];
//}
//-(void)setnibShadowOffset:(CGSize )shadowOffset
//{
//    _nibshadowOffset = shadowOffset;
//      [self updateView];
//}
//-(void)setnibShadowOpacity:(double)shadowOpacity
//{
//    _nibshadowOpacity = shadowOpacity;
//      [self updateView];
//}
//-(void)setnibShadowRadius:(double)shadowRadius
//{
//    _nibshadowRadius = shadowRadius;
//      [self updateView];
//}
-(double)borderWidth{
    return _borderWidth;
}

-(void)setBorderWidth:(CGFloat)borderWidth{
    _borderWidth = borderWidth;
    [self updateView];
}

-(UIColor *)borderColor{
    return _borderColor;
}

-(void)setBorderColor:(UIColor *)borderColor{
    _borderColor = borderColor;
    [self updateView];
}

//-(void)awakeFromNib{
//    [self updateView];
//}

-(double)cornerRadius{
    return _cornerRadius;
}

-(void)setCornerRadius:(double)cornerRadius{
    _cornerRadius = cornerRadius;
    [self updateView];
}

-(BOOL)borderTop{
    return _borderTop;
}

-(void)setBorderTop:(BOOL)borderTop{
    _borderTop = borderTop;
    [self updateView];
}

-(BOOL)borderBottom{
    return _borderBottom;
}

-(void)setBorderBottom:(BOOL)borderBottom{
    _borderBottom = borderBottom;
    [self updateView];
}

-(BOOL)borderLeft{
    return _borderLeft;
}

-(void)setBorderLeft:(BOOL)borderLeft{
    _borderLeft = borderLeft;
    [self updateView];
}

-(BOOL)borderRight{
    return _borderRight;
}

-(void)setBorderRight:(BOOL)borderRight{
    _borderRight = borderRight;
    [self updateView];
}

@end
