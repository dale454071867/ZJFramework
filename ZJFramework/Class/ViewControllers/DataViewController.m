//
//  DataViewController.m
//  ZJFramework
//
//  Created by DL on 15/3/31.
//  Copyright (c) 2015年 DL. All rights reserved.
//

#import "DataViewController.h"
#import "aligningLabel.h"
@interface DataViewController ()
@property (strong, nonatomic) IBOutlet aligningLabel *aligningLabel;

@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideN:)];
    [self.view addGestureRecognizer:tap];
    self.aligningLabel.text = _dataObjec;
    self.aligningLabel.verticalAlignment = VerticalAlignmentTop;
    // Do any additional setup after loading the view from its nib.
}
-(void)hideN:(UITapGestureRecognizer*)tap
{
    if (self.navigationController.navigationBar.hidden) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }else
    {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setDataObjec:(NSString *)dataObjec
{
    _dataObjec = dataObjec;
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
