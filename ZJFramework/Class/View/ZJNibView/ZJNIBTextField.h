//
//  ZJTextField.h
//  p2p
//
//  Created by DL on 14-9-24.
//
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface ZJNIBTextField : UITextField
#pragma mark View
@property IBInspectable(nonatomic) float cornerRadius;
@property IBInspectable(nonatomic) float borderWidth;
@property IBInspectable(nonatomic) UIColor *borderColor;

@property IBInspectable(nonatomic) UIColor *shadowColor;
@property IBInspectable(nonatomic) CGSize shadowOffset;
@property IBInspectable(nonatomic) float shadowOpacity;
@property IBInspectable(nonatomic) float shadowRadius;


#pragma mark TextFieldView
@property IBInspectable(nonatomic) UIColor *placeHoldColor;
@property IBInspectable(nonatomic) UIFont *placeHoldFont;
@property IBInspectable(nonatomic) CGPoint textRectForPoint;

@end
