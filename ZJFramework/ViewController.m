//
//  ViewController.m
//  ZJFramework
//
//  Created by DL on 15/3/24.
//  Copyright (c) 2015年 DL. All rights reserved.
//

#import "ViewController.h"
#import "DemoDataRequest.h"
#import "TitleScrollerView.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *height;
@property (strong, nonatomic) IBOutlet TitleScrollerView *titleScrollerView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    

//    [self.imageView setContentStretch:CGRectMake(0.5f, 0.5f, 0.f, 0.f)];
//    CGRect frame = strechTest.frame;
//    frame.size.width += 100;
//    strechTest.frame = frame;

}


- (IBAction)button:(UIButton*)sender {
    
    
    
     [self.view layoutIfNeeded];
  
    [UIView animateWithDuration:2 animations:^{
        
//        sender.top += 100;
        self.height.constant += 100;
        
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
//         sender.top += 100;
        UIViewController *view = [UIViewController new];
        [self.navigationController pushViewController:view animated:YES];
    }];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _titleScrollerView.titleArray = @[@"fadf",@"vzcx",@"faskldsfv",@"fds",@"fsdfd",@"fdfsdafgg",@"vcd"];
    [_titleScrollerView reloadData];
//    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    UIImage *image = [UIImage imageNamed:@"IllnessInquiry_03"];
    //     UIEdgeInsets edge=UIEdgeInsetsMake(10, 10, 10,10);
    //    image=  [image stretchableImageWithLeftCapWidth:floorf(image.size.height/2) topCapHeight:floorf(image.size.height * 0.7)];
    
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(35, 22, 10, 10)];
    //    image.leftCapWidth = 1;
    //     self.imageView.image=image;
    
    
    
    //    UIImageView *strechTest = [[UIImageyiView alloc] initWithImage:[UIImage imageNamed:@"contact.png"]];
    
    //    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(120,120,120,120) resizingMode:UIImageResizingModeStretch];
    self.imageView.image = image;
//    ["sfds"  CGSize size =
//    UILabel *label = 
//    NSString *str = @"fasdfsadfsdafsad";
//   NSInteger d = [str numberOfLinesWithFont:[UIFont systemFontOfSize:13] withLineWidth:100];
       // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
