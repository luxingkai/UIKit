//
//  AnimationAndHaptics.m
//  UIKit_Practice
//
//  Created by tigerfly on 2020/11/5.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "AnimationAndHaptics.h"

@interface AnimationAndHaptics ()<UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning
,UIViewControllerContextTransitioning,UIViewControllerInteractiveTransitioning,UIViewImplicitlyAnimating,UIViewControllerTransitionCoordinator,UIViewControllerTransitionCoordinatorContext>

@end

@implementation AnimationAndHaptics

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
     
     - UIViewControllerTransitioningDelegate
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
     
     - UIViewControllerAnimatedTransitioning
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
     
     - UIViewControllerContextTransitioning
     A set of methods that provide contextual information for transition
     animations between view controllers.
     */
    
    /**
     Interactive Transitions

     - UIPercentDrivenInteractiveTransition
     An object that drives an interactive animation between one view
     controller and another.
     
     - UIViewControllerInteractiveTransitioning
     A set of methods that enable an object (such as a navigation
     controller) to drive a view controller transition.
     
     - UIViewImplicitlyAnimating
     An interface for modifying an animation while it is running.
     */
    
    /**
     Transition Coordinators

     - UIViewControllerTransitionCoordinator
     A set of methods that provides support for animations associated
     with a view controller transition.
     
     - UIViewControllerTransitionCoordinatorContext
     A set of methods that provides information about an in-progress
     view controller transition.
     */
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 100, 20)];
    label.text = @"fasdfasfasdf";
    label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    label.textColor = [UIColor redColor];
    label.highlightedTextColor = [UIColor yellowColor];
    label.highlighted = YES;
    [self.view addSubview:label];
    
//    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"shfasdfasdfdas"];
//    [string addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:12],NSForegroundColorAttributeName:[UIColor redColor]} range:NSMakeRange(0, string.length)];
//    label.attributedText = string;
    
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
