//
//  RootViewController.m
//  ZJFramework
//
//  Created by DL on 15/3/27.
//  Copyright (c) 2015年 DL. All rights reserved.
//

#import "RootViewController.h"

#import "CoreTextViewController.h"
#import "UnReadBubbleViewController.h"
#import "PageViewController.h"
#import "ZJXMPPViewController.h"
#import "AsynSocketViewController.h"
@interface RootViewController ()
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)NSArray *controllerArray;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleArray = @[@"拖拽气泡",@"coreText",@"pageViewController",@"XMPP",@"AsynSocketViewController"];
    // Do any additional setup after loading the view.
    _controllerArray = @[@"UnReadBubbleViewController",@"CoreTextViewController",@"PageViewController",@"ZJXMPPViewController",@"AsynSocketViewController"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArray.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        static NSString * cellStr = @"cell0";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.textLabel.text = _titleArray[indexPath.row];
        return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *controllName = _controllerArray[indexPath.row];
    BaseViewController *viewController = [[NSClassFromString(controllName) alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
