//
//  TabBarViewController.m
//  UIKit_Practice
//
//  Created by tigerfly on 2020/7/7.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "TabBarViewController.h"
#import "CustomizerNavigationController.h"

/**
 App Structure
 
 UIKit manages your app's interactions with the system and
 provides classes for you to manage your app's data and
 resources.
 */
#import "AppAndEnvironmentController.h"
#import "DocumentsDataPasteboard.h"
#import "ResourceManagement.h"
#import "AppExtensions.h"
#import "InterprocessCommunication.h"

/**
 User Interface
 
 Views help you display content onscreen and facilitate user
 interactions; view controllers help you manage views and the
 structure of your interface.
 */
#import "ViewsAndControls.h"
#import "ViewControllers.h"
#import "ViewLayout.h"
#import "AppearanceCustomization.h"
#import "AnimationAndHaptics.h"
#import "WindowsAndScreens.h"

/**
 User Interactions
 
 Responders and gesture recognizers help you handle touches
 and other events. Drag and drop, focus, peek, and pop, and
 accessibility handle other uesr interactions.
 */
#import "TouchesPressesGestures.h"
#import "DragAndDrop.h"
#import "PointerInteractions.h"
#import "PencilInteractions.h"
#import "Focus-based Navigation.h"
#import "Menus_Shortcuts.h"

/**
 Graphics, Drawing and Printing
 UIKit provides classes and protocols that help you configure
 your drawing environment and render your content.
 */
#import "Images_PDF.h"
#import "Drawing.h"
#import "Printing.h"

/**
 Text
 In addition to text views that simplify displaying text in
 your app, UIKit provides custom text management and rendering
 that supports the system keyboards.
 */
#import "TextDisplay_Fonts.h"
#import "TextStorage.h"
#import "Keyboards_Input.h"
#import "AnimationAndHaptics.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.tabBar
//    self.tabBarItem
    
//    UITabBar *tabBar = [[UITabBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)];
//    [tabBar showsLargeContentViewer];
//    self.customizableViewControllers
//    CGFloat screen_w = [UIScreen mainScreen].bounds.size.width;
//    CGFloat screen_h = [UIScreen mainScreen].bounds.size.height;
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    flowLayout.itemSize = CGSizeMake((screen_w - 40)/3, 220);
//    flowLayout.minimumInteritemSpacing = 10;
//    flowLayout.minimumLineSpacing = 10;
//    flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    TouchesPressesGestures *rotateVC = [[TouchesPressesGestures alloc] initWithCollectionViewLayout:flowLayout];
    ViewLayout *vc = [ViewLayout new];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.tabBarItem.title = @"旋转控制";
    nav.tabBarItem.image = [[UIImage imageNamed:@"moai"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:@"moai"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.viewControllers = @[nav];
    
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
