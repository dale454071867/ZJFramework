//
//  PageViewController.m
//  ZJFramework
//
//  Created by DL on 15/3/31.
//  Copyright (c) 2015年 DL. All rights reserved.
//

#import "PageViewController.h"
#import "DataViewController.h"
@interface PageViewController ()<UIPageViewControllerDataSource>
@property(nonatomic,strong)UIPageViewController *pageController;
@property (strong, nonatomic) NSArray *pageContent;
@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      self.edgesForExtendedLayout = UIRectEdgeNone;
    [self createContentPages];
    NSDictionary *options = @{UIPageViewControllerOptionSpineLocationKey:@(UIPageViewControllerSpineLocationMin)};
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
    self.pageController.dataSource = self;
    self.pageController.view.frame = self.view.bounds;
    
    
    DataViewController *initialViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    [_pageController setViewControllers:viewControllers
     
                              direction:UIPageViewControllerNavigationDirectionForward
     
                               animated:NO
     
                             completion:nil];
    
    [self addChildViewController:_pageController];
    [self.view addSubview:_pageController.view];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) createContentPages {
    
    NSMutableArray *pageStrings = [[NSMutableArray alloc] init];
    
    for (int i = 1; i < 11; i++){
        NSString *contentString = [[NSString alloc] initWithFormat:@"Chapter %d This is the page %d of content displayed using UIPageViewController in iOS 5.", i, i];
        [pageStrings addObject:contentString];
    }
    self.pageContent = [[NSArray alloc] initWithArray:pageStrings];
                                   
}

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    if (([self.pageContent count] == 0) || (index >= [self.pageContent count])) {
        
        return nil;
        
    }
    
    // 创建一个新的控制器类，并且分配给相应的数据
    
    DataViewController *dataViewController =[DataViewController new];
//    [
    NSString *string = [NSString stringWithFormat:@"%@",self.pageContent[index]];
    [dataViewController setDataObjec:string];
    return dataViewController;
}
// 返回上一个ViewController对象

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    
    
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    
    if ((index == 0) || (index == NSNotFound)) {
        
        return nil;
        
    }
    
    index--;
    
    // 返回的ViewController，将被添加到相应的UIPageViewController对象上。
    
    // UIPageViewController对象会根据UIPageViewControllerDataSource协议方法，自动来维护次序。
    
    // 不用我们去操心每个ViewController的顺序问题。
    
    return [self viewControllerAtIndex:index];
}
- (NSUInteger)indexOfViewController:(DataViewController *)viewController {
    
    return [self.pageContent indexOfObject:viewController.dataObjec];
    
}
// 返回下一个ViewController对象
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    
    if (index == NSNotFound) {
        
        return nil;
        
    }
    
    index++;
    
    if (index == [self.pageContent count]) {
        
        return nil;
        
    }
    
    return [self viewControllerAtIndex:index];
    
    
    
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
