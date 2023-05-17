//
//  TouchesPressesGestures.m
//  UIKit_Practice
//
//  Created by tigerfly on 2020/11/5.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "TouchesPressesGestures.h"

@interface CollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) UIImageView *imageView;
@end

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [UIImageView new];
        self.imageView.backgroundColor = [UIColor systemGrayColor];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
}
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
}
- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
}


- (void)pressesBegan:(NSSet<UIPress *> *)presses withEvent:(UIPressesEvent *)event {
    [super pressesBegan:presses withEvent:event];
}

- (void)pressesChanged:(NSSet<UIPress *> *)presses withEvent:(UIPressesEvent *)event {
    [super pressesChanged:presses withEvent:event];
}

- (void)pressesEnded:(NSSet<UIPress *> *)presses withEvent:(UIPressesEvent *)event {
    [super pressesEnded:presses withEvent:event];
}

- (void)pressesCancelled:(NSSet<UIPress *> *)presses withEvent:(UIPressesEvent *)event {
    [super pressesCancelled:presses withEvent:event];
}

@end


@interface TouchesPressesGestures ()

@end

@implementation TouchesPressesGestures

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = UIColor.whiteColor;
    self.collectionView.backgroundColor = UIColor.whiteColor;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"identifier"];
    
    /*
     Encapsulate your app's event-handling logic in gesture
     recognizers so that you can reuse that code throughout
     your app.
     
     If you build your apps using standard UIKit views and controls,
     UIKit automatically handles touch events(including Multitouch
     events) for you. However, if you use custom views to display
     your content, you must handle all touch events that occur
     in your views. There are two ways to handle touch events
     yourself.
     •  Use gesture recognizers to track the touches;
     •  Track the touches directly in your UIView subclass;
     */
    
    
