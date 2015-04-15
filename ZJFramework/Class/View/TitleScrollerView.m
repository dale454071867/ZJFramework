//
//  TitleScrollerView.m
//  ZJFramework
//
//  Created by DL on 15/4/7.
//  Copyright (c) 2015年 DL. All rights reserved.
//

#import "TitleScrollerView.h"
#import "TitleCell.h"
#import "UIColor+NSString.h"
#define SELECTCOLOR  [UIColor colorWithString:@"#44c6cf"]
#define NORMALCOLOR  [UIColor colorWithString:@"#7b7b7b"]

#define FONT_POOR (4)
#define DefaultFont [UIFont systemFontOfSize:16]


@interface TitleScrollerView ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)IBOutlet UITableView *tableView;
@property(nonatomic,strong)UIView *sliderView;
@end

@implementation TitleScrollerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)initRun
{
//    self.clipsToBounds = YES;
    [self initTable];
    [self initSlider];
  
}
//初始化tableView设置
-(void)initTable
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.bounces = NO;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self addSubview:_tableView];
    _tableView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    _tableView.left = 0;
    _tableView.top = 0;
    _tableView.width = self.width;
    _tableView.height = self.height;
}
-(void)initSlider
{
    _currentItemIndex = 0;
    if (!_sliderView) {
        _sliderView = [[UIView alloc] initWithFrame:CGRectZero];
        _sliderView.backgroundColor = [UIColor blueColor];
    }
    [_tableView addSubview:_sliderView];
    
    
}
-(void)setCurrentItemIndex:(NSInteger)currentItemIndex
{
    _currentItemIndex = currentItemIndex;
    
    TitleCell *cell = (TitleCell*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:currentItemIndex inSection:0]];
    [UIView animateWithDuration:0.3 animations:^{
        _sliderView.frame = CGRectMake(0, cell.top, 5, [self tableView:nil heightForRowAtIndexPath:[NSIndexPath indexPathForRow:currentItemIndex inSection:0]]);
    } ];
    [self.tableView reloadData];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:currentItemIndex inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}

-(void)reloadData
{
    [_tableView reloadData];
    _sliderView.frame = CGRectMake(0,0, 5, [self tableView:nil heightForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]]);
}
-(void)setSliderColor:(UIColor *)sliderColor
{
    _sliderColor = sliderColor;
    _sliderView.backgroundColor = sliderColor;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *titleStr = _titleArray[indexPath.row];
    UIFont *font = self.titleFont?self.titleFont:DefaultFont;
 
    NSDictionary *attributeDic = @{NSFontAttributeName:font};
    CGFloat width = [titleStr sizeWithAttributes:attributeDic].width;
    return  width + 20;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdent = @"titleCellIdent";
    TitleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdent];
    if (!cell) {
        cell = [TitleCell loadFromNib];
        cell.transform = CGAffineTransformMakeRotation(M_PI_2);
        cell.selectionStyle = UITableViewCellAccessoryNone;
        cell.connetLabel.backgroundColor = [UIColor clearColor];
    }
    cell.connetLabel.text = _titleArray[indexPath.row];
    UIFont *font = self.titleFont?self.titleFont:DefaultFont;
    if (indexPath.row == self.currentItemIndex) {
        cell.connetLabel.textColor = SELECTCOLOR;
        cell.connetLabel.font = [UIFont systemFontOfSize:font.pointSize + FONT_POOR];
    }else
    {
        cell.connetLabel.font = font;
        cell.connetLabel.textColor = NORMALCOLOR;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.currentItemIndex = indexPath.row;
    if (_delegate && [_delegate respondsToSelector:@selector(titleScrollerView:didSelectIndexPath:)]) {
        [_delegate titleScrollerView:self didSelectIndexPath:indexPath.row];
    }
}
@end
