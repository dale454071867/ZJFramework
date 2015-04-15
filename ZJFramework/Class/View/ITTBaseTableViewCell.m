//
//  ITTBaseTableViewCell.m
//  DaoyitongCode
//
//  Created by 周杰 on 15/3/4.
//  Copyright (c) 2015年 爱康国宾. All rights reserved.
//

#import "ITTBaseTableViewCell.h"

@interface ITTBaseTableViewCell ()

@end

@implementation ITTBaseTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

+(instancetype)loadFromNib
{
    return [ITTXibViewUtils loadViewFromXibNamed:NSStringFromClass([self class])];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self addBottomLine];
    }
    return self;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
   if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
   {
       [self addBottomLine];
   }
    return self;
}
-(void)addBottomLine
{
    self.lineView = [[UIView alloc] init];
    self.lineView.backgroundColor = self.lineColor?self.lineColor:[UIColor grayColor];
    [self addSubview:self.lineView];
    self.lineView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addConstraints:@[[NSLayoutConstraint constraintWithItem:self.lineView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0],[NSLayoutConstraint constraintWithItem:self.lineView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0],[NSLayoutConstraint constraintWithItem:self.lineView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0],[NSLayoutConstraint constraintWithItem:self.lineView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:1]]];

}
-(void)layoutSubviews
{
    [super layoutSubviews];
    [self bringSubviewToFront:self.lineView];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