#pragma mark -- Using Responders and the Responder Chain to Handle Events
    
    /*
     Learn how to handle events that propagate through your app.
     
     Apps receive and handle events using responder objects. A responder
     object is any instance of the UIResponder class, and common subclass
     include UIView, UIViewController, and UIApplication. Responders
     receive the raw event data and must either handle the event or
     forward it to another responder object. When your app receives
     an event, UIKit automatically directs that event to the most
     appropriate responder object, known as the first responder.
     
     Unhandled events are passed from responder to responder in the
     active responder chain, which is the dynamic configuration
     of your app's responder objects. Figure 1 shows the responders
     in an app whose interface contains a label, a text field,
     a button, and two background views. The diagram also shows
     how events move from one responder to the next, following
     the responder chain.
     
     Figure 1 Responder chains in an app
     file:///Users/tigerfly/Desktop/UIKit/UIKit_Practice/f17df5bc-d80b-4e17-81cf-4277b1e0f6e4.png
     
     If the text field does not handle an event, UIKit sends the
     event to the text field’s parent UIView object, followed by
     the root view of the window. From the root view, the responder
     chain diverts to the owning view controller before directing
     the event to the window. If the window cannot handle the event,
     UIKit delivers the event to the UIApplication object, and
     possibly to the app delegate if that object is an instance of
     UIResponder and not already part of the responder chain.
     */
    
    
    /**
     Determining an Event's First Responder
     
     UIKit designates an object as the first responder to an
     event based on the type of that event. Event types include:
     
     file:///Users/tigerfly/Desktop/UIKit/UIKit_Practice/eventType.png
     
     ⚠️ Motion events related to the accelerometers, gyroscopes,
     and megnetometer do not follow the responder chain. Instead,
     Core Motion delivers those events directly to the designated
     object.
     
     Controls communicate directly with their associated target object
     using action messages. When the user interacts with a control, the
     control sends an action message to its target object. Action
     messages are not events, but they may still take advantage of the
     responder chain. When the target object of a control is nil,
     UIKit starts from the target object and traverses the responder
     chain until it finds an object that implements the appropriate
     action method. for example, the UIKit editing menu uses this
     behavior to search for responder objects that implement methods
     with names like cut:, copy:, or paste:.
     
     Gesture recognizers receive touch and press events before their
     view does. If a view's gesture recognizers fail to recognize
     a sequence of touches, UIKit sends the touches to the view. If
     the view does not handle the touches, UIKit passes them up the
     responder chain. For more information about using gesture
     recognizer’s to handle events, see Handling UIKit Gestures.
     */
    
    
    /**
     Determining Which Responder Contained a Touch Event
     
     UIKit uses view-based hit-testing to determine where touch
     events occur. Specifically, UIKit compares the touch location
     to the bounds of view objects in the view hierarchy. The
     hitTest:withEvent: method of UIView traverses the view hierarchy,
     looking for the deepest subview that contains the specified
     touch, which becomes the first responder for the touch event.
     
     ⚠️ If a touch location is outside of a view’s bounds, the
     hitTest:withEvent: method ignores that view and all of
     its subviews. As a result, when a view’s clipsToBounds property
     is NO, subviews outside of that view’s bounds are not returned
     even if they happen to contain the touch. For more information
     about the hit-testing behavior, see the discussion of the
     hitTest:withEvent: method in UIView.
     
     When a touch occurs, UIKit creates a UITouch object and
     associates it with a view. As the touch location or other
     parameters change, UIKit updates the same UITouch object with
     the new information. The only property that does not change
     is the view. (Even when the touch location moves outside the
     original view, the value in the touch’s view property does
     not change.) When the touch ends, UIKit releases the UITouch
     object.
     */
    
    /**
     Altering the Responder Chain
     
     You can alter the responder chain by overriding the nextResponder
     property of your responder objects. When you do this, the next
     responder is the object that you return.
     
     Many UIKit classes already override this property and return
     specific objects, including:
     •  UIView objects. If the view is the root view of a view controller,
     the next responder is the view controller; otherwise, the next
     responder is the view’s superview.
     •  UIViewController objects.
        ◦   If the view controller’s view is the root view of a window,
            the next responder is the window object.
        ◦   If the view controller was presented by another view
     controller, the next responder is the presenting view controller.
     •  UIWindow objects. The window's next responder is the UIApplication object.
     •  UIApplication object. The next responder is the app delegate, but
     only if the app delegate is an instance of UIResponder and is not a
     view, view controller, or the app object itself.
     */
    
    
    /*
     UIResponder
     
     An abstract interface for responding to and handling events.
     
     Responder objects—that is, instances of UIResponder—constitute
     the event-handling backbone of a UIKit app. Many key objects are
     also responders, including the UIApplication object,
     UIViewController objects, and all UIView objects (which includes
     UIWindow). As events occur, UIKit dispatches them to your app's
     responder objects for handling.
     
     There are several kinds of events, including touch events, motion
     events, remote-control events, and press events. To handle a
     specific type of event, a responder must override the corresponding
     methods.
     */
    
    
    /**
     Managing the Responder Chain
     
     - nextResponder
     Returns the next responder in the responder chain, or nil if there
     is no next responder.
     
     The UIResponder class does not store or set the next responder automatically,
     so this method returns nil by default. Subclasses must override this method
     and return an appropriate next responder. For example, UIView implements this
     method and returns the UIViewController object that manages it (if it has one)
     or its superview (if it doesn’t). UIViewController similarly implements the
     method and returns its view’s superview. UIWindow returns the application
     object. The shared UIApplication object normally returns nil, but it returns
     its app delegate if that object is a subclass of UIResponder and has not
     already been called to handle the event.
     
     
     - isFirstResponder
     Returns a Boolean value indicating whether this object is the first
     responder.
     
     
     - canBecomeFirstResponder
     Returns a Boolean value indicating whether this object can become
     the first responder.
     
     This method returns NO by default. Subclasses must override this method
     and return YES to be able to become first responder.
     Do not call this method on a view that is not currently in the active
     view hierarchy. The result is undefined.

     
     - becomeFirstResponder
     Asks UIKit to make this object the first responder in its window.
     
     Call this method when you want the current object to be the first responder.
     Calling this method is not a guarantee that the object will become the first
     responder. UIKit asks the current first responder to resign as first responder,
     which it might not. If it does, UIKit calls this object's canBecomeFirstResponder
     method, which returns NO by default. If this object succeeds in becoming
     the first responder, subsequent events targeting the first responder are
     delivered to this object first and UIKit attempts to display the object's
     input view, if any.
     
     Never call this method on a view that is not part of an active view hierarchy.
     You can determine whether the view is onscreen, by checking its window
     property. If that property contains a valid window, it is part of an active
     view hierarchy. If that property is nil, the view is not part of a valid
     view hierarchy.
     
     You can override this method in your custom responders to update your object's
     state or perform some action such as highlighting the selection. If you
     override this method, you must call super at some point in your implementation.
     
     
     - canResignFirstResponder
     Returns a Boolean value indicating whether the receiver is willing
     to relinquish first-responder status.
     
     - resignFirstResponder
     Notifies this object that it has been asked to relinquish its status
     as first responder in its window.
     */
    
    
    /**
     Responding to Touch Events
     
     - touchesBegan:withEvent:
     Tells this object that one or more new touches occurred in a view
     or window.
     
     - touchesMoved:withEvent:
     Tells the responder when one or more touches associated with
     an event changed.
     
     - touchesEnded:withEvent:
     Tells the responder when one or more fingers are raised from
     a view or window.
     
     - touchesCancelled:withEvent:
     Tells the responder when a system event (such as a system alert)
     cancels a touch sequence.
     
     - touchesEstimatedPropertiesUpdated:
     Tells the responder that updated values were received for previously
     estimated properties or that an update is no longer expected.
     */
    
    /**
     Responding to Motion Events
     
     - motionBegan:withEvent:
     Tells the receiver that a motion event has begun.
     
     - motionEnded:withEvent:
     Tells the receiver that a motion event has ended.
     
     - motionCancelled:withEvent:
     Tells the receiver that a motion event has been cancelled.
     */
    
    /**
     Responding to Press Events
     Generally, responders that handle press events should override
     all four of these methods.
     
     - pressesBegan:withEvent:
     Tells this object when a physical button is first pressed.
     
     - pressesChanged:withEvent:
     Tells this object when a value associated with a press has changed.
     
     - pressesEnded:withEvent:
     Tells the object when a button is released.
     
     - pressesCancelled:withEvent:
     Tells this object when a system event (such as a low-memory warning)
     cancels a press event.
     */
    
    /**
     Responding to Remote-Control Events
     
     - remoteControlReceivedWithEvent:
     Tells the object when a remote-control event is received.
     */
    
    /**
     Managing Input Views
     
     inputView
     The custom input view to display when the receiver becomes the
     first responder.
     
     inputViewController
     The custom input view controller to use when the receiver
     becomes the first responder.
     
     inputAccessoryView
     The custom input accessory view to display when the receiver
     becomes the first responder.
     
     inputAccessoryViewController
     The custom input accessory view controller to display when the
     receiver becomes the first responder.
     
     - reloadInputViews
     Updates the custom input and accessory views when the object
     is the first responder.
     */
    
    /**
     Getting the Undo Manager
     
     undoManager
     Returns the nearest shared undo manager in the responder chain.
     */
    
    /**
     Building and Validating Commands
     
     - buildMenuWithBuilder:
     Asks the receiving responder to add and remove items from a menu system.
     
     - validateCommand:
     Asks the receiving responder to validate the command.
     
     - canPerformAction:withSender:
     Requests the receiving responder to enable or disable the specified
     command in the user interface.
     
     - targetForAction:withSender:
     Returns the target object that responds to an action.
     */
    
    /**
     Accessing the Available Key Commands
     
     keyCommands
     The key commands that trigger actions on this responder.
     */
    
    /**
     Managing the Text Input Mode
     
     - textInputMode
     The text input mode for this responder object.
     
     - textInputContextIdentifier
     An identifier signifying that the responder should preserve its
     text input mode information.
     
     + clearTextInputContextIdentifier:
     Clears text input mode information from the app’s user defaults.
     
     - inputAssistantItem
     The input assistant to use when configuring the keyboard’s shortcuts bar.
     */
    
    
    /**
     Supporting User Activities
     
     userActivity
     An object encapsulating a user activity supported by this responder.
     
     - restoreUserActivityState:
     Restores the state needed to continue the given user activity.
     
     - updateUserActivityState:
     Updates the state of the given user activity.
     */
    
    
    /**
     Constants
     
     - UIKeyboardAnimationCurveUserInfoKey
     The key for an NSNumber object containing a UIViewAnimationCurve
     constant that defines how the keyboard will be animated onto or
     off the screen.
     
     - UIKeyboardAnimationDurationUserInfoKey
     The key for an NSNumber object containing a double that identifies
     the duration of the animation in seconds.
     
     - UIKeyboardDidChangeFrameNotification
     Posted immediately after a change in the keyboard’s frame.
     
     - UIKeyboardDidHideNotification
     Posted immediately after the dismissal of the keyboard.
     
     - UIKeyboardDidShowNotification
     Posted immediately after the display of the keyboard.
     
     - UIKeyboardFrameBeginUserInfoKey
     The key for an NSValue object containing a CGRect that
     identifies the starting frame rectangle of the keyboard
     in screen coordinates. The frame rectangle reflects the
     current orientation of the device.
     
     - UIKeyboardFrameEndUserInfoKey
     The key for an NSValue object containing a CGRect that
     identifies the ending frame rectangle of the keyboard
     in screen coordinates. The frame rectangle reflects the
     current orientation of the device.
     
     - UIKeyboardIsLocalUserInfoKey
     The key for an NSNumber object containing a Boolean that
     identifies whether the keyboard belongs to the current app.
     With multitasking on iPad, all visible apps are notified
     when the keyboard appears and disappears. The value of this
     key is YES for the app that caused the keyboard to appear
     and NO for any other apps.
     
     - UIKeyboardWillChangeFrameNotification
     Posted immediately prior to a change in the keyboard’s frame.
     
     - UIKeyboardWillHideNotification
     Posted immediately prior to the dismissal of the keyboard.
     
     - UIKeyboardWillShowNotification
     Posted immediately prior to the display of the keyboard.
     */
    
    
    /*
     UIEvent
     
     An object that describes a single user interaction with
     your app.
     
     Apps can receive many different types of events, including
     touch events, motion events, remote-control events, and
     press events. Touch events are the most common and are
     delivered to the view in which the touch originally occurred.
     Motion events are UIKit triggered and aer separate from
     the motion events reported by the Core Motion framework.
     Remote-control events allow a responder object to receive
     commands from an external accessory or headset so that
     it can manage audio and  video -- for example, playing a
     video or skipping to the next audio track. Press events
     represent interactions with a game controller. AppleTV
     remote, or other device that has physical buttons. You
     can determine the type of an event using the type and
     subtype properties.
     
     A touch event object contains the touches (that is,
     the fingeres on the screen) that have some relation
     to the event. A touch event object may contain one or
     more touches, and each touch is represented by a
     UITouch object. When a touch event occurs, the system
     routes it to the appropriate responder and calls the
     approriate method, such as touchesBegan:withEvent:.
     The responder then uses the touches to determine an
     appropriate course of action.
     
     During a multitouch sequence, UIKit reuses the same
     UIEvent object when delivering updated touch data to
     your app. You should never retain an event object or
     any object returned from an event object. If you need
     to retain data outside of the responder method you use
     to process that data, copy that data from the UITouch
     or UIEvent object to your local data structures.
     */
    
    /**
     Getting the Touches for an Event

     allTouches
     Returns all touches associated with the event.
     
     - touchesForView:
     Returns the touch objects from the event that belong to
     the specified given view.
     
     - touchesForWindow:
     Returns the touch objects from the event that belong to
     the specified window.
     
     - coalescedTouchesForTouch:
     Returns all of the touches associated with the specified
     main touch.
     
     - predictedTouchesForTouch:
     Returns an array of touches that are predicted to occur for
     the specified touch.
     */
    
    /**
     Getting Event Attributes

     - timestamp
     The time when the event occurred.
     */
    
    /**
     Getting the Event Type
     
     type
     Returns the type of the event.
     
     subtype
     Returns the subtype of the event.
     */
    
    /**
     Getting the Touches for a Gesture Recognizer
     
     - touchesForGestureRecognizer:
     Returns the touch objects that are being delivered to the
     specified gesture recognizer.
     */
    
    
    
