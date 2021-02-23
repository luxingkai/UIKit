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
