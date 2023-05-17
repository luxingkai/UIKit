//
//  ViewControllers.m
//  UIKit_Practice
//
//  Created by tigerfly on 2020/11/5.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "ViewControllers.h"

@interface ViewControllers ()

@end

@implementation ViewControllers

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    /*
     Manage your interface using view controllers and facilitate
     navigation around your app's content.
     
     You use view controllers to manage your UIKit app's interface.
     A view controller manages a single root view, which may itself
     contain any number of subviews. User interactions with that view
     hierarchy are handled by your view controller, which coordinates
     with other objects of your app as needed. Every app has at least
     one view controller whose content fills the main window. If your
     app has more content than can fit onscreen at once, use multiple
     view controllers to manage different parts of that content.
     
     A container view controller embeds the content of other view controllers
     into its own root view. A container view controller may mix custom
     views with the contents of its child view controllers to facilitate
     navigation or to create unique interfaces. For example, a
     UINavigationController object manages a navigation bar and stack of
     child view controllers (only one of which is visible at a time), and
     provides an API to add and remove child view Controllers from the stack.
     
     UIKit provides several standard view controllers for navigation
     and managing specific types of content. You define the view controllers
     containing your app's custom content. You may also define custom
     container view controllers to implement new navigation schemes.
     */
    
    
#pragma mark -- Essentials
    
    /*
     Managing Content in Your App's Windows
     
     Build your app’s user interface from view controllers,
     and change the currently visible view controller when you
     want to display new content.
     
     Each scene in your app’s UI contains a window object and one
     or more view objects. The window serves as an invisible container
     for the rest of your UI, acts as a top-level container for your
     views, and routes events to them. The views provide the actual
     content that users see onscreen, drawing text, images, and other
     types of custom content. Windows are long-lived objects, and
     you dismiss them only when tearing down your scene's entire UI.
     By contrast, you might change the views in that window frequently,
     particularly when you want to display new content or information.
     
     file:///Users/tigerfly/Desktop/UIKit/UIKit_Practice/333dfbf3-7ed5-486b-a701-6bac67218be7.png
     
     To manage your views effectively and to make it easy to add and
     remove them from a window, UIKit provides view controllers.
     A view controller manages a single set of views for your app, and
     it keeps the information in those views up-to-date. Each window
     has a root view controller, which you use to specify the window's
     initial set of views. When you want to change that set of views,
     you tell UIKit to present or dismiss additional view controllers.
     UIKit handles the transition from one set of views to another,
     and manages your app's entire interface through your view controller
     objects. As a result, view controllers play an important role in
     implementing your UI.
     */
    
    
