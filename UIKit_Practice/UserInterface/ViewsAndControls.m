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
#import <ImageIO/ImageIO.h>

@interface ViewsAndControls ()

@end

@implementation ViewsAndControls {
    UIView *_subView;
    CGRect _screenRect;
    CGPoint _began;
    CGPoint _change;
    CGFloat _scale;
    UILabel *_htmlDocument;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    _screenRect = self.view.frame;
    UIEdgeInsets safeArea = self.view.safeAreaInsets;
    NSLog(@"%@",NSStringFromUIEdgeInsets(safeArea));
    [self.view setNeedsLayout];
    
//    NSString *str = @"<html><head><style type=\"text/css\">body { font-family: Mehr Nastaliq Web; font-size: 22pt; white-space: pre-wrap; text-align: right; lang: en; direction: RTL; -webkit-user-select: none; meta charset=\"UTF-8\" }</style> </head><body leftmargin=\"20\" topmargin=\"0\" rightmargin=\"20\">hello world! Arabic.مُدّعا عَنقا ہے اپنے عالَمِ تقریر کا میری تقریر کا مفہوم چونکہ عنقا یعنی معدوم ہے اور معدوم </body></html>";
    
    
    
//    NSAttributedString *attributedStr = [[NSAttributedString alloc] initWithData:[str dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentOption:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    
    NSString *string = @"string";
    _htmlDocument = [[UILabel alloc] initWithFrame:CGRectMake(20, 300, 0, 0)];
    _htmlDocument.text = string;
    _htmlDocument.numberOfLines = 1;
    [self.view addSubview:_htmlDocument];
    
    [_htmlDocument sizeToFit];
    
    
    
//    CGSize fitSize = [htmlDocument sizeThatFits:CGSizeZero];
//    htmlDocument.frame = CGRectMake(20, 300, fitSize.width, fitSize.height);
    
    
    
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
     being nested (known as the subview) and the parent (known as the
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
            only if you want to draw your view’s content differently
            during printing.
     
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
    
    /**
     Creating a View Object
     
     - initWithFrame:
     Initializes and returns a newly allocated view object with the
     specified frame rectangle.
     
     - initWithCoder:
     */
    
    /**
     Configuring a View’s Visual Appearance
     
     backgroundColor
     The view’s background color.
     
     hidden
     A Boolean value that determines whether the view is hidden.
     
     alpha
     The view’s alpha value.
     
     opaque
     A Boolean value that determines whether the view is opaque.
     
     tintColor
     The first nondefault tint color value in the view’s hierarchy,
     ascending from and starting with the view itself.
     
     tintAdjustmentMode
     The first non-default tint adjustment mode value in the
     view’s hierarchy, ascending from and starting with the view itself.
     
     clipsToBounds
     A Boolean value that determines whether subviews are confined to
     the bounds of the view.
     
     clearsContextBeforeDrawing
     A Boolean value that determines whether the view’s bounds
     should be automatically cleared before drawing.
     
     maskView
     An optional view whose alpha channel is used to mask a
     view’s content.
     
     layerClass
     Returns the class used to create the layer for instances of
     this class.
     
     layer
     The view’s Core Animation layer used for rendering.
     */
    
    /**
     Configuring the Event-Related Behavior
     
     userInteractionEnabled
     A Boolean value that determines whether user events are ignored
     and removed from the event queue.
     
     multipleTouchEnabled
     A Boolean value that indicates whether the view receives more
     than one touch at a time.
     
     exclusiveTouch
     A Boolean value that indicates whether the receiver handles
     touch events exclusively.
     */
    
    
    /**
     Configuring the Bounds and Frame Rectangles
     
     frame
     The frame rectangle, which describes the view’s location
     and size in its superview’s coordinate system.
     
     bounds
     The bounds rectangle, which describes the view’s location
     and size in its own coordinate system.
     
     center
     The center point of the view's frame rectangle.
     
     transform
     Specifies the transform applied to the view, relative to
     the center of its bounds.
     */
    
    /**
     Managing the View Hierarchy
     
     superview
     The receiver’s superview, or nil if it has none.
     
     subviews
     The receiver’s immediate subviews.
     
     window
     The receiver’s window object, or nil if it has none.
     
     - addSubview:
     Adds a view to the end of the receiver’s list of subviews.
     
     - bringSubviewToFront:
     Moves the specified subview so that it appears on top of its
     siblings.
     
     - sendSubviewToBack:
     Moves the specified subview so that it appears behind its
     siblings.
     
     - removeFromSuperview
     Unlinks the view from its superview and its window, and
     removes it from the responder chain.
     
     - insertSubview:atIndex:
     Inserts a subview at the specified index.
     
     - insertSubview:aboveSubview:
     Inserts a view above another view in the view hierarchy.
     
     - insertSubview:belowSubview:
     Inserts a view below another view in the view hierarchy.
     
     - exchangeSubviewAtIndex:withSubviewAtIndex:
     Exchanges the subviews at the specified indices.
     
     - isDescendantOfView:
     Returns a Boolean value indicating whether the receiver is a
     subview of a given view or identical to that view.
     */
    
    /**
     Observing View-Related Changes
     
     - didAddSubview:
     Tells the view that a subview was added.
    ⚠️ The default implementation of this method does nothing. Subclasses can override it to perform additional actions when subviews are added. This method is called in response to adding a subview using any of the relevant view methods.
     
     - willRemoveSubview:
     Tells the view that a subview is about to be removed.
     
     - willMoveToSuperview:
     Tells the view that its superview is about to change to the
     specified superview.
     
     - didMoveToSuperview
     Tells the view that its superview changed.
     
     - willMoveToWindow:
     Tells the view that its window object is about to change.
     
     - didMoveToWindow
     Tells the view that its window object changed.
     */
    
    /**
     Configuring Content Margins

     directionalLayoutMargins
     The default spacing to use when laying out content in a view,
     taking into account the current language direction.
     
     layoutMargins
     The default spacing to use when laying out content in the view.
     
     preservesSuperviewLayoutMargins
     A Boolean value indicating whether the current view also
     respects the margins of its superview.
     
     - layoutMarginsDidChange
     Notifies the view that the layout margins changed.
     */
    
    /**
     Getting the Safe Area

     safeAreaInsets
     The insets that you use to determine the safe area for this view.
     
     safeAreaLayoutGuide
     The layout guide representing the portion of your view that
     is unobscured by bars and other content.
     
     - safeAreaInsetsDidChange
     Called when the safe area of the view changes.
     
     insetsLayoutMarginsFromSafeArea
     A Boolean value indicating whether the view's layout margins
     are updated automatically to reflect the safe area.
     */
    
    /**
     Managing the View’s Constraints

     constraints
     The constraints held by the view.
     
     - addConstraint:
     Adds a constraint on the layout of the receiving view or
     its subviews.
     
     - addConstraints:
     Adds multiple constraints on the layout of the receiving
     view or its subviews.
     
     - removeConstraint:
     Removes the specified constraint from the view.
     
     - removeConstraints:
     Removes the specified constraints from the view.
     */
    
    /**
     Creating Constraints Using Layout Anchors

     bottomAnchor
     A layout anchor representing the bottom edge of the view’s frame.
     
     centerXAnchor
     A layout anchor representing the horizontal center of the
     view’s frame.
     
     centerYAnchor
     A layout anchor representing the vertical center of the
     view’s frame.
     
     firstBaselineAnchor
     A layout anchor representing the baseline for the topmost
     line of text in the view.
     
     heightAnchor
     A layout anchor representing the height of the view’s frame.
     
     lastBaselineAnchor
     A layout anchor representing the baseline for the bottommost
     line of text in the view.
     
     leadingAnchor
     A layout anchor representing the leading edge of the view’s frame.
     
     leftAnchor
     A layout anchor representing the left edge of the view’s frame.
     
     rightAnchor
     A layout anchor representing the right edge of the view’s frame.
     
     topAnchor
     A layout anchor representing the top edge of the view’s frame.
     
     trailingAnchor
     A layout anchor representing the trailing edge of the view’s frame.
     
     widthAnchor
     A layout anchor representing the width of the view’s frame.
     */
    
    /**
     Working with Layout Guides
     
     - addLayoutGuide:
     Adds the specified layout guide to the view.
     
     layoutGuides
     The array of layout guide objects owned by this view.
     
     layoutMarginsGuide
     A layout guide representing the view’s margins.
     
     readableContentGuide
     A layout guide representing an area with a readable width
     within the view.
     
     - removeLayoutGuide:
     Removes the specified layout guide from the view.
     */
    
    
    /**
     Measuring in Auto Layout

     - systemLayoutSizeFittingSize:
     Returns the optimal size of the view based on its current
     constraints.
     
     - systemLayoutSizeFittingSize:withHorizontalFittingPriority:
     verticalFittingPriority:
     Returns the optimal size of the view based on its constraints
     and the specified fitting priorities.
     
     intrinsicContentSize
     The natural size for the receiving view, considering only
     properties of the view itself.
     ⚠️ Custom views typically have content that they display of which the layout system is unaware. Setting this property allows a custom view to communicate to the layout system what size it would like to be based on its content. This intrinsic size must be independent of the content frame, because there’s no way to dynamically communicate a changed width to the layout system based on a changed height, for example.

     If a custom view has no intrinsic size for a given dimension, it can use UIViewNoIntrinsicMetric for that dimension.
     
     
     - invalidateIntrinsicContentSize
     Invalidates the view’s intrinsic content size.
     
     - contentCompressionResistancePriorityForAxis:
     Returns the priority with which a view resists being made
     smaller than its intrinsic size.
     
     - setContentCompressionResistancePriority:forAxis:
     Sets the priority with which a view resists being made smaller
     than its intrinsic size.
     
     - contentHuggingPriorityForAxis:
     Returns the priority with which a view resists being made larger
     than its intrinsic size.
     
     - setContentHuggingPriority:forAxis:
     Sets the priority with which a view resists being made larger
     than its intrinsic size
     */
    
    
    /**
     Aligning Views in Auto Layout

     - alignmentRectForFrame:
     Returns the view’s alignment rectangle for a given frame.
     ⚠️ The constraint-based layout system uses alignment rectangles to align views, rather than their frame. This allows custom views to be aligned based on the location of their content while still having a frame that encompasses any ornamentation they need to draw around their content, such as shadows or reflections.
     
     The default implementation returns the view’s frame modified by the view’s alignmentRectInsets. Most custom views can use alignmentRectInsets to specify the location of their content within their frame. Custom views that require arbitrary transformations can override alignmentRectForFrame: and frameForAlignmentRect: to describe the location of their content. These two methods must always be inverses of each other.
     
     - frameForAlignmentRect:
     Returns the view’s frame for a given alignment rectangle.
     
     alignmentRectInsets
     The insets from the view’s frame that define its alignment rectangle.
     
     viewForFirstBaselineLayout
     Returns a view used to satisfy first baseline constraints.
     
     viewForLastBaselineLayout
     Returns a view used to satisfy last baseline constraints.
     */
    
    /**
     Triggering Auto Layout

     - needsUpdateConstraints
     A Boolean value that determines whether the view’s constraints
     need updating.
     
     - setNeedsUpdateConstraints
     Controls whether the view’s constraints need updating.
     
     - updateConstraints
     Updates constraints for the view.
    ⚠️ It is almost always cleaner and easier to update a constraint immediately after the affecting change has occurred. For example, if you want to change a constraint in response to a button tap, make that change directly in the button’s action method.
     You should only override this method when changing constraints in place is too slow, or when a view is producing a number of redundant changes.
     
     - updateConstraintsIfNeeded
     Updates the constraints for the receiving view and its subviews.
     */

    /**
     Debugging Auto Layout

     - constraintsAffectingLayoutForAxis:
     Returns the constraints impacting the layout of the view
     for a given axis.
     
     hasAmbiguousLayout
     A Boolean value that determines whether the constraints
     impacting the layout of the view incompletely specify the
     location of the view.
     
     - exerciseAmbiguityInLayout
     Randomly changes the frame of a view with an ambiguous layout
     between the different valid values.
     */
    
    /**
     Configuring the Resizing Behavior

     contentMode
     A flag used to determine how a view lays out its content
     when its bounds change.
     
     UIViewContentMode
     Options to specify how a view adjusts its content when its size changes.
     
     - sizeThatFits:
     Asks the view to calculate and return the size that best fits
     the specified size.
     
     - sizeToFit
     Resizes and moves the receiver view so it just encloses its subviews.
     
     autoresizesSubviews
     A Boolean value that determines whether the receiver automatically
     resizes its subviews when its bounds change.
     
     autoresizingMask
     An integer bit mask that determines how the receiver resizes itself
     when its superview’s bounds change.
     */
    
    /**
     Laying out Subviews
     Lay out views manually if your app does not use Auto Layout.

     - layoutSubviews
     Lays out subviews.
    ⚠️ The default implementation of this method does nothing on iOS 5.1 and earlier. Otherwise, the default implementation uses any constraints you have set to determine the size and position of any subviews.
     
     Subclasses can override this method as needed to perform more precise layout of their subviews. You should override this method only if the autoresizing and constraint-based behaviors of the subviews do not offer the behavior you want. You can use your implementation to set the frame rectangles of your subviews directly.

     You should not call this method directly. If you want to force a layout update, call the setNeedsLayout method instead to do so prior to the next drawing update. If you want to update the layout of your views immediately, call the layoutIfNeeded method.
     
     - setNeedsLayout
     Invalidates the current layout of the receiver and triggers
     a layout update during the next update cycle.
     
     - layoutIfNeeded
     Lays out the subviews immediately, if layout updates are pending.
     
     requiresConstraintBasedLayout
     A Boolean value that indicates whether the receiver depends
     on the constraint-based layout system.
     
     translatesAutoresizingMaskIntoConstraints
     A Boolean value that determines whether the view’s autoresizing
     mask is translated into Auto Layout constraints.
     */
    
    
    /**
     Adjusting the User Interface
     
     overrideUserInterfaceStyle
     The user interface style adopted by the view and all of its subviews.
     
     semanticContentAttribute
     A semantic description of the view’s contents, used to determine
     whether the view should be flipped when switching between
     left-to-right and right-to-left layouts.
     
     effectiveUserInterfaceLayoutDirection
     The user interface layout direction appropriate for arranging
     the immediate content of the view.
     
     + userInterfaceLayoutDirectionForSemanticContentAttribute:
     Returns the user interface direction for the given semantic
     content attribute.
     
     + userInterfaceLayoutDirectionForSemanticContentAttribute:relativeToLayoutDirection:
     Returns the layout direction implied by the specified semantic
     content attribute, relative to the specified layout direction.
     */
    
    
    /**
     Adding and Removing Interactions

     - addInteraction:
     Adds an interaction to the view.
     
     - removeInteraction:
     Removes an interaction from the view.
     
     interactions
     The array of interactions for the view.
     
     UIInteraction
     The protocol that an interaction implements to access the view that owns it.
     */
    UITextInteraction *interaction = [UITextInteraction new];
    
    
    /**
     Drawing and Updating the View

     - drawRect:
     Draws the receiver’s image within the passed-in rectangle.
     
     - setNeedsDisplay
     Marks the receiver’s entire bounds rectangle as needing
     to be redrawn.
     
     - setNeedsDisplayInRect:
     Marks the specified rectangle of the receiver as needing
     to be redrawn.
     
     contentScaleFactor
     The scale factor applied to the view.
     
     - tintColorDidChange
     Called by the system when the tintColor property changes.
     */
    
    
    /**
     Managing Gesture Recognizers

     - addGestureRecognizer:
     Attaches a gesture recognizer to the view.
     
     - removeGestureRecognizer:
     Detaches a gesture recognizer from the receiving view.
     
     gestureRecognizers
     The gesture-recognizer objects currently attached to the view.
     
     - gestureRecognizerShouldBegin:
     Asks the view if the gesture recognizer should be allowed
     to continue tracking touch events.
     */
    
    
    /**
     Observing Focus

     canBecomeFocused
     A Boolean value that indicates whether the view is currently
     capable of being focused.
     
     inheritedAnimationDuration
     Returns the inherited duration of the current animation.
     
     focused
     A Boolean value that indicates whether the item is currently focused.
     */
    
    
    /**
     Using Motion Effects

     - addMotionEffect:
     Begins applying a motion effect to the view.
     
     motionEffects
     The array of motion effects for the view.
     
     - removeMotionEffect:
     Stops applying a motion effect to the view.
     */
    
    
    /**
     Preserving and Restoring State

     restorationIdentifier
     The identifier that determines whether the view supports
     state restoration.
     
     - encodeRestorableStateWithCoder:
     Encodes state-related information for the view.
     
     - decodeRestorableStateWithCoder:
     Decodes and restores state-related information for the view.
     */
    
    
    /**
     Capturing a View Snapshot

     - snapshotViewAfterScreenUpdates:
     Returns a snapshot view based on the contents of the current view.
     
     - resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:
     Returns a snapshot view based on the specified contents of the
     current view, with stretchable insets.
     
     - drawViewHierarchyInRect:afterScreenUpdates:
     Renders a snapshot of the complete view hierarchy as visible
     onscreen into the current context.
     */
    
    
    /**
     Identifying the View at Runtime

     tag
     An integer that you can use to identify view objects in your
     application.
     
     - viewWithTag:
     Returns the view whose tag matches the specified value.
     */
    
    
    /**
     Converting Between View Coordinate Systems

     - convertPoint:toView:
     Converts a point from the receiver’s coordinate system to that
     of the specified view.
     
     - convertPoint:fromView:
     Converts a point from the coordinate system of a given view
     to that of the receiver.
     
     - convertRect:toView:
     Converts a rectangle from the receiver’s coordinate system to
     that of another view.
     
     - convertRect:fromView:
     Converts a rectangle from the coordinate system of another view
     to that of the receiver.
     */
    
    
    /**
     Hit Testing in a View

     - hitTest:withEvent:
     Returns the farthest descendant of the receiver in the view
     hierarchy (including itself) that contains a specified point.
     
     - pointInside:withEvent:
     Returns a Boolean value indicating whether the receiver contains
     the specified point.
     */
    
    
    /**
     Ending a View Editing Session

     - endEditing:
     Causes the view (or one of its embedded text fields) to resign
     the first responder status.
     */
    
    
    /**
     Animating Views with Block Objects

     + animateWithDuration:delay:options:animations:completion:
     Animate changes to one or more views using the specified
     duration, delay, options, and completion handler.
     
     + animateWithDuration:animations:completion:
     Animate changes to one or more views using the specified
     duration and completion handler.
     
     + animateWithDuration:animations:
     Animate changes to one or more views using the specified duration.
     
     + transitionWithView:duration:options:animations:completion:
     Creates a transition animation for the specified container view.
     
     + transitionFromView:toView:duration:options:completion:
     Creates a transition animation between the specified views
     using the given parameters.
     
     + animateKeyframesWithDuration:delay:options:animations:completion:
     Creates an animation block object that can be used to set up
     keyframe-based animations for the current view.
     
     + addKeyframeWithRelativeStartTime:relativeDuration:animations:
     Specifies the timing and animation values for a single frame
     of a keyframe animation.
     
     + performSystemAnimation:onViews:options:animations:completion:
     Performs a specified system-provided animation on one or more
     views, along with optional parallel animations that you define.
     
     + animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:
     options:animations:completion:
     Performs a view animation using a timing curve corresponding
     to the motion of a physical spring.
     
     + performWithoutAnimation:
     Disables a view transition animation.
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
    
    
    _subView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _subView.backgroundColor = UIColor.yellowColor;
    [self.view addSubview:_subView];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [_subView addGestureRecognizer:panGesture];
    
    
    UIImage *image = [UIImage imageNamed:@"2.gif"];
//    NSArray *images = image.images;
//
    CGDataProviderRef dataProviderRef = CGImageGetDataProvider(image.CGImage);
    CGImageSourceRef imageSourceRef = CGImageSourceCreateWithDataProvider(dataProviderRef, NULL);
    size_t count = CGImageSourceGetCount(imageSourceRef);
//
//
//    NSLog(@"%f",image.duration);
        
    
    // Do any additional setup after loading the view.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
//    UITouch *touch = touches.allObjects.firstObject;
//    NSLog(@"%@",touch);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
//    UITouch *touch = touches.allObjects.firstObject;
//    UIView *touchView = touch.view;
//    [UIView animateWithDuration:0.25 animations:^{
//        if (CGRectEqualToRect(touchView.frame, [UIScreen mainScreen].bounds)) {
//            touchView.frame = CGRectMake(100, 100, 100, 100);
//        }else {
//            touchView.frame = [UIScreen mainScreen].bounds;
//        }
//        [self.view.window addSubview:touchView];
//    } completion:^(BOOL finished) {
//    }];
    NSString *newStr = @"new banlance";
    _htmlDocument.text = newStr;
    [_htmlDocument sizeToFit];
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
}


- (void)pan:(UIGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        _began = [gesture locationInView:_subView];
        NSLog(@"began %@",NSStringFromCGPoint(_began));
    }
    if (gesture.state == UIGestureRecognizerStateChanged) {
        _change = [gesture locationInView:_subView];
        NSLog(@"change %@",NSStringFromCGPoint(_change));
        CGFloat move = fabs(_change.y - _began.y);
        _scale = move / 100.0;
        if (_scale >= 0.4) {return;}
        _subView.frame = CGRectMake(0, 0, _screenRect.size.width * (1 - _scale), _screenRect.size.height * (1 - _scale));
    }
    if (gesture.state == UIGestureRecognizerStateEnded) {
        if (_scale >= 0.4) {
            _subView.frame = CGRectMake(100, 100, 100, 100);
            [self.view addSubview:_subView];
        }else {
            _subView.frame = CGRectMake(0, 0, _screenRect.size.width, _screenRect.size.height);
        }
    }
    
    
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    NSLog(@"通过setNeedLayout方法触发重新布局方法");
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
