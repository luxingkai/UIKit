//
//  AnimationAndHaptics.m
//  UIKit_Practice
//
//  Created by tigerfly on 2020/11/5.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "AnimationAndHaptics.h"

@interface CycleItme : UIView

@end

@implementation CycleItme

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

@end

@interface AnimationAndHaptics ()<UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning
,UIViewControllerContextTransitioning,UIViewControllerInteractiveTransitioning,UIViewImplicitlyAnimating,UIViewControllerTransitionCoordinator,UIViewControllerTransitionCoordinatorContext>

@end

@implementation AnimationAndHaptics {
    UIView *_partView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    /*
     Provide feedback to users using view-based animations and
     haptics.
     */
    
    
#pragma mark -- Content Animations
    
    /*
     Property-Based Animations
         
     Create animations by changing the properties of a view.
     */
    
    /**
     First Steps
     
     - UIViewePropertyAnimator
     A class that animates changes to views and allows the dynamic
     modification of those animations.
     
     - UIViewAnimating
     An interface for implementing custom animator objects.
     */
    
    /**
     Timing Curves
     
     - UITimingCurveProvider
     An interface for providing the timing information needed
     to perform animations.
     
     - UISpringTimingParameters
     The timing information for animations that mimics the behavior
     of a spring.
     
     - UICubicTimingParameters
     The timing information for animations in the form of a cubic
     Bézier curve.
     */
    
    /**
     In-Progress Animations
     
     An interface for modifying an animation while it is running.
     */
    
    
    
    
    /*
     View Controller Transitions
     
     Define custom transitions from one view controller to
     another.
     */
    
    /**
     Animation Delegate
     
     ● UIViewControllerTransitioningDelegate
     A set of methods that vend objects used to manage a
     fixed-length or interactive transition between view controllers.
     
     When you want to present a view controller using a custom modal
     presentation type, set its modalPresentationStyle property to
     custom and assign an object that conforms to this protocol to its
     transitioningDelegate property. When you present that view
     controller, UIKit queries your transitioning delegate for the
     objects to use when animating the view controller into position.
     
     When implementing your transitioning delegate object, you can
     return different animator objects depending on whether a view
     controller is being presented or dismissed. All transitions use
     a transition animator object—an object that conforms to the
     UIViewControllerAnimatedTransitioning protocol—to implement
     the basic animations. A transition animator object performs
     a set of animations over a finite period of time. If you want
     to use touch input or other user interactions to control the
     timing of the animation, you can also provide an interactive
     animator object—an object that conforms to the
     UIViewControllerInteractiveTransitioning protocol—to update
     the progress of the animations. You can provide separate animator
     objects for presenting and dismissing the view controller.
     
     For custom modal transition styles, you can provide a
     UIPresentationController object in addition to the animator
     objects. The system creates your presentation controller
     before presenting the view controller and keeps a reference
     to that object until the view controller is dismissed.
     Because its existence extends beyond the lifespan of either
     animator object, you can use the presentation controller
     to coordinate aspects of the presentation or dismissal
     process that would be difficult to do otherwise. For example,
     if your custom transition style involves displaying a
     separate shadow view as a backdrop to the view controller’s
     content, the presentation controller can create the
     shadow view and show it and hide it at the appropriate times.
     */
    
    /**
     Non-Interactive Transitions
     
     ● UIViewControllerAnimatedTransitioning
     A set of methods for implementing the animations for a custom view
     controller transition.
     
     The methods in this protocol let you define an animator
     object, which creates the animations for transitioning
     a view controller on or off screen in a fixed amount of
     time. The animations you create using this protocol must
     not be interactive. To create interactive transitions,
     you must combine your animator object with another object
     that controls the timing of your animations.
     
     In your animator object, implement the transitionDuration:
     method to specify the duration of your transition and
     implement the animateTransition: method to create the
     animations themselves. Information about the objects
     involved in the transition is passed to your animateTransition:
     method in the form of a context object. Use the
     information provided by that object to move the target view
     controller’s view on or off screen over the specified duration.
     
     Create your animator object from a transitioning delegate—an
     object that conforms to the UIViewControllerTransitioningDelegate
     protocol. When presenting a view controller, set the
     presentation style to UIModalPresentationCustom and assign
     your transitioning delegate to the view controller’s
     transitioningDelegate property. The view controller retrieves
     your animator object from the transitioning delegate and
     uses it to perform the animations. You can provide separate
     animator objects for presenting and dismissing the view
     controller.
     
     To add user interaction to a view controller transition,
     you must use an animator object together with an interactive
     animator object—a custom object that adopts the
     UIViewControllerInteractiveTransitioning protocol. For
     more on defining interactive transitions, see
     UIViewControllerInteractiveTransitioning.
     
     
     ● UIViewControllerContextTransitioning
     A set of methods that provide contextual information for transition
     animations between view controllers.
     
     Do not adopt this protocol in your own classes, nor should you
     directly create objects that adopt this protocol. During a
     transition, the animator objects involved in that transition
     receive a fully configured context object from UIKit. Custom
     animator objects—objects that adopt the
     UIViewControllerAnimatedTransitioning or
     UIViewControllerInteractiveTransitioning protocol—should simply
     retrieve the information they need from the provided object.
     
     A context object encapsulates information about the views and
     view controllers involved in the transition. It also contains
     details about the how to execute the transition. For interactive
     transitions, the interactive animator object uses the methods
     of this protocol to report the animation’s progress. When the
     animation starts, the interactive animator object must save a
     pointer to the context object. Based on user interactions,
     the animator object then calls the updateInteractiveTransition:,
     finishInteractiveTransition, or cancelInteractiveTransition
     methods to report the progress toward completing the animation.
     Those methods send that information to UIKit so that it can
     drive the timing of the animations.
     
     ⚠️ When defining custom animator objects, always check the
     value returned by the isAnimated method to determine whether
     you should create animations at all. And when you do create
     transition animations, always call the completeTransition:
     method from an appropriate completion block to let UIKit know
     when all of your animations have finished.
     */
    
    
    /**
     Interactive Transitions

     
     ● UIPercentDrivenInteractiveTransition
     An object that drives an interactive animation between one view
     controller and another.
     
     A percent-driven interactive transition object relies on a
     transition animator delegate—a custom object that adopts the
     UIViewControllerAnimatedTransitioning protocol—to set up and
     perform the animations.
     
     To use this concrete class, return an instance of it from
     your view controller delegate when asked for an interactive
     transition controller. As user events arrive that would
     affect the progress of a transition, call the
     updateInteractiveTransition:, cancelInteractiveTransition,
     and finishInteractiveTransition methods to reflect the
     current progress. For example, you might call these methods
     from a gesture recognizer to reflect how much of the gesture
     is completed.
     
     You can subclass UIPercentDrivenInteractiveTransition, but
     if you do so you must start each of your method overrides
     with a call to the super implementation of the method.
     
     
     ● UIViewControllerInteractiveTransitioning
     A set of methods that enable an object (such as a navigation
     controller) to drive a view controller transition.
     
     An interactive transition delegate (which is the term for
     an object that supports this protocol) can respond to touch
     events, or to time-varying programmatic input, by speeding
     up, slowing down, or even reversing the progress of a view
     controller transition. For example, an interactive transition
     on a navigation controller could respond to a swipe gesture
     by moving a view controller onto or off of the navigation stack.
     
     To support an interactive view controller transition, you
     must also provide a transition animator delegate, which
     is a custom object that adopts the
     UIViewControllerAnimatedTransitioning protocol. The
     transition delegate and the transition animator can, if
     you wish, be defined within a single custom class, but
     the class must adopt both protocols.
     
     If you instead want to provide a fixed-duration animated
     view controller transition—one that does not support user
     interaction—use a transition animator delegate on its own.
     Refer to UIViewControllerAnimatedTransitioning.
     
     For the methods you can call to retrieve view transition
     context information from within your
     startInteractiveTransition: method, refer to
     UIViewControllerContextTransitioning.
     
     
     ● UIViewImplicitlyAnimating
     An interface for modifying an animation while it is running.
     
     Animator objects used in interruptible view controller
     transitions adopt the UIViewImplicitlyAnimating protocol
     to modify in-flight transition animations. This protocol
     also conforms to the UIViewAnimating protocol, which
     specifies methods for starting and stopping animations
     and for updating their state.
     
     The UIViewPropertyAnimator class adopts this protocol and
     implements all of its methods. You can adopt this protocol
     in your own classes to implement custom animator objects.
     When adopting this protocol, it is recommended that you
     implement all of the methods.
     */
    
    
    /**
     Transition Coordinators

     ● UIViewControllerTransitionCoordinator
     A set of methods that provides support for animations associated
     with a view controller transition.
     
     Typically, you do not adopt this protocol in your own classes.
     When you present or dismiss a view controller, UIKit creates
     a transition coordinator object automatically and assigns it
     to the view controller’s transitionCoordinator property.
     That transition coordinator object is ephemeral and lasts
     for the duration of the transition animation.
     
     You can use a transition coordinator object to perform
     tasks that are related to a transition but that are separate
     from what the animator objects are doing. During a transition,
     the animator objects are responsible for putting the new
     view controller content onscreen, but there may be other
     visual elements that need to be displayed too. For example,
     a presentation controller might want to animate the
     appearance or disappearance of decoration views that are
     separate from the view controller content. In that case, it
     uses the transition coordinator to perform those animations.
     
     The transition coordinator works with the animator objects
     to ensure that any extra animations are performed in the
     same animation group as the transition animations. Having
     the animations in the same group means that they execute at
     the same time and can all respond to timing changes
     provided by an interactive animator object. These timing
     adjustments happen automatically and do not require any
     extra code on your part.
     
     Using the transition coordinator to handle view hierarchy
     animations is preferred over making those same changes in
     the viewWillAppear: or similar methods of your view
     controllers. The blocks you register with the methods of
     this protocol are guaranteed to execute at the same time
     as the transition animations. More importantly, the
     transition coordinator provides important information
     about the state of the transition, such as whether it was
     cancelled, to your animation blocks through the
     UIViewControllerTransitionCoordinatorContext object.
     
     In addition to registering animations to perform during
     the transition, you can call the
     notifyWhenInteractionEndsUsingBlock: method to register
     a block to clean up animations associated with an
     interactive transition. Cleaning up is particularly
     important when the user cancels a transition interactively.
     When a cancellation occurs, you need to return to the
     original view hierarchy state as it existed before the
     transition.
     
     Because the transition coordinator is in effect only
     during a transition, UIKit releases the object when the
     transition finishes and the final callback is made.
     
     
     ● UIViewControllerTransitionCoordinatorContext
     A set of methods that provides information about an in-progress
     view controller transition.
     
     Do not adopt this protocol in your own classes. UIKit
     creates an object that adopts this protocol and makes
     it available to your code when you animate changes
     using a transition coordinator object.
     
     A transition coordinator context provides most of the
     same information as an object that adopts the
     UIViewControllerContextTransitioning protocol. You use
     this contextual information to determine the animation
     parameters, such as the view in which the animations
     take place, whether the transition is interactive, or
     whether the transition was the result of an interface
     orientation change. You then apply that information to
     the animations you create.
     
     Most animations take place in the view returned by the
     containerView method. And at the time your animation
     blocks are executed, the view hierarchy already contains
     the view of the from view controller. You can use your
     animation blocks to animate additional content in that
     same container view or you can animate content in an
     entirely different view.
     */
    
    

#pragma mark -- Physics-Based Animations
    
    /*
     Apply plysics-based animations to your views.
     */
    
    /*
     Dynamic Animators
     
     UIDynamicAnimator
     An object that provides physics-related capabilities and
     animations for its dynamic items, and provides the context
     for those animations.
     
     A dynamic item is any iOS or custom object that conforms to
     the UIDynamicItem protocol. The UIView and
     UICollectionViewLayoutAttributes classes implement this
     protocol in iOS 7 and later. You can implement this protocol
     to use a dynamic animator with custom objects for such
     purposes as reacting to rotation or position changes
     computed by an animator.
     
     To use dynamics, configure one or more dynamic
     behaviors—including providing each with a set of dynamic
     items—and then add those behaviors to a dynamic animator.
     
     You specify dynamic behaviors using any of the iOS primitive
     dynamic behavior classes: UIAttachmentBehavior,
     UICollisionBehavior, UIDynamicItemBehavior, UIGravityBehavior,
     UIPushBehavior, and UISnapBehavior. Each of these provides
     configuration options and lets you associate one or more
     dynamic items to the behavior. To activate a behavior, add
     it to an animator.
     
     A dynamic animator interacts with each of its dynamic items
     as follows:
     
     1. Before adding an item to a behavior, you specify the
     item’s starting position, rotation, and bounds (to do so,
     use properties of the item’s class, such as the center,
     transform, and bounds properties in the case of a
     UIView-based item)
     
     2. After you add the behavior to an animator, the animator
     takes over: it updates the item’s position and rotation as
     animation proceeds (see the UIDynamicItem protocol)
     
     3. You can programmatically update an item’s state in the
     midst of an animation, after which the animator takes back
     control of the item’s animation, relative to the state you
     specified (see the updateItemUsingCurrentState: method)
     
     You can define composite behaviors using the addChildBehavior:
     method of the UIDynamicBehavior parent behavior class. The
     set of behaviors you add to an animator constitute a behavior
     hierarchy. Each behavior instance you associate with an
     animator can be present only once in the hierarchy.
     
     To employ a dynamic animator, first identify the type of
     dynamic items you want to animate. This choice determines
     which initializer to call, and this in turn determines
     how the coordinate system gets set up. The three ways to
     initialize an animator, the dynamic items you can then use,
     and the resulting coordinate system, are as follows:
     
     •  To animate views, create an animator with the
        initWithReferenceView: method. The coordinate system
        of the reference view serves as the coordinate system for
        the animator’s behaviors and items. Each dynamic item you
        associate with this sort of animator must be a UIView
        object and must descend from the reference view.
     
        You can define a boundary, for items participating in a
        collision behavior, relative to the bounds of the reference
        view. See the setTranslatesReferenceBoundsIntoBoundaryWithInsets:
        method.

     •  To animate collection views, create an animator with
        the initWithCollectionViewLayout: method. The resulting
        animator employs a collection view layout (an object of
        the UICollectionViewLayout class) for its coordinate system.
        The dynamic items in this sort of animator must be
        UICollectionViewLayoutAttributes objects that are part
        of the layout.
     
        You can define a boundary, for items participating in a
        collision behavior, relative to the bounds of the collection
        view layout. See the setTranslatesReferenceBoundsIntoBoundaryWithInsets:
        method.
     
        A collection view animator automatically calls the invalidateLayout
        method as needed, and automatically pauses and resumes animation,
        as appropriate, when you change a collection view’s layout.
     
     •  To employ a dynamic animator with other objects that conform
        to the UIDynamicItem protocol, create an animator with the
        inherited init method. The resulting animator employs an
        abstract coordinate system, not tied to the screen or to any view.
     
        There is no reference boundary to refer to when defining a
        collision boundary for use with this sort of animator. However,
        you can still, in a collision behavior, specify custom boundaries
        as described in UICollisionBehavior.
     
     All types of dynamic animators share the following characteristics:
     •  Each dynamic animator is independent of other dynamic animators
        you create
     
     •  You can associate a given dynamic item with multiple behaviors,
        provided those behaviors belong to the same animator
     
     •  An animator automatically pauses when all its items are at
        rest, and automatically resumes when a behavior parameter
        changes or a behavior or item is added or removed

     You can implement a delegate to respond to changes in animator
     pause/resumption status, using the dynamicAnimatorDidPause: and
     dynamicAnimatorWillResume: methods of the UIDynamicAnimatorDelegate
     protocol.
     */
    
    
    /*
     Dynamic Items

     - UIDynamicItem
     A set of methods that can make a custom object eligible to
     participate in UIKit Dynamics.
     
     - UIDynamicItemBehavior
     A base dynamic animation configuration for one or more dynamic items.
     
     - UIDynamicItemGroup
     A dynamic item that comprises multiple other dynamic items.
     */
    
    
    /*
     Behaviors
     
     - UIDynamicBehavior
     An object that confers a behavioral configuration on one or
     more dynamic items, for their participation in 2D animation.
     
     - UIAttachmentBehavior
     A relationship between two dynamic items, or between a dynamic
     item and an anchor point.
     
     - UICollisionBehavior
     An object that confers to a specified array of dynamic items
     the ability to engage in collisions with each other and with
     the behavior’s specified boundaries.
     
     - UIFieldBehavior
     An object that applies field-based physics to dynamic items.
     
     - UIGravityBehavior
     An object that applies a gravity-like force to all of its
     associated dynamic items.
     
     - UIPushBehavior
     A behavior that applies a continuous or instantaneous force
     to one or more dynamic items, causing those items to change
     position accordingly.
     
     - UISnapBehavior
     A spring-like behavior whose initial motion is damped over time
     so that the object settles at a specific point.
     */
    
    
    /*
     Animation Regions
     
     UIRegion
     A shape for use in UIKit Dynamics.
     */
    
    
    
#pragma mark -- Parallax Effects

    /*
     View-Based Effects
     
     - UIMotionEffectGroup
     A collection of motion effects that you want to apply to a
     view at the same time.
     
     - UIInterpolatingMotionEffect
     An object that maps the horizontal or vertical tilt of a
     device to values that you specify so that UIKit can apply
     those values to your views.
     */
    
    /*
     Custom Motion Effects
     
     UIMotionEffect
     An abstract superclass for defining motion-based modifiers
     for views.
     */
    
    
    
#pragma mark -- Haptic Feedback
    
    /*
     Provide haptic feedback in response to specific types of events.
     
     - UIFeedbackGenerator
     The abstract superclass for all feedback generators.
     
     - UIImpactFeedbackGenerator
     A concrete UIFeedbackGenerator subclass that creates haptics
     to simulate physical impacts.
     
     - UINotificationFeedbackGenerator
     A concrete UIFeedbackGenerator subclass that creates haptics
     to communicate successes, failures, and warnings.
     
     - UISelectionFeedbackGenerator
     A concrete UIFeedbackGenerator subclass that creates haptics
     to indicate a change in selection.
     */
    
    
//    UIFeedbackGenerator *feedbackGenerator = [UIFeedbackGenerator new];
//    [feedbackGenerator prepare];

    
    UIImpactFeedbackGenerator *impactFeedbackGenerator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
    [impactFeedbackGenerator prepare];
    [impactFeedbackGenerator impactOccurred];
//    UINotificationFeedbackGenerator
//    UISelectionFeedbackGenerator
    
    
    UILabel *label = [UILabel new];
    label.textColor = UIColor.redColor;
    
    
    
}

#pragma mark -- Animation Delegate
#pragma mark -- UIViewControllerTransitioningDelegate
 
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return self;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator {
    return self;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
    return self;
}

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source {
    return nil;
}



#pragma mark -- Non-Interactive Transitions

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 1;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
}

- (id <UIViewImplicitlyAnimating>) interruptibleAnimatorForTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    return self;
}
- (void)animationEnded:(BOOL) transitionCompleted {
    
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
