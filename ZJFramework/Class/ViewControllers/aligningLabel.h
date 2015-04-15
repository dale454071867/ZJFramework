//
//  aligningLabel.h
//  ZJFramework
//
//  Created by DL on 15/3/31.
//  Copyright (c) 2015年 DL. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;
@interface aligningLabel : UILabel
@property (nonatomic) VerticalAlignment verticalAlignment;
@end