#pragma mark -- Touches
    
    /*
     UITouch
     
     An object representing the location, size, movement, and
     force of a touch occurring on the screen.

     You access touch objects through UIEvent objects passed
     into responder objects for event handling. A touch object
     includes accessors for:
     
     •  The view or window in which the touch occurred
     •  The location of the touch within the view or window
     •  The approximate radius of the touch
     •  The force of the touch (on devices that support 3D Touch
        or Apple Pencil)

     A touch object also contains a timestamp indicating when the
     touch occurred, an integer representing the number of times
     the user tapped the screen, and the phase of the touch in
     the form of a constant that describes whether the touch began,
     moved, or ended, or whether the system canceled the touch.
     
     To learn how to work with swipes, read Handling Swipe and
     Drag Gestures in Event Handling Guide for UIKit Apps.
     
     A touch object persists throughout a multi-touch sequence.
     You may store a reference to a touch while handling a
     multi-touch sequence, as long as you release that reference
     when the sequence ends. If you need to store information
     about a touch outside of a multi-touch sequence, copy that
     information from the touch.
     
     The gestureRecognizers property of a touch contains the
     gesture recognizers currently handling the touch. Each
     gesture recognizer is an instance of a concrete subclass
     of UIGestureRecognizer.
     */
    
    
    /**
     Getting the Location of a Touch
     
     - locationInView:
     Returns the current location of the receiver in the coordinate
     system of the given view.
     
     - previousLocationInView:
     Returns the previous location of the receiver in the coordinate
     system of the given view.
     
     view
     The view to which touches are being delivered, if any.
     
     window
     The window in which the touch initially occurred.
     
     majorRadius
     The radius (in points) of the touch.
     
     majorRadiusTolerance
     The tolerance (in points) of the touch’s radius.
     
     - preciseLocationInView:
     Returns a precise location for the touch, when available.
     
     - precisePreviousLocationInView:
     Returns a precise previous location for the touch, when available.
     */
    
    
    /**
     Getting Touch Attributes
     
     tapCount
     The number of times the finger was tapped for this
     given touch.
     
     timestamp
     The time when the touch occurred or when it was last
     mutated.
     
     type
     The type of the touch.
     
     UITouchType
     The type of touch received.
     
     phase
     The phase of the touch.
     
     UITouchPhase
     The phase of a touch event.
     
     force
     The force of the touch, where a value of 1.0 represents the
     force of an average touch (predetermined by the system, not
     user-specific).
     
     maximumPossibleForce
     The maximum possible force for a touch.
     
     altitudeAngle
     The altitude (in radians) of the stylus.
     
     - azimuthAngleInView:
     Returns the azimuth angle (in radians) of the stylus.
     
     - azimuthUnitVectorInView:
     Returns a unit vector that points in the direction of the
     azimuth of the stylus.
     */
    
    /**
     Managing Estimated Touch Attributes
     
     estimatedProperties
     A set of touch properties whose values contain only estimates.
     
     estimatedPropertiesExpectingUpdates
     The set of touch properties for which updated values are expected
     in the future.
     
     UITouchProperties
     A bit mask of touch properties that may get updated.
     
     estimationUpdateIndex
     An index number that lets you correlate an updated touch
     with the original touch.
     */
    
    
    /**
     Getting a Touch Object’s Gesture Recognizers

     gestureRecognizers
     The gesture recognizers that are receiving the touch object.
     */
    
    /**
     Working with Touch Events in Sprite Kit
     
     - locationInNode:
     Returns the current location of the receiver in the coordinate
     system of the given node.
     
     - previousLocationInNode:
     Returns the previous location of the receiver in the coordinate
     system of the given node.
     */
    
    
    
