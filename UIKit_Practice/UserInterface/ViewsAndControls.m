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
    
    /**
     Creating a View
     
     Normallay, you create views in your storyboards by dragging them
     from the library to your canvas. You can also create views
     programmatically. When creating a view, you typically specify
     its initial size and position relative to its future superview.
     
     After creating a view, create Auto layout rules to govern how
     the size and position of the view change in response to changes
     in the rest of the view hierarchy.
     https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/index.html#//apple_ref/doc/uid/TP40010853
     */
    
    /**
     The View Drawing Cycle
     
     View drawing occurs on an-needed basis. When a view is first shown,
     or when all or part of it becomes visible due to layout changes,
     the system asks the view to drawn its contents. For views that
     contain custom content using UIKit or Core Graphics, the system
     calls the view's drawRect:method. You implementation of this method
     is responsible for drawing the view's content into the current
     graphics context, which is set up by the system automatically prior
     to calling this method. This creates a static visual representation
     of your view's content that can then be displayed on the screen.
     
     When the actual content of your view changes, it is your responsibility
     to notify the system that your view needs to be redrawn. You do this
     by calling your view's setNeedDisplay or setNeedsDisplayInRect:
     method of the view. These methods let the system know that it should
     update the view during the next drawing cycle. Because it waits until
     the next drawing cycle to update the view. you can call these methods
     on multiple views to update them at the same time.
     
     ⚠️ If you are using OpenGL ES to to your drawingm you should use the
        GLKView class instead of subclassing UIView.
     */
    
    /**
     Animations
     
     Changes to several view properties can be animated--that is, changing
     the property creates an animation starting at the current value and
     ending at the new value that you specify. The following properties of
     the UIView classes are animatable:
     
     •  frame
     •  bounds
     •  center
     •  transform
     •  alpha
     •  backgroundColor
     
     To animate your changes, create a UIViewPropertyAnimator object and use
     its handler block to change the values of your view's properties. The
     UIViewPropertyAnimator class lets you specify the duration and timing
     of your animations, but it performs the actual animations. You can
     pause a property-based animator that is currently running to interrupt
     the animation and drive it interactively.
     */
    
    /**
     Threading Considerations
     
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
