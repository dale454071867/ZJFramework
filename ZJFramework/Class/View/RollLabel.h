//
//  RollLabel.h
//  textShare
//
//  Created by DL on 14-5-19.
//  Copyright (c) 2014年 issuser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RollLabel : UILabel
- (void)reDrawTextWithStringRangeArr:(NSArray *)stringRange
                            ColorArr:(NSArray *)colorArr
                                text:(NSString *)text
                        defaultColor:(UIColor *)color;
@end
