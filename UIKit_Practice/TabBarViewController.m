//
//  TabBarViewController.m
//  UIKit_Practice
//
//  Created by tigerfly on 2020/7/7.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "TabBarViewController.h"
#import "RotateViewController.h"
#import "CustomizerNavigationController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RotateViewController *rotateVC = [RotateViewController new];
    CustomizerNavigationController *nav = [[CustomizerNavigationController alloc] initWithRootViewController:rotateVC];
    nav.tabBarItem.title = @"旋转控制";
    nav.tabBarItem.image = [[UIImage imageNamed:@"moai"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:@"moai"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self setViewControllers:@[nav]];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:10
                                                                  ],NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    
    
    //
    
    
    
    // Do any additional setup after loading the view.
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
