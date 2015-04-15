//
//  UnReadBubbleViewController.m
//  ZJFramework
//
//  Created by DL on 15/3/27.
//  Copyright (c) 2015年 DL. All rights reserved.
//

#import "UnReadBubbleViewController.h"
#import "UnReadBubbleView.h"
@interface UnReadBubbleViewController ()
@property(nonatomic,strong)UnReadBubbleView *bv;

@end

@implementation UnReadBubbleViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.bv=[[UnReadBubbleView alloc] initWithFrame:CGRectMake(60, 100, 25, 25)];
    [self.view addSubview:self.bv];
    
    UIButton *btnAdd=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnAdd.frame=CGRectMake(50, [UIScreen mainScreen].bounds.size.height-100, [UIScreen mainScreen].bounds.size.width-100, 60);
    [btnAdd setTitle:@"添加" forState:UIControlStateNormal];
    [btnAdd addTarget:self action:@selector(btnAddClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnAdd];
    // Do any additional setup after loading the view from its nib.
}
-(void)btnAddClick{
    [self.view addSubview:self.bv];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