#pragma mark -- Button Pressse
    
    /*
     UIPress
     
     An object that represents the presence or movement of a
     button press on the screen for a particular event.
     
     The press specifically encapsulates the pressing of some
     physically actuated button. All of the press types represent
     actual physical buttons on one of a variety of remotes. You
     access UIPress objects through UIEvent objects passed into
     responder objects for event handling. The gestureRecognizers
     property returns the gesture recognizers—that is, instances
     of a concrete subclass of UIGestureRecognizer—that are
     currently handling the given button press.
     */
    
    /**
     Getting a Press Object’s Gesture Recognizers

     force
     The force of the button press.
     
     gestureRecognizers
     The gesture recognizers that are receiving the press.
     */
    
    /**
     Responding to Press Events
     
     responder
     A UIResponder object.
     */
    
    /**
     Getting the Press’s Location
     
     window
     The window in which the press initially occurred.
     */
    
    /**
     Getting Press Attributes
     
     key
     The key pressed or released on a physical keyboard.
     
     type
     The type of the specified press.
     
     phase
     The current press phase of the object.
     
     timestamp
     The time when the press occurred or when it was last mutated.
     */
    
    /**
     Constants
     
     UIPressPhase
     The phases of a button press.
     
     UIPressType
     Constants that represent buttons that a user can press.
     */
    
    
    
    /*
     UIPressesEvent
     
     An event that describes the state of a set of physical
     buttons that are available to the device, such as those
     on an associated remote or game controller.
     */
    
    /**
     Reading the Event Button Presses

     allPresses
     Returns the state of all physical buttons in the event.
     
     - pressesForGestureRecognizer:
     Returns the state of all physical buttons in the event that
     are associated with a particular gesture recognizer.
     */
    
    
#pragma mark -- Standard Gestures
    
    /*
     UIHoverGestureRecognizer
     UILongPressGestureRecognizer
     UIPanGestureRecognizer
     UIPinchGestureRecognizer
     UIRotationGestureRecognizer
     UIScreenEdgePanGestureRecognizer
     UISwipeGestureRecognizer
     UITapGestureRecognizer
     */
    
    
