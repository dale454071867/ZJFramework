//
//  ZJTextField.m
//  p2p
//
//  Created by DL on 14-9-24.
//
//

#import "ZJNIBTextField.h"

@implementation ZJNIBTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    [self updateView];
}
-(void)updateView
{
    self.layer.cornerRadius = self.cornerRadius;
    self.layer.borderWidth = self.borderWidth;
    self.layer.borderColor = self.borderColor.CGColor;
    
    self.layer.shadowColor = self.shadowColor.CGColor;
    self.layer.shadowOffset = self.shadowOffset;
    self.layer.shadowOpacity = self.shadowOpacity;
    self.layer.shadowRadius = self.shadowRadius;
    
    if (self.placeHoldColor) {
        [self setValue:self.placeHoldColor forKeyPath:@"_placeholderLabel.textColor"];
    }
    if (self.placeHoldFont) {
        [self setValue:self.placeHoldFont forKeyPath:@"_placeholderLabel.font"];
    }
    
}
-(void)setCornerRadius:(float)cornerRadius
{
    _cornerRadius = cornerRadius;
    [self updateView];
}
-(void)setBorderWidth:(float)borderWidth
{
    _borderWidth = borderWidth;
    [self updateView];
}
-(void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    [self updateView];
}
-(void)setPlaceHoldFont:(UIFont *)placeHoldFont
{
    _placeHoldFont = placeHoldFont;
    [self updateView];
}
-(void)setPlaceHoldColor:(UIColor *)placeHoldColor
{
    _placeHoldColor = placeHoldColor;
    [self updateView];
}
-(void)setShadowColor:(UIColor *)shadowColor
{
    _shadowColor = shadowColor;
    [self updateView];
}
-(void)setShadowOffset:(CGSize )shadowOffset
{
    _shadowOffset = shadowOffset;
    [self updateView];
}
-(void)setShadowOpacity:(float)shadowOpacity
{
    _shadowOpacity = shadowOpacity;
    [self updateView];
}
-(void)setShadowRadius:(float)shadowRadius
{
    _shadowRadius = shadowRadius;
    [self updateView];
}
- (CGRect)editingRectForBounds:(CGRect)bounds
{
        return CGRectMake(self.textRectForPoint.x, self.textRectForPoint.y, bounds.size.width-self.textRectForPoint.x, bounds.size.height - self.textRectForPoint.y*2);;
    
    
}
- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
    return CGRectMake(self.textRectForPoint.x, self.textRectForPoint.y, bounds.size.width-self.textRectForPoint.x, bounds.size.height - self.textRectForPoint.y*2);
  
}
-(CGRect)textRectForBounds:(CGRect)bounds

{
            CGRect inset = CGRectMake(self.textRectForPoint.x, self.textRectForPoint.y, bounds.size.width-self.textRectForPoint.x, bounds.size.height - self.textRectForPoint.y*2);//更好理解些
            return inset;
   
}
@end
