//
//  ViewsAndControls.m
//  UIKit_Practice
//
//  Created by tigerfly on 2020/11/5.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "ViewsAndControls.h"

@interface ViewsAndControls ()

@end

@implementation ViewsAndControls

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     Views and Controls
     
     Present your content onscreen and define the interactions
     allowed with that content.
     
     Views and controls are the visual building blocks of your
     app's user interface. Use them to draw and organize your
     app's content onscreen.
     
     Views can host other views. Embedding one view inside another
     creates a containment relationship between the host view
     (known as the superview) and the embedded view(known as the
     subview). View hierarchies make it esaier to manage views.
     
     You can also use views to do any of the following:
     •  Respond to touches and other events(either directly or in
        coordination with gesture recognizers).
     •  Draw custom content using Core Graphics or UIKit classes.
     •  Support drag and drop interactions.
     •  Respond to focus changes
     •  Animate the size, position, and apprearance attributes of
        the view.
     */
    
    
    /*
     View Fundamentals
     */
    
    /**
     UIView
     
     An object that manages the content for a rectangular area on the
     screen.
     
     Views are teh fundamental building blocks of your app's user interface,
     and the UIView class defines the behaviors that are common to all
     views. A view object renders content within its bounds rectangle
     and handles any interactions with that content. The UIView class
     is a concrete class that you can instantiate and use to display a fixed
     background color. You can also subclass it to draw more sophisticated
     content. To display labels, images, buttons, and other interface
     elements commonly found in apps, use the view subclasses provided
     by the UIKit framework rather than trying to define your own.
     
     Because view objects are the main way your application interact
     with the user, they have a number of responsibilities. Here are
     just a few:
     •  Drawing and animation
        ◦   Views draw content in their rectangular area using UIKit or
            Core Graphics.
        ◦   Some view properties can be animated to new values.
     •  Layout and subview management
        ◦   Views may contain zero or more subviews.
        ◦   Views can adjust the size and position of their subviews
        ◦   Use Auto Layout to define the rules for resizing and
            repositioning your views in response to changes in the
            view hierarchy.
     •  Event handling
        ◦   A view is a subclass of UIResponder and can respond to
            touches and other types of events.
        ◦   Views can install gesture recognizers to handle common
            gestures.
     
     Views can be nested inside other views to create view hierarchies,
     which offer a convenient way to organize related content. Nesting
     a view creates a parent-child relationship between the child view
     being nested (known as the subview)and the parent (known as the
     superview). A parent view may contain any number of subViews but
     each subView has only one superview. By default, when a subview's
     visible area extends outside of the bounds of its superview, no
     clipping of the subview's content occurs. Use the clipsToBounds
     property to change that behavior.
     
     To geometry of each view is defined by its frame and bounds
     properties. The frame property defines the origin and dimensions of
     the view in the coordinate system of its superview. The bounds
     property defines the internal dimensions of the view as it sees
     them and is used almost exclusively in custom drawing code. The
     center property provides a convenient way to reposition a view
     without changing its frame or bounds properties directly.
     */
    
    
    
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
