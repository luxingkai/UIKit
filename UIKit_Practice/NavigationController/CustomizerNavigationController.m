//
//  CustomizerNavigationController.m
//  UIKit_Practice
//
//  Created by tigerfly on 2020/10/10.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "CustomizerNavigationController.h"

@interface CustomizerNavigationController ()

@end

@implementation CustomizerNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    /*
     Use UINavigationBar to display your app's navigational controls
     in a bar along the top of the iOS device's screen. You can also
     design a destinctive navigation bar that matches your app's
     design and creates intuitive interaction for your users.
     */
    
    
#pragma mark -- Change the Bar Style
    
    self.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationBar.translucent = NO;
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor]};
    self.navigationBar.tintColor = [UIColor colorWithRed:1.0 green:0.99997437 blue:0.9999912977 alpha:1];
    
    /*
     ⚠️ A navigation controller determines its preferredStatusBarStyle based
     on the navigation bar style. As a result, the status bar matches the bar
     style, without any extra code required.
     */
    
#pragma mark -- Customize the Right View
    
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"first",@"second"]];
    segmentControl.frame = CGRectMake(0, 0, 40, 40);
    UIBarButtonItem *segmentBarItem = [[UIBarButtonItem alloc] initWithCustomView:segmentControl];
    self.navigationItem.rightBarButtonItem = segmentBarItem;
    
    
#pragma mark -- Customize the Title View
    
    self.navigationItem.titleView = segmentControl;
    
    
#pragma mark -- Modify the Navigation Prompt
    
//    self.navigationItem.prompt = NSLocalizedString(@"Navigation prompts appear at the top.", @"");
    
#pragma mark -- Customize the Navigation Bar Appearance
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsCompact];
    
#pragma mark -- Customize Back Button Titles
    
#pragma mark -- Customize the Back Button with an Image
    
    // For Back button customization, setup the custom image for UINavigationBar inside CustomBackButtonNavController.
    UIImage *backButtonBackgroundImage = [UIImage systemImageNamed:@"list.bullet"];
    UINavigationBar *barAppearance = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[]];
    barAppearance.backIndicatorImage = backButtonBackgroundImage;
    barAppearance.backIndicatorTransitionMaskImage = backButtonBackgroundImage;
    // Nudge the back UIBarButtonItem image down a bit.
    UIBarButtonItem *barButtonAppearance = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[]];
    [barButtonAppearance setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -5) forBarMetrics:UIBarMetricsDefault];
    // Then, it removes the back button text:
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.backBarButtonItem = backBarButton;
    
    
#pragma mark -- Modify the Large Title in the Navigation Bar
    
//    self.navigationBar.prefersLargeTitles = true;
    
    
#pragma mark -- Change Navigation Bar Appearance
    
    // Make the navigation bar's title with red text.
    UINavigationBarAppearance *appearance = [UINavigationBarAppearance new];
    [appearance configureWithOpaqueBackground];
    appearance.backgroundColor = [UIColor systemRedColor];
    appearance.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor lightTextColor]};
    self.navigationItem.standardAppearance = appearance;
    self.navigationItem.scrollEdgeAppearance = appearance;
    self.navigationItem.compactAppearance = appearance;
    
    // Make all buttons with green text.
    UIBarButtonItemAppearance *buttonAppearance = [UIBarButtonItemAppearance new];
    buttonAppearance.normal.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor systemRedColor]};
    self.navigationItem.standardAppearance.buttonAppearance = buttonAppearance;
    self.navigationItem.compactAppearance.buttonAppearance = buttonAppearance;
    
    //Make the done style button with yellow text.
    UIBarButtonItemAppearance *doneButtonAppearance = [UIBarButtonItemAppearance new];
    doneButtonAppearance.normal.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor systemBlueColor]};
    self.navigationItem.standardAppearance.doneButtonAppearance = doneButtonAppearance;
    self.navigationItem.compactAppearance.doneButtonAppearance = doneButtonAppearance;
    
    
#pragma mark -- Attach a Menu to a Bar Button Item
    
//    UIMenu *barButtonMenu = [UIMenu menuWithTitle:@"" children:@[[UIAction actionWithTitle:NSLocalizedString(@"Copy", @"") image:nil identifier:nil handler:nil]]];
//    self.navigationItem.menu = barButtonMenu;
     
    
    
    
}


- (void)back {
    
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
