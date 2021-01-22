//
//  CTabBarViewController.m
//  UIKit_Practice
//
//  Created by tigerfly on 2021/1/16.
//  Copyright © 2021 tiger fly. All rights reserved.
//

#import "CTabBarViewController.h"

@interface CTabBarViewController ()

@end

@implementation CTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIDevice *device = [UIDevice currentDevice];
    NSLog(@"name  %@",device.name);
    NSLog(@"model  %@",device.model);

    
//    UITabBar *tabBar = [[UITabBar alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 80)];
//    [self.view addSubview:tabBar];
    
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
