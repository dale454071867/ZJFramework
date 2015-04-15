//
//  RollLabel.m
//  textShare
//
//  Created by DL on 14-5-19.
//  Copyright (c) 2014年 issuser. All rights reserved.
//

#import "RollLabel.h"
#import "UIView+ITTAdditions.h"
@interface RollLabel()

@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong)NSArray *colorArr;
@property(nonatomic,strong)NSArray *stringRangeArr;
@property(nonatomic,strong)NSString *nsText;
@end

@implementation RollLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}
- (void)reDrawTextWithStringRangeArr:(NSArray *)stringRange
                            ColorArr:(NSArray *)colorArr
                                text:(NSString *)text
                        defaultColor:(UIColor *)color
{
//    if ([colorArr count]!=[stringRange count]) {
//        return;
//    }
//    if ([colorArr count]==0||[stringRange count]==0) {
//        return;
//    }
    
    _colorArr =colorArr;
    _stringRangeArr = stringRange;
    _nsText = [NSString stringWithString:text];
    self.textColor = color;
    self.backgroundColor = [UIColor clearColor];
    if (_label == nil) {
        _label = [[UILabel alloc] init];
//        [_label reDrawTextWithStringRangeArr:_stringRangeArr ColorArr:_colorArr text:_nsText defaultColor:self.textColor];
        _label.backgroundColor = [UIColor clearColor];
        _label.frame = self.bounds;
        _label.font = [UIFont systemFontOfSize:13.f];
        _label.textAlignment = NSTextAlignmentRight;
        [self addSubview:_label];
    }
    self.textColor = [UIColor clearColor];
    //    __weak __block RollLabel *wself = self;
    //    [_label setText:self.text afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
    //        return wself.mutableAttributedString2;
    //    }];
    CGSize size =  [text sizeWithAttributes:@{NSAttachmentAttributeName:[UIFont systemFontOfSize:13.0f]}];
    
    //    _label.font = self.font;
    if (size.width<self.frame.size.width) {
        _label.left = self.width-size.width;
        //        _label.width = size.width;
        //        _label.right = self.right;
    }else
    {
        _label.width = size.width;
        _label.left = self.left;
        [UIView beginAnimations:@"testAnimation" context:NULL];
        
        [UIView setAnimationDuration:8.8f];
        
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        [UIView setAnimationDelegate:self];
        
        [UIView setAnimationRepeatAutoreverses:NO];
        
        [UIView setAnimationRepeatCount:INT_MAX];
        _label.left = -size.width;
        [UIView commitAnimations];
        
    }
    
}
-(void)setText:(NSString *)text
{

    self.backgroundColor = [UIColor clearColor];
    if (_label == nil) {
        _label = [[UILabel alloc] init];
//        [_label reDrawTextWithStringRangeArr:_stringRangeArr ColorArr:_colorArr text:_nsText defaultColor:self.textColor];
        _label.backgroundColor = [UIColor clearColor];
        _label.frame = self.bounds;
//        _label.font = ;
        _label.textAlignment = NSTextAlignmentRight;
        [self addSubview:_label];
    }
    self.textColor = [UIColor clearColor];
    _label.text = text;
//    __weak __block RollLabel *wself = self;
//    [_label setText:self.text afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
//        return wself.mutableAttributedString2;
//    }];
    CGSize size =  [text sizeWithAttributes:@{NSFontAttributeName:_label.font}];

//    _label.font = self.font;
    if (size.width<self.frame.size.width) {
        _label.textAlignment = self.textAlignment;
//        _label.width = size.width;
//        _label.right = self.right;
    }else
    {
        _label.width = size.width;
        _label.left = self.left;
        [self beginAnimation];
    }
}
-(void)beginAnimation
{
    [UIView animateWithDuration:_label.width/30 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            _label.left = -_label.width;
    } completion:^(BOOL finished) {
         _label.left = self.right;
        [self beginAnimation];
    }];
}

/*se
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