#pragma mark -- Content View Controllers
    
    
#pragma mark -- Container View Controllers
    
    /*
     UISplitViewController
     */
    
    /*
     UINavigationController
     
     A container view controller that defines a stack-based scheme for navigating
     hierarchical content.
     
     A navigation controller is a container view controller that manages one or
     more child view controllers in a navigation interface. In this type of interface,
     only one child view controller is visible at a time. Selecting an item in the
     view controller pushes a new view controller onscreen using an animation,
     thereby hiding the previous view controller. Tapping the back button in the
     navigation bar at the top of the interface removes the top view controller,
     thereby revealing the view controller underneath.
     
     Use a navigation interface to mimic the organization of hierarchical data
     managed by your app. At each level of the hierarchy, you provide an appropriate
     screen (managed by a custom view controller) to display the content at that
     level. Figure 1 shows an example of the navigation interface presented by the
     Settings application in iOS Simulator. The first screen presents the user with
     the list of applications that contain preferences. Selecting an application
     reveals individual settings and groups of settings for that application.
     Selecting a group yields more settings and so on. For all but the root view,
     the navigation controller provides a back button to allow the user to move
     back up the hierarchy.
     
     A navigation controller object manages its child view controllers using an
     ordered array, known as the navigation stack. The first view controller
     in the array is the root view controller and represents the bottom of the
     stack. The last view controller in the array is the topmost item on the
     stack, and represents the view controller currently being displayed. You
     add and remove view controllers from the stack using segues or using the
     methods of this class. The user can also remove the topmost view controller
     using the back button in the navigation bar or using a left-edge swipe
     gesture.
     
     The navigation controller manages the navigation bar at the top of the
     interface and an optional toolbar at the bottom of the interface. The
     navigation bar is always present and is managed by the navigation controller
     itself, which updates the navigation bar using the content provided by
     its child view controllers. When the isToolbarHidden property is false,
     the navigation controller similarly updates the toolbar with contents
     provided by the topmost view controller.
     
     A navigation controller coordinates its behavior with its delegate object.
     The delegate object can override the pushing or popping of view controllers,
     provide custom animation transitions, and specify the preferred orientation
     for the navigation interface. The delegate object you provide must conform
     to the UINavigationControllerDelegate protocol.
     
     Figure 2 shows the relationships between the navigation controller and the
     objects it manages. Use the specified properties of the navigation controller
     to access these objects.
     file:///Users/tigerfly/Desktop/UIKit/UIKit_Practice/nav_controllers_objects_a8447aef-d652-4ab9-85d1-1eb8e4876e12.jpg
     
     == Navigation Controller Views
     A navigation controller is a container view controller—that is, it embeds the
     content of other view controllers inside of itself. You access a navigation
     controller’s view from its view property. This view incorporates the navigation
     bar, an optional toolbar, and the content view corresponding to the topmost
     view controller. Figure 3 shows how these views are assembled to present the
     overall navigation interface. (In this figure, the navigation interface is
     further embedded inside a tab bar interface.) Although the content of the
     navigation bar and toolbar views changes, the views themselves do not. The
     only view that actually changes is the custom content view provided by the
     topmost view controller on the navigation stack.
     
     Because the content view underlaps the navigation bar in iOS 7 and later,
     you must consider that space when designing your view controller content.
     
     The navigation controller manages the creation, configuration, and display
     of the navigation bar and optional navigation toolbar. It is permissible to
     customize the navigation bar’s appearance-related properties but you must
     never change its frame, bounds, or alpha values directly. If you subclass
     UINavigationBar, you must initialize your navigation controller using the
     init(navigationBarClass:toolbarClass:) method. To hide or show the navigation
     bar, use the isNavigationBarHidden property or
     setNavigationBarHidden(_:animated:) method.

     A navigation controller builds the contents of the navigation bar
     dynamically using the navigation item objects (instances of the
     UINavigationItem class) associated with the view controllers on the
     navigation stack. To customize the overall appearance of a navigation
     bar, use UIAppearance APIs. To change the contents of the navigation
     bar, you must therefore configure the navigation items of your custom
     view controllers. For more information about navigation items, see
     UINavigationItem.
     
     == Updating the Navigation Bar
     
     Each time the top-level view controller changes, the navigation controller
     updates the navigation bar accordingly. Specifically, the navigation controller
     updates the bar button items displayed in each of the three navigation bar
     positions: left, middle, and right. Bar button items are instances of the
     UIBarButtonItem class. You can create items with custom content or create
     standard system items depending on your needs.
     
     Tinting of the navigation bar is controlled by properties of the navigation
     bar itself. Use the tintColor property to change the tint color of items
     in the bar and use the barTintColor property to change the tint color of
     the bar itself. Navigation bars do not inherit their tint color from the
     currently displayed view controller.
     
     For more information about the navigation bar, see UINavigationBar. For
     more information about how to create bar button items, see UIBarButtonItem.
     
     == The Left Item

     For all but the root view controller on the navigation stack, the item on
     the left side of the navigation bar provides navigation back to the previous
     view controller. The contents of this left-most button are determined as
     follows:
     
     If the new top-level view controller has a custom left bar button item, that
     item is displayed. To specify a custom left bar button item, set the
     leftBarButtonItem property of the view controller’s navigation item.
     
     If the top-level view controller does not have a custom left bar button
     item, but the navigation item of the previous view controller has an object
     in its backBarButtonItem property, the navigation bar displays that item.
     
     If a custom bar button item is not specified by either of the view controllers,
     a default back button is used and its title is set to the value of the title
     property of the previous view controller—that is, the view controller one
     level down on the stack. (If there is only one view controller on the
     navigation stack, no back button is displayed.)
     
     == The Middle Item
     The navigation controller updates the middle of the navigation bar as
     follows:
     •  If the new top-level view controller has a custom title view, the navigation
     bar displays that view in place of the default title view. To specify a custom
     title view, set the titleView property of the view controller’s navigation item.
     
     •  If no custom title view is set, the navigation bar displays a label containing
     the view controller’s default title. The string for this label is usually
     obtained from the title property of the view controller itself. If you want
     to display a different title than the one associated with the view controller,
     set the title property of the view controller’s navigation item instead.

     == The Right Item
     
     The navigation controller updates the right side of the navigation bar as follows:
     •  If the new top-level view controller has a custom right bar button item, that
     item is displayed. To specify a custom right bar button item, set the
     rightBarButtonItem property of the view controller’s navigation item.
     •  If no custom right bar button item is specified, the navigation bar displays
     nothing on the right side of the bar.
     
     == Interface Behaviors
     A navigation controller supports the following behaviors for its interface:
     •  Supported interface orientations—A navigation controller object does not
     consult the view controllers on its navigation stack when determining the
     supported interface orientations. On iPhone, a navigation controller supports
     all orientations except portrait upside-down. On iPad, a navigation controller
     supports all orientations. If the navigation controller has a delegate object,
     the delegate can specify a different set of supported orientations using the
     navigationControllerSupportedInterfaceOrientations(_:) method.
     •  Presentation context—A navigation controller defines the presentation context
     for modally presented view controllers. When the modal transition style is
     UIModalPresentationStyle.currentContext or
     UIModalPresentationStyle.overCurrentContext, modal presentations from the
     view controllers in the navigation stack cover the entire navigation interface.
     
     == State Preservation
     When you assign a value to a navigation controller’s restorationIdentifier
     property, it attempts to preserve itself and the child view controllers on
     its navigation stack. The navigation controller starts at the bottom of the
     stack and moves upward, encoding each view controller that also has a valid
     restoration identifier string. During the next launch cycle, the navigation
     controller restores the preserved view controllers to the navigation stack
     in the same order that they were preserved.
     
     The child view controllers you push onto the navigation stack may use the
     same restoration identifiers. The navigation controller automatically stores
     additional information to ensure that each child’s restoration path is unique.
     When you assign a value to a navigation controller’s restorationIdentifier
     property, it attempts to preserve itself and the child view controllers on
     its navigation stack. The navigation controller starts at the bottom of the
     stack and moves upward, encoding each view controller that also has a valid
     restoration identifier string. During the next launch cycle, the navigation
     controller restores the preserved view controllers to the navigation stack
     in the same order that they were preserved.
     
     The child view controllers you push onto the navigation stack may use the
     same restoration identifiers. The navigation controller automatically stores
     additional information to ensure that each child’s restoration path is unique.
     */
    
    
    /*
     UINavigationBar
     
     Navigational controls that display in a bar along the top of the screen,
     usually in conjunction with a navigation controller.

     A UINavigationBar object is a bar, typically displayed at the top of
     the window, containing buttons for navigating within a hierarchy of
     screens. The primary components are a left (back) button, a center title,
     and an optional right button. You can use a navigation bar as a standalone
     object or in conjunction with a navigation controller object.
     
     A navigation bar is most commonly used within a navigation controller.
     The UINavigationController object creates, displays, and manages its
     associated navigation bar, and uses attributes of the view controllers
     you add to control the content displayed in the navigation bar.
     
     To control a navigation bar when using a navigation controller, the following
     steps are required:
     •  Create a navigation controller in Interface Builder or in the code.
     •  Configure the appearance of the navigation bar using the navigationBar
        property on the UINavigationController object.
     •  Control the content of the navigation bar by setting the title and
        navigationItem properties on each UIViewController you push onto the
        navigation controller’s stack.
     
     You can also use a standalone navigation bar, without using a navigation
     controller. To add a navigation bar to your interface, the following steps
     are required:
     •  Set up Auto Layout rules to govern the position of the navigation bar in
        your interface.
     •  Create a root navigation item to supply the initial title.
     •  Configure a delegate object to handle user interactions with the 
        navigation bar.
     •  Customize the appearance of the navigation bar.
     •  Configure your app to push and pop relevant navigation items as the
        user navigates through the hierarchical screens.
     
     == Add Content to a Standalone Navigation Bar

     In the vast majority of scenarios you will use a navigation bar as part
     of a navigation controller. However, there are situations for which you
     might want to use the navigation bar UI and implement your own approach
     to content navigation. In these situations, you can use a standalone
     navigation bar.
     
     When you use a navigation bar as a standalone object, you are responsible
     for providing its content. Unlike other types of views, you do not add
     subviews to a navigation bar directly. Instead, you use a navigation item
     (an instance of the UINavigationItem class) to specify what buttons or
     custom views you want displayed. A navigation item has properties for
     specifying views on the left, right, and center of the navigation bar
     and for specifying a custom prompt string.
     
     A navigation bar manages a stack of UINavigationItem objects. Although
     the stack is there mostly to support navigation controllers, you can
     use it to implement your own custom navigation interface. The topmost
     item in the stack represents the navigation item whose contents are
     currently displayed by the navigation bar. You push new navigation
     items onto the stack using the pushItem(_:animated:) method and pop
     items off the stack using the popItem(animated:) method. Both of these
     changes can be animated for the benefit of the user.

     In addition to pushing and popping items, you can also set the contents
     of the stack directly using either the items property or the
     setItems(_:animated:) method. You might use this method at launch time
     to restore your interface to its previous state or to push or pop more
     than one navigation item at a time. The following figure shows the part
     of the UINavigationBar API responsible for managing the stack of
     navigation items.
     file:///Users/tigerfly/Desktop/UIKit/UIKit_Practice/536711f8-0b4b-4ecd-a086-3b8c6feb1a6c.png

     If you are using a navigation bar as a standalone object, assign a custom
     delegate object to the delegate property and use that object to intercept
     messages coming from the navigation bar. Delegate objects must conform
     to the UINavigationBarDelegate protocol. The delegate notifications let
     you track when navigation items are pushed or popped from the stack.
     You use these notifications to update the rest of your app’s user interface.
     
     
     == Customize the Appearance of a Navigation Bar

     Navigation bars have two standard appearance styles: white with dark text
     or black with light text. Use the barStyle property to select the style.
     Any changes you make to other navigation bar appearance properties override
     those inferred from the bar style.
     
     Navigation bars are translucent by default; that is, their background color
     is semitransparent. You can make the navigation bar opaque by setting the
     isTranslucent property to false.
     
     You can specify a custom tint color for a navigation bar background using
     the barTintColor property. Setting this property overrides the default
     color inferred from the bar style. As with all UIView subclasses, you can
     control the color of the interactive elements within navigation bars,
     including button images and titles, using the tintColor property.
     
     The titleTextAttributes property specifies the attributes for displaying
     the bar’s title text. You can specify the font, text color, text shadow
     color, and text shadow offset for the title in the text attributes dictionary
     using the font, foregroundColor, and shadow keys, respectively. For more
     information about string-formatting attributes, see Character Attributes.
     
     Use the setTitleVerticalPositionAdjustment(_:for:) method to adjust the
     vertical position of the title. This method allows you to specify the
     adjustment dependent on the bar height, which is represented by the
     UIBarMetrics enum. The following figure shows a navigation bar with
     custom tint color, title text attributes, and bar tint color.
     file:///Users/tigerfly/Desktop/UIKit/UIKit_Practice/e8608c12-1a29-47c9-95c5-984a0ca17bce.png
     
     To allow complete customization over the appearance of navigation bars,
     you can additionally provide custom background and shadow images. To
     provide a custom background image, use the setBackgroundImage(_:for:barMetrics:)
     method, providing a UIImage object for the appropriate bar position and metrics
     values. Use a UIBarPosition value for the bar position argument to specify
     whether to use the supplied image at the bottom or the top of the window, and
     if it appears at the top, whether to extend it upward under the status bar.
     Similarly, you can specify that the image should be used for either compact
     or default bar metrics, with or without a prompt, by providing a UIBarMetrics
     value to the bar metrics argument.
     
     To add a shadow, provide a resizable UIImage to the shadowImage property.
     To use the custom shadow image, you need to have specified a custom background
     image. The following figure shows a navigation bar with a custom background
     image, supplied using setBackgroundImage(_:for:barMetrics:) with a bar
     position value of UIBarPosition.topAttached and a bar metrics value of
     UIBarMetrics.default. A custom image has also been provided to the shadowImage
     property.
     
     
     == Internationalize a Navigation Bar
     
     To internationalize navigation bars, specify a localized string for
     each of the displayed string properties of the navigation item model objects.

     
     == Make a Navigation Bar Accessible
     
     Navigation bars are accessible by default. The default accessibility trait
     for a navigation bar is User Interaction Enabled.
     With VoiceOver enabled on an iOS device, after the user navigates to a new
     view in the hierarchy, VoiceOver reads the navigation bar’s title, followed
     by the name of the left bar button item. When the user taps an element in a
     navigation bar, VoiceOver reads the name and the type of the element; for
     example, "General back button," "Keyboard heading," and "Edit button."
     */
    
    