#pragma mark -- Custom Gestures
    
    /*
     UIGestureRecognizer

     The base class for concrete gesture recognizers.
     
     A gesture-recognizer object—or, simply, a gesture
     recognizer—decouples the logic for recognizing a sequence
     of touches (or other input) and acting on that recognition.
     When one of these objects recognizes a common gesture or,
     in some cases, a change in the gesture, it sends an action
     message to each designated target object.
     
     The concrete subclasses of UIGestureRecognizer are the following:
     •  UITapGestureRecognizer
     •  UIPinchGestureRecognizer
     •  UIPinchGestureRecognizer
     •  UISwipeGestureRecognizer
     •  UIPanGestureRecognizer
     •  UIScreenEdgePanGestureRecognizer
     •  UILongPressGestureRecognizer
     
     The UIGestureRecognizer class defines a set of common
     behaviors that can be configured for all concrete gesture
     recognizers. It can also communicate with its delegate
     (an object that adopts the UIGestureRecognizerDelegate
     protocol), thereby enabling finer-grained customization
     of some behaviors.
     
     A gesture recognizer operates on touches hit-tested to a
     specific view and all of that view’s subviews. It thus must
     be associated with that view. To make that association you
     must call the UIView method addGestureRecognizer:. A gesture
     recognizer doesn’t participate in the view’s responder chain.
     
     A gesture recognizer has one or more target-action pairs
     associated with it. If there are multiple target-action
     pairs, they are discrete, and not cumulative. Recognition
     of a gesture results in the dispatch of an action message
     to a target for each of the associated pairs. The action
     methods invoked must conform to one of the following signatures:
     ================================================
     - (void)handleGesture;
     - (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer
     ================================================
     
     Methods conforming to the latter signature permit the target
     in some cases to query the gesture recognizer sending the
     message for additional information. For example, the target
     could ask a UIRotationGestureRecognizer object for the angle
     of rotation (in radians) since the last invocation of the
     action method for this gesture. Clients of gesture recognizers
     can also ask for the location of a gesture by calling
     locationInView: or locationOfTouch:inView:.
     
     The gesture interpreted by a gesture recognizer can be
     either discrete or continuous. A discrete gesture, such
     as a double tap, occurs but once in a multi-touch sequence
     and results in a single action sent. However, when a
     gesture recognizer interprets a continuous gesture such
     as a rotation gesture, it sends an action message for each
     incremental change until the multi-touch sequence concludes.
     
     A window delivers touch events to a gesture recognizer before
     it delivers them to the hit-tested view attached to the
     gesture recognizer. Generally, if a gesture recognizer analyzes
     the stream of touches in a multi-touch sequence and doesn’t
     recognize its gesture, the view receives the full complement
     of touches. If a gesture recognizer recognizes its gesture,
     the remaining touches for the view are cancelled. The usual
     sequence of actions in gesture recognition follows a path
     determined by default values of the cancelsTouchesInView,
     delaysTouchesBegan, delaysTouchesEnded properties:
     
     •  cancelsTouchesInView—If a gesture recognizer recognizes
        its gesture, it unbinds the remaining touches of that gesture
        from their view (so the window won’t deliver them). The window
        cancels the previously delivered touches with a
        (touchesCancelled:withEvent:) message. If a gesture recognizer
        doesn’t recognize its gesture, the view receives all touches
        in the multi-touch sequence.
     •  delaysTouchesBegan—As long as a gesture recognizer, when
        analyzing touch events, has not failed recognition of its
        gesture, the window withholds delivery of touch objects in
        the UITouchPhaseBegan phase to the attached view. If the
        gesture recognizer subsequently recognizes its gesture,
        the view doesn’t receive these touch objects. If the gesture
        recognizer doesn’t recognize its gesture, the window delivers
        these objects in an invocation of the view’s touchesBegan:withEvent:
        method (and possibly a follow-up touchesMoved:withEvent: invocation
        to inform it of the touches current location).
     •  delaysTouchesEnded—As long as a gesture recognizer, when analyzing
        touch events, has not failed recognition of its gesture, the
        window withholds delivery of touch objects in the UITouchPhaseEnded
        phase to the attached view. If the gesture recognizer subsequently
        recognizes its gesture, the touches are cancelled (in a
        touchesCancelled:withEvent: message). If the gesture recognizer
        doesn’t recognize its gesture, the window delivers these objects
        in an invocation of the view’s touchesEnded:withEvent: method.
     
     Note that "recognize” in the above descriptions doesn’t necessarily
     equate to a transition to the Recognized state.
     */
    
    /**
     Subclassing Notes
     
     You may create a subclass of UIGestureRecognizer that recognizes
     a distinctive gesture—for example, a “check mark” gesture. If
     you are going to create such a concrete gesture recognizer, be
     sure to import the UIGestureRecognizerSubclass.h header file.
     This header file declares all the methods and properties a
     subclass must either override, call, or reset.
     
     Gesture recognizers operate within a predefined state machine,
     transitioning to subsequent states as they handle multi-touch
     events. The states and their possible transitions differ for
     continuous and discrete gestures. All gesture recognizers begin
     a multi-touch sequence in the Possible state
     (UIGestureRecognizerStatePossible). Discrete gestures transition
     from Possible to either Recognized
     (UIGestureRecognizerStateRecognized) or Failed
     (UIGestureRecognizerStateFailed), depending on whether they
     successfully interpret the gesture or not. If the gesture
     recognizer transitions to Recognized, it sends its action
     message to its target.
     
     For continuous gestures, the state transitions a gesture
     recognizer might make are more numerous, as indicated in
     the following diagram:
     •  Possible ----> Began ----> [Changed] ----> Cancelled
     •  Possible ----> Began ----> [Changed] ----> Ended
     
     The Changed state is optional and may occur multiple times
     before the Cancelled or Ended state is reached. The gesture
     recognizer sends action messages at each state transition.
     Thus for a continuous gesture such as a pinch, action messages
     are sent as the two fingers move toward or away from each
     other. The enum constants representing these states are of
     type UIGestureRecognizerState. (Note that the constants for
     Recognized and Ended states are synonymous.)
     
     Subclasses must set the state property to the appropriate
     value when they transition between states.
     */
    
    /**
     Methods to Override

     The methods that subclasses must override are described
     in Methods for Subclasses. Subclasses must also periodically
     reset the state property (as described above) and may call
     the ignoreTouch:forEvent: method.
     */
    
    /**
     Special Considerations

     The state property is declared in UIGestureRecognizer.h as
     being read-only. This property declaration is intended for
     clients of gesture recognizers. Subclasses of UIGestureRecognizer
     must import UIGestureRecognizerSubclass.h. This header file
     contains a redeclaration of state that makes it read-write.
     */

    /**
     Initializing a Gesture Recognizer
     
     - initWithTarget:action:
     Initializes an allocated gesture-recognizer object with a
     target and an action selector.
     */
    
    /**
     Managing Gesture-Related Interactions
     
     delegate
     The delegate of the gesture recognizer.
     
     UIGestureRecognizerDelegate
     A set of methods implemented by the delegate of a gesture
     recognizer to fine-tune an app’s gesture-recognition behavior.
     */
    
    /**
     Adding and Removing Targets and Actions
     
     - addTarget:action:
     Adds a target and an action to a gesture-recognizer object.
     
     - removeTarget:action:
     Removes a target and an action from a gesture-recognizer object.
     */
    
    /**
     Getting the Touches and Location of a Gesture
     
     - locationInView:
     Returns the point computed as the location in a given view of
     the gesture represented by the receiver.
     
     - locationOfTouch:inView:
     Returns the location of one of the gesture’s touches in the
     local coordinate system of a given view.
     
     numberOfTouches
     Returns the number of touches involved in the gesture
     represented by the receiver.
     */
    
    /**
     Getting the Recognizer’s State and View
     
     state
     The current state of the gesture recognizer.
     
     view
     The view the gesture recognizer is attached to.
     
     enabled
     A Boolean property that indicates whether the gesture
     recognizer is enabled.
     
     buttonMask
     A bit mask of the button (or buttons) in the gesture represented
     by the receiver.
     
     modifierFlags
     The bit mask of modifier flags in the gesture represented by the receiver.
     */
    
    /**
     Canceling and Delaying Touches
     
     cancelsTouchesInView
     A Boolean value affecting whether touches are delivered to
     a view when a gesture is recognized.
     
     delaysTouchesBegan
     A Boolean value determining whether the receiver delays sending
     touches in a begin phase to its view.
     
     delaysTouchesEnded
     A Boolean value determining whether the receiver delays sending
     touches in a end phase to its view.
     */
    
    /**
     Specifying Dependencies Between Gesture Recognizers
     
     - requireGestureRecognizerToFail:
     Creates a dependency relationship between the receiver and
     another gesture recognizer when the objects are created.
     */
    
    /**
     Recognizing Different Gestures
     
     allowedPressTypes
     An array of press types used to distinguish the type of button press.
     
     allowedTouchTypes
     An array of touch types used to distinguish type of touches.
     
     requiresExclusiveTouchType
     A Boolean indicating whether the gesture recognizer considers
     touches of different types simultaneously.
     */
    
    /**
     Methods for Subclasses

     The UIGestureRecognizerSubclass.h header file contains a
     class extension that declares methods intended to be called
     or overridden only by subclasses of UIGestureRecognizer.
     Clients that merely use concrete subclasses of
     UIGestureRecognizer must never call these methods
     (except for those noted).
     
     - touchesBegan:withEvent:
     Sent to the gesture recognizer when one or more fingers
     touch down in the associated view.
     
     - touchesMoved:withEvent:
     Sent to the gesture recognizer when one or more fingers
     move in the associated view.
     
     - touchesEnded:withEvent:
     Sent to the gesture recognizer when one or more fingers
     lift from the associated view.
     
     - touchesCancelled:withEvent:
     Sent to the gesture recognizer when a system event (such
     as an incoming phone call) cancels a touch event.
     
     - touchesEstimatedPropertiesUpdated:
     Sent to the gesture recognizer when the estimated properties
     for a touch have changed so that they are no longer estimated,
     or an update is no longer expected.
     
     - reset
     Overridden to reset internal state when a gesture recognition
     attempt completes.
     
     - ignoreTouch:forEvent:
     Tells the gesture recognizer to ignore a specific touch of
     the given event.
     
     - canBePreventedByGestureRecognizer:
     Overridden to indicate that the specified gesture recognizer
     can prevent the receiver from recognizing a gesture.
     
     - canPreventGestureRecognizer:
     Overridden to indicate that the receiver can prevent the
     specified gesture recognizer from recognizing its gesture.
     
     - shouldRequireFailureOfGestureRecognizer:
     Overridden to indicate that the receiver requires the specified
     gesture recognizer to fail.
     
     - shouldBeRequiredToFailByGestureRecognizer:
     Overridden to indicate that the receiver should be required
     to fail by the specified gesture recognizer.
     
     - ignorePress:forEvent:
     Tells the gesture recognizer to ignore a specific press of
     the given event.
     
     - pressesBegan:withEvent:
     Sent to the receiver when a physical button is pressed in
     the associated view.
     
     - pressesChanged:withEvent:
     Sent to the receiver when the force of the press has changed
     in the associated view.
     
     - pressesEnded:withEvent:
     Sent to the receiver when a button is released from the
     associated view.
     
     - pressesCancelled:withEvent:
     Sent to the receiver when a system event (such as a low-memory
     warning) cancels a press event.
     */
    
    /**
     Debugging Gesture Recognizers
     
     name
     The name associated with the gesture recogniz
     */
    
    
    /*
     UIGestureRecognizerDelegate
     
     A set of methods implemented by the delegate of a gesture
     recognizer to fine-tune an app’s gesture-recognition behavior.

     The delegates receive messages from a gesture recognizer,
     and their responses to these messages enable them to affect
     the operation of the gesture recognizer or to specify a
     relationship between it and another gesture recognizer, such
     as allowing simultaneous recognition or setting up a dynamic
     failure requirement.
     
     An example of a situation where dynamic failure requirements
     are useful is in an app that attaches a screen-edge pan
     gesture recognizer to a view. In this case, you might want
     all other relevant gesture recognizers associated with that
     view's subtree to require the screen-edge gesture recognizer
     to fail so you can prevent any graphical glitches that might
     occur when the other recognizers get canceled after starting
     the recognition process. To do this, you could use code similar
     to the following:
     =================================================================
     UIScreenEdgePanGestureRecognizer *myScreenEdgePanGestureRecognizer;
     ...
     myScreenEdgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer
     alloc] initWithTarget:self action:@selector(handleScreenEdgePan:)];
     myScreenEdgePanGestureRecognizer.delegate = self;
     // Configure the gesture recognizer and attach it to the view.
     ...
      - (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
         BOOL result = NO;
         if ((gestureRecognizer == myScreenEdgePanGestureRecognizer) && [[otherGestureRecognizer view] isDescendantOfView:[gestureRecognizer view]]) {
             result = YES;
         }
         return result;
      }
     =================================================================
     */
    
    /**
     Regulating Gesture Recognition
     
     - gestureRecognizerShouldBegin:
     Asks the delegate if a gesture recognizer should begin
     interpreting touches.
     
     - gestureRecognizer:shouldReceiveTouch:
     Asks the delegate if a gesture recognizer should receive an
     object representing a touch.
     
     - gestureRecognizer:shouldReceivePress:
     Asks the delegate if a gesture recognizer should receive an
     object representing a press.
     
     - gestureRecognizer:shouldReceiveEvent:
     Asks the delegate if a gesture recognizer should receive an
     object representing a touch or press event.
     */
    
    /**
     Controlling Simultaneous Gesture Recognition

     - gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:
     Asks the delegate if two gesture recognizers should be allowed to
     recognize gestures simultaneously.
     */
    
    /**
     Setting Up Failure Requirements

     - gestureRecognizer:shouldRequireFailureOfGestureRecognizer:
     Asks the delegate if a gesture recognizer should require another
     gesture recognizer to fail.
     
     - gestureRecognizer:shouldBeRequiredToFailByGestureRecognizer:
     Asks the delegate if a gesture recognizer should be required
     to fail by another gesture recognizer.
     */
    
    
    
