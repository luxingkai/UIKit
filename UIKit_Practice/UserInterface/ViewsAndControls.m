//
//  ViewsAndControls.m
//  UIKit_Practice
//
//  Created by tigerfly on 2020/11/5.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "ViewsAndControls.h"
#import "SubView.h"
#import "SGObject.h"
#import "Object.h"

@interface ViewsAndControls ()

@end

@implementation ViewsAndControls

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
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
     
     UIView is the root class for all views and defines their common
     behavior. UIControl defines additional behaviors that are
     specific to buttons, switches, and other views designed for
     user interactions.
     */
    
    
    
#pragma mark -- View Fundamentals
    
    /**
     UIView
     
     An object that manages the content for a rectangular area on the
     screen.
     
     Views are the fundamental building blocks of your app's user interface,
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
     
     ⚠️ If you are using OpenGL ES to to your drawing you should use the
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
     
     Manipulations to your application’s user interface must
     occur on the main thread. Thus, you should always call
     the methods of the UIView class from code running in the
     main thread of your application. The only time this may
     not be strictly necessary is when creating the view object
     itself, but all other manipulations should occur on the
     main thread.
     */
    
    /**
     Subclassing Notes
     
     The UIView class is a key subclassing point for visual
     content that also requires user interactions. Although
     there are many good reasons to subclass UIView, it is
     recommended that you do so only when the basic UIView
     class or the standard system views do not provide the
     capabilities that you need. Subclassing requires more
     work on your part to implement the view and to tune its
     performance.
     */
    
    /**
     Methods to Override

     When subclassing UIView, there are only a handful of
     methods you should override and many methods that you
     might override depending on your needs. Because UIView
     is a highly configurable class, there are also many ways
     to implement sophisticated view behaviors without
     overriding custom methods, which are discussed in the
     Alternatives to Subclassing section. In the meantime,
     the following list includes the methods you might consider
     overriding in your UIView subclasses:
     
     •  Initialization:
        ◦   initWithFrame: - It is recommended that you implement
            this method. You can also implement custom initialization
            methods in addition to, or instead of, this method.
        ◦   initWithCoder: - Implement this method if you load your
            view from storyboards or nib files and your view requires
            custom initialization.
        ◦   layerClass Use this property only if you want your view
            to use a different Core Animation layer for its backing
            store. For example, if your view uses tiling to display
            a large scrollable area, you might want to set the property
            to the CATiledLayer class.
        
     •  Drawing and printing:
        ◦   drawRect: - Implement this method if your view draws
            custom content. If your view does not do any custom drawing,
            avoid overriding this method.
        ◦   drawRect:forViewPrintFormatter: - Implement this method
            only if you want to draw your view’s content differently during printing.
     •  Layout and Constraints:
        ◦   requiresConstraintBasedLayout Use this property if your
            view class requires constraints to work properly.
        ◦   updateConstraints - Implement this method if your view
            needs to create custom constraints between your subviews.
        ◦   alignmentRectForFrame:, frameForAlignmentRect: - Implement
            these methods to override how your views are aligned to other views.
        ◦   didAddSubview:, willRemoveSubview: - Implement these methods as
            needed to track the additions and removals of subviews.
        ◦   willMoveToSuperview:, didMoveToSuperview - Implement these
            methods as needed to track the movement of the current view in
            your view hierarchy.
     •  Event Handling:
        ◦   gestureRecognizerShouldBegin: - Implement this method if
            your view handles touch events directly and might want to
            prevent attached gesture recognizers from triggering additional actions.
        ◦   touchesBegan:withEvent:, touchesMoved:withEvent:,
            touchesEnded:withEvent:,  touchesCancelled:withEvent:
            - Implement these methods if you need to handle touch events
            directly. (For gesture-based input, use gesture recognizers.)
     */
    
    
    /**
     Alternatives to Subclassing

     Many view behaviors can be configured without the need for
     subclassing. Before you start overriding methods, consider
     whether modifying the following properties or behaviors would
     provide the behavior you need.

     •  addConstraint: - Define automatic layout behavior for the
        view and its subviews.
     •  autoresizingMask - Provides automatic layout behavior when the
        superview’s frame changes. These behaviors can be combined
        with constraints.
     •  contentMode - Provides layout behavior for the view’s content,
        as opposed to the frame of the view. This property also
        affects how the content is scaled to fit the view and
        whether it is cached or redrawn.
     •  hidden or alpha - Change the transparency of the view as
        a whole rather than hiding or applying alpha to your view’s
        rendered content.
     •  backgroundColor - Set the view’s color rather than drawing
        that color yourself.
     •  Subviews - Rather than draw your content using a drawRect:
        method, embed image and label subviews with the content
        you want to present.
     •  Gesture recognizers - Rather than subclass to intercept and
        handle touch events yourself, you can use gesture recognizers
        to send an Target-Action to a target object.
     •  Animations - Use the built-in animation support rather than
        trying to animate changes yourself. The animation support
        provided by Core Animation is fast and easy to use.
     •  Image-based backgrounds - For views that display relatively
        static content, consider using a UIImageView object with
        gesture recognizers instead of subclassing and drawing the
        image yourself. Alternatively, you can also use a generic
        UIView object and assign your image as the content of the
        view’s CALayer object.
     
     Animations are another way to make visible changes to a view
     without requiring you to subclass and implement complex drawing
     code. Many properties of the UIView class are animatable, which
     means changes to those properties can trigger system-generated
     animations. Starting animations requires as little as one line
     of code to indicate that any changes that follow should be
     animated. For more information about animation support for
     views, see Animations.
     */
    
    
#pragma mark -- Container Views

    
#pragma mark -- Container Views


#pragma mark -- Content Views

    
#pragma mark -- Controls
    
    
#pragma mark -- Text Views
    
    
#pragma mark -- Search Field
    
    
#pragma mark -- Visual Effects
    
    

//    SubView *view = [[SubView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    view.backgroundColor = UIColor.redColor;
//    [self.view addSubview:view];
    
  
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    subView.backgroundColor = UIColor.yellowColor;
    [self.view addSubview:subView];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [subView addGestureRecognizer:panGesture];
    
    
    // Do any additional setup after loading the view.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = touches.allObjects.firstObject;
    NSLog(@"%@",touch);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    UITouch *touch = touches.allObjects.firstObject;
    UIView *touchView = touch.view;
    [UIView animateWithDuration:0.25 animations:^{
        if (CGRectEqualToRect(touchView.frame, [UIScreen mainScreen].bounds)) {
            touchView.frame = CGRectMake(100, 100, 100, 100);
        }else {
            touchView.frame = [UIScreen mainScreen].bounds;
        }
        [self.view.window addSubview:touchView];
    } completion:^(BOOL finished) {
    }];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
}


- (void)pan:(UIGestureRecognizer *)gesture {
    
    if (gesture.state == UIGestureRecognizerStateEnded) {
        
    }
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