#pragma mark -- Presentation Management
    
#pragma mark -- Search Interface
    
#pragma mark -- Images and Video
    
#pragma mark -- Documents and Directories
    
#pragma mark -- Activities Interface
    
    /*
     UIActivityViewController
     
     A view controller that you use to offer standard services
     from your app.
     
     The system provides several standard services, such as copying
     items to the pasteboard, posting content to social media sites,
     sending items via email or SMS, and more. Apps can also define
     custom services.
     
     Your app is responsible for configuring, presenting, and dismissing
     this view controller. Configuration for the view controller involves
     specifying the data objects on which the view controller should
     act. (You can also specify the list of custom services your app
     supports.) When presenting the view controller, you must do so
     using the appropriate means for the current device. On iPad, you
     must present the view controller in a popover. On iPhone and iPod
     touch, you must present it modally.
     */

    /**
     Initializing the Activity view Controller
     
     - initWithActivityItems: applicationActivities:
     Initializes a new activity view controller object that acts on
     the specified data.
     
     • activityItems
     The array of data objects on which to perform the activity.
     The type of objects in the array is variable and dependent
     on the data your application manages. For example, the data
     might consist of one or more string or image objects representing
     the currently selected content.
     
     Instead of actual data objects, the objects in this array can
     be objects that adopt the UIActivityItemSource protocol, such
     as UIActivityItemProvider objects. Source and provider objects
     act as proxies for the corresponding data in situations where
     you do not want to provide that data until it is needed. Note
     that you should not reuse an activity view controller object
     that includes a UIActivityItemProvider object in its activityItems
     array.
     This array must not be nil and must contain at least one object.
     
     • applicationActivities
     An array of UIActivity objects representing the custom services
     that your application supports. This parameter may be nil.
     */
    
    /**
     Accessing the Completion Handler
     
     - completionWithItemsHandler
     The completion handler to execute after the activity view
     controller is dismissed.
     */
    
    /**
     Excluding Specific Activity Types
     
     excludedActivityTypes
     The list of services that should not be displayed.
     */
    
    
    /*
     UIActivityItemProvider
     
     A proxy for data that passes to an activity view controller.
     
     You can use a provider object in situations where you want
     to make data available for use by an activity but you want to
     delay providing that data until it is actually needed. For
     example, you might use a provider object to represent a large
     video file that needs to be processed before it can be shared
     to a user's social media account.
     
     When you initialize a UIActivityViewController object, you can
     pass a provider object in addition to any other data objects.
     When the user selects an activity, the activity view controller
     adds your provider object(which is also an operation object)
     to an operation queue so that it can begin to gather or process
     the needed data.

     You must subclass UIActivityItemProvider and implement its item
     method, which is called to generate the item data. You implement
     this method instead of the normal main method you would implement
     for an operation object. (The main method calls the item method
     when the operation object is executed.) Your implementation
     of the item method should do whatever work is necessary to create
     and return the data.
     */
    
    /**
     Initializing the Provider
     
     - initWithPlaceholderItem:
     Initializes and returns a provider object with the specified
     placeholder data.
     */
    
    /**
     Accessing the Provider Attributes
     
     - item
     Generates and returns the actual data-bearing object.
     
     - placeholderItem
     The placeholder object you specified at initialization time.
     
     - activityType
     The type of the activity object that is expecting the data.
     */
    
    
    
    /*
     UIActivityItemSource
     
     A set of methods that an activity view controller uses to
     retrieve the data items to act on.

     You can use this protocol in situations where you want to
     provide the data from one of your app’s existing objects
     instead of creating a separate UIActivityItemProvider object.
     When implementing this protocol, your object becomes the data
     provider, providing the view controller with access to the items.
     
     Because the methods of this protocol are executed on your app’s
     main thread, you should avoid using this protocol in cases where
     the data objects might take a significant amount of time to create.
     When creating large data objects, consider using a
     UIActivityItemProvider object instead.
     */
    
    /**
     Getting the Data Items
     
     - activityViewControllerPlaceholderItem:
     Returns the placeholder object for the data.
     Required.
     
     - activityViewController:itemForActivityType:
     Returns the data object to be acted upon.
     Required.
     */
    
    /**
     Providing Information About the Data Items
     
     - activityViewController:subjectForActivityType:
     For activities that support a subject field, returns the
     subject for the item.
     
     - activityViewController:dataTypeIdentifierForActivityType:
     For items that are provided as data, returns the UTI for the item.
     
     - activityViewController:thumbnailImageForActivityType:suggestedSize:
     For activities that support a preview image, returns a thumbnail
     preview image for the item.
     */
    
    /**
     Providing Metadata for Accelerated Previews
     
     - activityViewControllerLinkMetadata:
     Returns metadata to display in the preview header of the share sheet.
     */
    
    
    
    /*
     UIActivity
     
     An abstract class that you subclass to implement app-specific
     services.
     
     You should subclass UIActivity only if you want to provide custom
     services to the user. A service takes data that is passed to it,
     does something to that data, and returns the results. For example,
     a social media service might take whatever text, images, or other
     content is provided to it and post them to the user’s account.
     Activity objects are used in conjunction with a
     UIActivityViewController object, which is responsible for presenting
     services to the user.
     
     The system already provides support for many standard services
     and makes them available through the UIActivityViewController
     object. For example, the standard activity view controller
     supports emailing data, posting items to one of the user’s
     social media accounts, and several other options. You do not
     have to provide custom services for any of the built-in types.
     
     This class must be subclassed before it can be used. The job of
     an activity object is to act on the data provided to it and to
     provide some meta information that iOS can display to the user.
     For more complex services, an activity object can also display
     a custom user interface and use it to gather additional information
     from the user.
     */
    
    /**
     When subclassing, you must always override the following
     methods and use them to provide information about your service:
     
     •  activityType
        The type of service being provided.
        The default value is nil. Subclasses may override this property
        to return a custom activity type that is reported to the
        completionWithItemsHandler completion handler.
     •  activityTitle
        A user-readable string that describes the service.
        The default value is nil. Subclasses must override this property
        to return a user-readable string that describes the service.
        The string you return should be localized.
     •  activityImage
        An image that identifies the service to the user.
        The default value is nil. Subclasses must override this property
        to return a valid image object that can be presented to the user.
        The UIActivityViewController object uses this image to generate a
        button for your service in its UI.
     
        The alpha channel of the image is used as a mask to generate
        the final image that is presented to the user. Any color data
        in the image itself is ignored. Opaque pixels have a gradient
        applied to them, and this gradient is then laid on top of a
        standard background. Thus, a completely opaque image would yield
        a gradient-filled rectangle.
     
        For iPhone and iPod touch, images on iOS 7 should be 60 by 60
        points; on earlier versions of iOS, you should use images no
        larger than 43 by 43 points. For iPad, images on iOS 7 should
        be 76 by 76 points; on earlier versions of iOS, you should use
        images no larger than 60 by 60 points. On a device with Retina
        display, the number of pixels is doubled in each direction.
     •  canPerformWithActivityItems:
        Queries whether the service can act on the specified data items.
        The default implementation of this method returns NO. Subclasses
        must override it and return YES if the data in the activityItems
        parameter can be operated on by your service. Your implementation
        should check the types of the objects in the array and use that
        information to determine if your service can act on the corresponding data.
     
        The UIActivityViewController object calls this method when determining
        which services to show to the user.
     •  prepareWithActivityItems
        Prepares your service to act on the specified data.
        The default implementation of this method does nothing. This
        method is called after the user has selected your service but
        before your service is asked to perform its action. Subclasses
        should override this method and use it to store a reference to
        the data items in the activityItems parameter. In addition, if
        the implementation of your service requires displaying additional
        UI to the user, you can use this method to prepare your view
        controller object and make it available from the activityViewController
        method.
     •  activityCategory
        The category of the activity, which may be used to group
        activities in the UI.
        Override this property to define a different activity category
        for your custom activity.

     
     If your canPerformWithActivityItems: method indicates that
     your subclass is able to operate on the specified data, the
     active UIActivityViewController object displays your service
     to the user. When the user selects your service, the activity
     view controller calls the prepareWithActivityItems: method followed
     by only one of these methods:
     •  activityViewController—Returns a view controller to present
        to the user. If your service requires additional input from the
        user, override this method and use it to return the view controller
        object responsible for presenting your custom UI. (You do not need
        to present the view controller yourself.) After your view controller
        object gathers the needed input, it is responsible for initiating
        the task associated with the service.
     •  performActivity—Performs the service without displaying any
        additional UI. If your service does not need additional input
        from the user, override this method and perform the task
        associated with the service.
     
        The default implementation of this method does nothing. If your
        service does not provide any custom UI using the activityViewController
        method, override this method and use it to perform the activity.
        Your activity must operate on the data items received in the
        prepareWithActivityItems: method.
     
        This method is called on your app’s main thread. If your app can
        complete the activity quickly on the main thread, do so and
        call the activityDidFinish: method when it is done. If performing
        the activity might take some time, use this method to start the
        work in the background and then exit without calling
        activityDidFinish: from this method. When your background work
        has completed, call activityDidFinish:. You must call
        activityDidFinish: on the main thread.
     */
    
    
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