#pragma mark -- 3D Touch Interactions
    
    /*
     UIPreviewInteraction
     
     A class that registers a view to provide a custom user
     experience in response to 3D Touch interactions.

     A 3D Touch interaction results in a preview interaction that
     comprises two phases, the first also called preview, followed
     by commit. The interaction progresses through these phases
     as the user applies more force with a touch. Figure 1 shows
     the relationship between the force of the user's touch and
     the phases of the preview interaction.
     
     Figure 1 Relationship between touch force and preview
     interaction phases
     file:///Users/tigerfly/Desktop/UIKit/UIKit_Practice/dce480c1-31f8-446c-bd2a-4f7fe5be9e67.png
     
     When using view controller previewing, peek represents the
     preview phase, and pop the commit phase.

     ⚠️ If you want to provide the system default view controller
     previewing behavior (peek and pop), use the
     registerForPreviewingWithDelegate:sourceView: and
     unregisterForPreviewingWithContext: methods on UIViewController
     instead of UIPreviewInteraction. See Working With 3D Touch
     Previews and Preview Quick Actions for further details.
     
     A preview interaction is responsible for managing 3D Touch
     interactions for a specified view. It uses a delegate object
     to communicate the progress and status of the interaction
     to your code.

     To use a preview interaction in your app:
     1.Create a UIPreviewInteraction object, passing the view into
     the default initializer.
     2.Create a delegate object that conforms to the
     UIPreviewInteractionDelegate protocol, and implement the
     appropriate methods.
     3.Assign the delegate object to the delegate property on the
     preview interaction object.
     
     For more information about the state transitions through which
     a preview interaction progresses, see UIPreviewInteractionDelegate.
     */
    
    /**
     Preparing Preview Interactions
     
     - initWithView:
     Returns a newly initialized preview interaction for the specified view.
     
     delegate
     An object that acts as the delegate of the preview interaction.
     */
    
    /**
     Handling Preview Interactions
     
     view
     The view from which the preview interaction receives touch events.
     
     - cancelInteraction
     Cancels the current preview interaction.
     
     - locationInCoordinateSpace:
     Returns the location of the touch that started the interaction.
     */
    
    
    /*
     UIPreviewInteractionDelegate
     
     A set of methods for communicating the progress of a preview
     interaction.

     A preview interaction abstracts a 3D Touch interaction into
     a state machine and communicates its progress through the
     state machine via a delegate. The developer is responsible
     for implementing the appropriate UI behavior.
     
     Create an object that conforms to this protocol and assign
     it to the delegate property on an instance of UIPreviewInteraction.
     Use this delegate object to respond to the state changes that
     occur within the preview interaction as the user performs 3D
     Touch interactions.
     */
    
    /**
     Controlling Preview Interaction State Changes
     
     The methods on UIPreviewInteractionDelegate allow you to
     control whether a preview interaction is allowed to begin,
     and to observe its progress through the phases of a preview
     interaction. This allows you to provide a custom user
     experience while maintaining coherence with the system.
     
     A preview interaction consists of two main phases: preview
     and commit. Figure 1 is a visualization of the underlying
     state machine associated with a preview interaction.
     
     Figure 1 Phases, transitions, and delegate methods of a
     preview interaction
     file:///Users/tigerfly/Desktop/UIKit/UIKit_Practice/b3e7fb84-c7ea-4244-8190-91da128965d6.png
     
     The previewInteractionShouldBegin: method is called as the
     user begins to press on a view that has a preview interaction
     associated with it. Implement this method and return NO to
     prevent the preview interaction from continuing. Returning
     YES, or not implementing this optional method, will allow
     the preview interaction to continue.
     
     Once a preview interaction begins, it enters the first
     phase—also called preview—through which it progresses as
     the user presses harder on the view. During this phase,
     the previewInteraction:didUpdatePreviewTransition:ended:
     method is called repeatedly, reporting the progress
     through the transition as a CGFloat with a value from 0
     to 1. Implement this method and use the transitionProgress
     parameter to update the UI, providing visual feedback to
     the user.
     
     When the ended parameter changes from NO to YES, the preview
     interaction transitions to the second phase—commit. There
     are no further calls to the
     previewInteraction:didUpdatePreviewTransition:ended: delegate
     method.
     
     The progress through the commit phase is reported to the previewInteraction:didUpdateCommitTransition:ended: delegate
     method. Implement this method and use the transitionProgress
     parameter to update the UI appropriately. The preview
     interaction is said to be completed when the ended parameter
     is true, at which point you should complete any UI changes.
     
     At any point before the preview interaction is completed, it
     can be canceled, either when the user lifts their finger from
     the screen, or when the cancelInteraction method is called
     on the UIPreviewInteraction instance. When this happens, the
     previewInteractionDidCancel: delegate method is called. You
     should use this method to cancel any UI transitions currently
     in progress.
     */
    
    /**
     Preview Interaction User Interface Updates

     UIPreviewInteraction abstracts 3D Touch interactions away
     from touch force, allowing you to provide your own user
     interface updates for an interaction pattern that is well
     understood by your users. The preview interaction sits
     between view controller previewing (peek and pop) and the
     force values in UITouch, in that you are required to provide
     your own user interface updates but don't need to handle
     raw touch force values.
     
     It is important that during the preview and commit phases,
     you update the UI in such a way that the user is aware that
     the interaction is taking place. For example, pressing a
     table row in the Mail app first progressively blurs the
     other rows (the preview phase), and then shows a popover
     of the email as the commit phase begins. Throughout the
     commit phase, the popover grows, before finally transitioning
     to the email detail view at the end of the commit phase.
     
     You can provide any user experience you want to accompany
     the preview and commit phases, but be sure to follow the
     appropriate section on 3D Touch in the iOS Human Interface
     Guidelines. Consider using UIViewPropertyAnimator to
     implement the UI changes that track the progress through
     the preview and commit phases of the preview interaction.
     This class allows you to build an animation and then
     scrub through that animation, using the fractionComplete
     property. This maps perfectly to the transitionProgress
     property provided in the
     previewInteraction:didUpdatePreviewTransition:ended: and
     previewInteraction:didUpdateCommitTransition:ended: methods,
     allowing you to use UIViewPropertyAnimator to update the UI
     in response to the user's touch force.
     */
    
    /**
     Preview Interaction Delegate Methods

     - previewInteractionShouldBegin:
     Asks the delegate whether a preview interaction is allowed to begin.
     
     - previewInteraction:didUpdatePreviewTransition:ended:
     Informs the delegate of the progress through the preview phase of
     the preview interaction.
     Required.
     
     - previewInteraction:didUpdateCommitTransition:ended:
     Informs the delegate of the preview interaction's progress
     through the commit phase.
     
     - previewInteractionDidCancel:
     Informs the delegate that the specified preview interaction was canceled.
     Required.
     */
    
    
    /*
     UIPreviewActionItem
     
     A set of methods that defines the styles you can apply to
     peek quick actions and peek quick action groups, and defines
     a read-only accessor for the user-visible title of a peek
     quick action.

     ⚠️ Do not adopt this protocol in custom classes.
     
     The UIPreviewActionItem protocol is adopted by the UIPreviewAction
     and UIPreviewActionGroup classes.
     */
    
    /**
     Accessing Peek Quick Action Properties
     
     title
     The peek quick action item’s title.
     Required.
     */
    
    /**
     Constants
     
     UIPreviewActionStyle
     The style for a peek quick action. Use these styles with
     instances of the UIPreviewAction and UIPreviewActionGroup classes.
     */
     
    
    
}



