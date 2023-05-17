//
//  Menus_Shortcuts.m
//  UIKit_Practice
//
//  Created by tigerfly on 2020/11/5.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "Menus_Shortcuts.h"

@interface XXLabel : UILabel

@end
 
@implementation XXLabel

- (BOOL)canBecomeFirstResponder {
    return YES;
}

@end

@interface Menus_Shortcuts ()
@property (nonatomic, strong) XXLabel *titleLab;
@end

@implementation Menus_Shortcuts

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    
    /*
     Simplify interactions with your app using menu systems, contextual menus,
     Home screen quick actions, and keyboard shortcuts.
     */
    
    
#pragma mark -- UIMenuController
    
    /*
     The menu interface for the Cut, Copy, Paste, Select, Select All, and Delete
     commands.
     */
    
    /*
     The singleton UIMenuController instance is referred to as the editing menu.
     When you make this menu visible, UIMenuController positions it relative to
     a target rectangle on the screen; this rectangle usually defines a selection.
     The menu appears above the target rectangle or, if there is not enough space
     for it, below it. The menu’s pointer is placed at the center of the top or
     bottom of the target rectangle, as appropriate. Be sure to set the tracking
     rectangle before you make the menu visible. You are also responsible for detecting,
     tracking, and displaying selections.
     
     The UIResponderStandardEditActions informal protocol declares methods that
     are invoked when the user taps a menu command. The canPerformAction:withSender:
     method of UIResponder is also related to the editing menu. A responder
     implements this method to enable and disable commands of the editing menu
     just before the menu is displayed. You can force this updating of menu commands’
     enabled state by calling the update method.
     
     You can also provide your own menu items via the menuItems property. When you
     modify the menu items, you can use the update method to force the menu to
     update its display.
     */
    
    /**
     Getting the Menu Controller Instance

     sharedMenuController
     Returns the menu controller.
     */
    
    /**
     Showing and Hiding the Menu

     - showMenuFromView:rect:
     - hideMenuFromView:
     - hideMenu
     */
    
    /**
     Positioning the Menu

     menuFrame
     Returns the frame of the editing menu.
     
     arrowDirection
     The direction the arrow of the editing menu is pointing.
     
     UIMenuControllerArrowDirection
     The direction the arrow of the editing menu is pointing.
     */
    
    /**
     Updating the Menu

     - update
     Updates the appearance and enabled state of menu commands.
     */
    
    /**
     Customizing Menu Items

     menuItems
     The custom menu items for the editing menu.
     */
    
    
#pragma mark -- UIMenuItem
    
    /*
     A custom item in the editing menu managed by the menu controller.
     
     Custom menu items appear in the menu after any validated system items.
     A UIMenuItem object has two properties: a title and an action selector
     identifying the method to invoke in the handling responder object.
     Targets are not specified; a suitable target is found via normal
     traversal of the responder chain. To have custom menu items appear
     in the editing menu, you must add them to the menuItems property
     of the UIMenuController object.
     */
    
    /**
     Creating a Menu Item

     - initWithTitle:action:
     Creates and returns a menu-item object initialized with the given title and action.
     */
    
    /**
     Accessing Menu-Item Attributes

     title
     The title of the menu item.
     
     action
     A selector identifying the method of the responder object to invoke for
     handling of the menu command.
     */
    
    
#pragma mark -- UIMenu
    
    /*
     A container for grouping related menu elements in an app menu or
     contextual menu.

     Create UIMenu objects and use them to construct the menus and submenus
     your app displays. You provide menus for your app when it runs on macOS,
     and key command elements in those menus also appear in the discoverability
     HUD on iPad when the user presses the command key. You also use menus to
     display contextual actions in response to specific interactions with one
     of your views. Every menu has a title, an optional image, and an optional
     set of child elements. When the user selects an element from the menu,
     the system executes the code that you provide.
     
     // Ensure that the builder is modifying the menu bar system.
     guard builder.system == UIMenuSystem.main else { return }

     let newDocument = UIKeyCommand(title: "New",
                                    action: #selector(newDocument(_:)),
                                    input: "n",
                                    modifierFlags: .command)

     let openDocument = UIKeyCommand(title: "Open...",
                                     action: #selector(openDocument(_:)),
                                     input: "o",
                                     modifierFlags: .command)

     // Use the .displayInline option to avoid displaying the menu as a submenu,
     // and to separate it from the other menu elements using a line separator.
     let newMenu = UIMenu(title: "", options: .displayInline, children: [newDocument, openDocument])

     // Insert menu item at the top of the File menu.
     builder.insertChild(newMenu, atStartOfMenu: .file)
     */
    
    
    
#pragma mark -- UIMenuBuilder
    
    /*
     An interface for adding and removing menus from a menu system.

     You don't create a menu builder object. Instead, you override
     buildMenuWithBuilder: in your app delegate or view controller to receive
     a builder object. Where you override this method determines the system
     that the builder updates. To add and remove menus from the menu bar
     using the mainSystem menu system, override buildMenuWithBuilder: in
     your app delegate. To build a context menu using the contextSystem
     system, override the method in your view controller.
     */
    
    
    
#pragma mark -- UIMenuSystem
    
    /*
     An object representing a main or contextual menu system.

     A menu system groups root menus together. The mainSystem system has
     only one root menu while the contextSystem system can have multiple
     root menus, each built in different UIResponder objects like a view
     controller.
     
     Use UIMenuSystem in your implementation of buildMenuWithBuilder: to
     isolate changes to a specific system.
     
     override func buildMenu(with builder: UIMenuBuilder) {
         super.buildMenu(with: builder)
         
         // Ensure that the builder is modifying the menu bar system.
         guard builder.system == UIMenuSystem.main else { return }

         // ...
     }
     
     You can also use a menu system to rebuild or revalidate menus as changes
     occur in your app. To rebuild a menu, call the setNeedsRebuild method.
     Call setNeedsRevalidate when you need the menu system to revalidate a menu.
     */
    
    
    
    
    self.titleLab = [[XXLabel alloc] initWithFrame:CGRectMake(100, 300, 200, 100)];
    self.titleLab.text = @"发放开始的风景阿斯科利地方就会自然是昆明前海人寿在昆明秋后算账日开幕";
    self.titleLab.numberOfLines = 0;
    self.titleLab.userInteractionEnabled = YES;
    [self.view addSubview:self.titleLab];
    
    UILongPressGestureRecognizer *longPressGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressToCollection:)];
    [self.titleLab addGestureRecognizer:longPressGR];
    
}


- (void)longPressToCollection:(UIGestureRecognizer *)recognizer {
    [self.titleLab becomeFirstResponder];
    
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    UIMenuItem * item1 = [[UIMenuItem alloc] initWithTitle:@"剪切" action:@selector(collectionAction:)];
    UIMenuItem * item2 = [[UIMenuItem alloc] initWithTitle:@"粘贴" action:@selector(collectionAction:)];
    menuController.menuItems = @[item1,item2];
    menuController.arrowDirection = UIMenuControllerArrowDefault;
    [menuController update];
    [menuController showMenuFromView:self.view rect:self.titleLab.frame];
    
}


- (void)collectionAction:(id)sender {
    // 使用Block或者代理
    NSLog(@"点击了收藏");
    
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
