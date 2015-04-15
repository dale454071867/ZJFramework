//
//  Item2ViewController.m
//  ZJFramework
//
//  Created by DL on 15/4/2.
//  Copyright (c) 2015年 DL. All rights reserved.
//

#import "Item2ViewController.h"

@interface Item2ViewController ()
@property (strong, nonatomic) IBOutlet UITextView *originalStringTextField;
@property (strong, nonatomic) IBOutlet UITextField *regularFormulaTextField;
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;
@property (strong, nonatomic) IBOutlet UILabel *rangLabel;

@end

@implementation Item2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self regular];
//    [self regex2];
    // Do any additional setup after loading the view.
}
- (IBAction)beginRegular:(id)sender {
    NSArray *array = [[NSArray alloc]initWithObjects:@"beijing",@"shanghai",@"guangzou",@"wuhan", nil];
    NSString *string = @"ang";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",string];
    NSLog(@"%@",[array filteredArrayUsingPredicate:pred]);
    
    
    
    
    NSString *re = _regularFormulaTextField.text;
    NSRange range = [_originalStringTextField.text rangeOfString:re options:NSRegularExpressionSearch];
    _rangLabel.text = [NSString stringWithFormat:@"location:%lu,length%lu",(unsigned long)range.location,(unsigned long)range.length];
    if (range.location != NSNotFound) {
        _resultLabel.text = [_originalStringTextField.text substringWithRange:range];
    }
    else {
        _resultLabel.text = @"error";
    }
    
}
- (IBAction)isEmailAddress:(id)button
{
    
    NSString *email = _originalStringTextField.text;
    NSString *re = @"^([A-Za-z0-9\\.\\-_]{1,})@((?:[A-Za-z0-9]+(?:[\\-|\\.][A-Za-z0-9]+)*)+\\.[A-Za-z]{2,6})$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", re];
    _resultLabel.text = [NSString stringWithFormat:@"%d",[emailTest evaluateWithObject:email]];
    
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