#pragma mark -- Touch Events

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
}

- (void)touchesEstimatedPropertiesUpdated:(NSSet<UITouch *> *)touches {
    [super touchesEstimatedPropertiesUpdated:touches];
    
}


#pragma mark -- Motion Events

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
}
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
}
- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
}


#pragma mark -- Press Events

- (void)pressesBegan:(NSSet<UIPress *> *)presses withEvent:(UIPressesEvent *)event {
    [super pressesBegan:presses withEvent:event];
}

- (void)pressesChanged:(NSSet<UIPress *> *)presses withEvent:(UIPressesEvent *)event {
    [super pressesChanged:presses withEvent:event];
}

- (void)pressesEnded:(NSSet<UIPress *> *)presses withEvent:(UIPressesEvent *)event {
    [super pressesEnded:presses withEvent:event];
}

- (void)pressesCancelled:(NSSet<UIPress *> *)presses withEvent:(UIPressesEvent *)event {
    [super pressesCancelled:presses withEvent:event];
}



#pragma mark --

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 12;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"identifier" forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    CGRect convertRect = [cell.imageView convertRect:cell.imageView.frame toView:self.view.window];
    [UIView animateWithDuration:.25 animations:^{
        [self.view.window addSubview:cell.imageView];
        cell.imageView.frame = convertRect;
    } completion:^(BOOL finished) {
        //        [cell.imageView insertSubview:self.view.window atIndex:0];
        //        [self.view.window addSubview:cell.imageView];
    }];
    
}


- (UIResponder *)nextResponder {
    [super nextResponder];
    
    return self;
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
