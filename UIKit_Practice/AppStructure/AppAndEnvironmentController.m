//
//  AppAndEnvironmentController.m
//  UIKit_Practice
//
//  Created by tigerfly on 2020/11/5.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "AppAndEnvironmentController.h"

@interface AppAndEnvironmentController ()

@end

@implementation AppAndEnvironmentController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     Manage life-cycle events and your app’s UI scenes, and get information
     about traits and the environment in which your app runs.

     In iOS 13 and later, the user can create and manage multiple instances
     of your app's user interface simultaneously, and switch between them
     using the app switcher. On iPad, the user can also display multiple
     instances of your app side by side. Each instance of your UI displays
     different content, or displays the same content in a different way.
     For example, the user can display one instance of the Calendar app
     showing a specific day, and another showing an entire month.
     
     UIKit communicates details about the current environment using trait
     collections, which reflect a combination of device settings, interface
     settings, and user preferences. For example, you use traits to detect
     whether Dark Mode is active for the current view or view controller.
     Consult the current trait collection of your UIView or UIViewController
     object when you want to customize its contents based on the current
     environment. Adopt the UITraitEnvironment protocol in other objects
     when you want them to receive trait notification changes.
     */
    
    
#pragma mark -- Life Cycle
    
    /*
     Managing Your App's Life Cycle
     
     Respond to system notifications when your app is in the foreground or
     background, and handle other significant system-related events.

     The current state of your app determines what it can and cannot do at
     any time. For example, a foreground app has the user's attention, so
     it has priority over system resources, including the CPU. By contrast,
     a background app must do as little work as possible, and preferably nothing,
     because it is offscreen. As your app changes from state to state, you
     must adjust its behavior accordingly.
     
     When your app's state changes, UIKit notifes you by calling methods of the
     appropriate delegate object:
     
     ●  In iOS 13 and later, use UISceneDelegate objects to respond to life-cycle
     events in a scene-based app.
     ●  In iOS 12 and earlier, use the UIApplicationDelegate object to respond to
     life-cycle events.
     
     ⚠️ If you enable scene support in your app, iOS always uses your scene
     delegates in iOS 13 and later. In iOS 12 and earlier, the system uses
     your app delegate.

     
     == Respond to Scene-Based Life-Cycle Events
     
     If your app supports scenes, UIKit delivers separate life-cycle events
     for each. A scene represents one instance of your app’s UI running on a
     device. The user can create multiple scenes for each app, and show and
     hide them separately. Because each scene has its own life cycle, each can
     be in a different state of execution. For example, one scene might be in
     the foreground while others are in the background or are suspended.

     ⚠️ Scene support is an opt-in feature. To enable basic support, add the
     UIApplicationSceneManifest key to your app’s Info.plist file as described
     in Specifying the Scenes Your App Supports.

     The following figure shows the state transitions for scenes. When the user
     or system requests a new scene for your app, UIKit creates it and puts it
     in the unattached state. User-requested scenes move quickly to the foreground,
     where they appear onscreen. A system-requested scene typically moves to the
     background so that it can process an event. For example, the system might
     launch the scene in the background to process a location event. When the user
     dismisses your app's UI, UIKit moves the associated scene to the background
     state and eventually to the suspended state. UIKit can disconnect a background
     or suspended scene at any time to reclaim its resources, returning that scene
     to the unattached state.

     Use scene transitions to perform the following tasks:
     
     ●  When UIKit connects a scene to your app, configure your scene’s initial UI
        and load the data your scene needs.
     ●  When transitioning to the foreground-active state, configure your UI and
        prepare to interact with the user.
     ●  Upon leaving the foreground-active state, save data and quiet your app’s
        behavior
     ●  Upon entering the background state, finish crucial tasks, free up as much
        memory as possible, and prepare for your app snapshot.
     ●  At scene disconnection, clean up any shared resources associated with the scene.
     ●  In addition to scene-related events, you must also respond to the launch of
        your app using your UIApplicationDelegate object.

     
     == Respond to App-Based Life-Cycle Events
     
     In iOS 12 and earlier, and in apps that don't support scenes, UIKit delivers
     all life-cycle events to the UIApplicationDelegate object. The app delegate
     manages all of your app’s windows, including those displayed on separate screens.
     As a result, app state transitions affect your app's entire UI, including
     content on external displays.
     
     The following figure shows the state transitions involving the app delegate
     object. After launch, the system puts the app in the inactive or background
     state, depending on whether the UI is about to appear onscreen. When launching
     to the foreground, the system transitions the app to the active state
     automatically. After that, the state fluctuates between active and background
     until the app terminates.
     
     Use app transitions to perform the following tasks:
     
     ●  At launch, initialize your app’s data structures and UI.
     ●  At activation, finish configuring your UI and prepare to interact with the user.
     ●  Upon deactivation, save data and quiet your app’s behavior.
     ●  Upon entering the background state, finish crucial tasks, free up as much
        memory as possible, and prepare for your app snapshot.
     ● At termination, stop all work immediately and release any shared resources.
     
     
     ==  Respond to Other Significant Events

     In addition to handling life-cycle events, apps must also be prepared to
     handle the events listed in the following table. Use your UIApplicationDelegate
     object to handle most of these events. In some cases, you may also be able to
     handle them using notifications, allowing you to respond from other parts of
     your app.
     
     ●  Memory warnings
        Received when your app’s memory usage is too high.
     ●  Protected data becomes available/unavailable
        Received when the user locks or unlocks their device.
     ●  Handoff tasks
        Received when an NSUserActivity object needs to be processed.
     ●  Time changes
        Received for several different time changes, such as when the phone
        carrier sends a time update.
     ●  Open URLs
        Received when your app needs to open a resource.
     */
    
    
    
    /*
     Responding to the Launch of Your App

     Initialize your app’s data structures, prepare your app to run, and respond
     to any launch-time requests from the system.

     The system launches your app when the user taps your app’s icon on the Home
     screen. If your app requested specific events, the system might also launch
     your app in the background to handle those events. For a scene-based app,
     the system similarly launches the app when one of your scenes needs to
     appear onscreen or do some work.
     
     All apps have an associated process, which the UIApplication object represents.
     Apps also have an app delegate object—an object that conforms to the
     UIApplicationDelegate protocol—which responds to important events happening
     within that process. Even a scene-based app uses an app delegate to manage
     fundamental events like launch and termination. At launch time, UIKit
     automatically creates the UIApplication object and your app delegate. It
     then starts your app’s main event loop.
     
     
     == Provide a Launch Storyboard

     When the user first launches your app on a device, the system displays
     your launch storyboard until your app is ready to display its UI.
     Displaying the launch storyboard assures the user that your app launched
     and is doing something. If your app initializes itself and readies its UI
     quickly, the user may see your launch storyboard only briefly.
     
     Xcode projects automatically include a default launch storyboard for you
     to customize, and you can add more launch storyboards as necessary. To
     add new launch storyboards to your project, do the following:
     1. Open your project in Xcode.
     2. Choose File > New > File.
     3. Add a Launch Screen resource to your project.
     
     Add views to your launch storyboard and use Auto Layout constraints
     to size and position them so that they adapt to the underlying environment.
     UIKit displays exactly what you provide, using your constraints to fit
     your views into the available space.
     
     ⚠️ Don't use a static image for your launch screen. In iOS 14 and later,
     the launch screen is limited to 25 MB.
     
     
     == Initialize Your App's Data Structures
     
     Put your app's launch-time initialization code in one or both of the
     following methods:
     ● application(_:willFinishLaunchingWithOptions:)
     ● application(_:didFinishLaunchingWithOptions:)
     
     UIKit calls these methods at the beginning of your app’s launch cycle.
     Use them to:
     ● Initialize your app's data structures.
     ● Verify that your app has the resources it needs to run.
     ● Perform any one-time setup when your app launches for the first time.
     ● Connect to any critical services that your app uses.
     ● Check the launch options dictionary for information about why your app launched.
     
     For apps that aren't scene-based, UIKit loads your default user interface
     automatically at launch time. Use the application(_:didFinishLaunchingWithOptions:)
     method to make additional changes to that interface before it appears onscreen.
     For example, you might install a different view controller to reflect what the
     user was doing the last time they used the app.

     
     == Move Long-Running Tasks off the Main Thread

     When the user launches your app, make a good impression by launching quickly.
     UIKit doesn't present your app's interface until after the application(_:didFinishLaunchingWithOptions:) method returns.
     Performing long-running tasks in that method or your application(_:willFinishLaunchingWithOptions:) method might make your
     app appear sluggish to the user. Returning quickly is also important when
     launching to the background because the system limits your app’s background
     execution time.
     
     Move tasks that are not critical to your app’s initialization out of the
     launch-time sequence. For example:
     ●  Defer the initialization of features that your app doesn’t need immediately.
     ●  Move important, long-running tasks off your app’s main thread.
        For example, run them asynchronously on a global dispatch queue.
     
     == Determine Why Your App Launched

     When UIKit launches your app, it passes along a launch options dictionary
     to your application(_:willFinishLaunchingWithOptions:) and
     application(_:didFinishLaunchingWithOptions:) methods with information
     about why your app launched. The keys in that dictionary indicate important
     tasks to perform immediately. For example, they might reflect actions that
     the user started elsewhere and wants to continue in your app. Always check
     the contents of the launch options dictionary for keys that you expect,
     and respond appropriately to their presence.
     
     ⚠️ For a scene-based app, examine the options that UIKit passes to the
     application(_:configurationForConnecting:options:) method to determine
     why it created your scene.
     
     Listing 1 shows the app delegate method for an app that handles background
     location updates. When the location key is present, the app starts location
     updates immediately instead of deferring them until later. Starting location
     updates allows the Core Location framework to deliver the new location event.

     class AppDelegate: UIResponder, UIApplicationDelegate,
                    CLLocationManagerDelegate {
         
        let locationManager = CLLocationManager()
        func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions:
                   [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
            
           // If launched because of new location data,
           //  start the visits service right away.
           if let keys = launchOptions?.keys {
              if keys.contains(.location) {
                 locationManager.delegate = self
                 locationManager.startMonitoringVisits()
              }
           }
            
           return true
        }
        // other methods…
     }

     The system doesn’t include a key unless your app supports the corresponding
     feature. For example, the system doesn’t include the remoteNotification key
     for an app that doesn’t support remote notifications.

     
     == About the App Launch Sequence

     Learn the order in which the system executes your code at app launch time.
     
     Launching an app involves a complex sequence of steps, most of which the
     system handles automatically. During the launch sequence, UIKit calls
     methods in your app delegate so you can prepare your app for user interaction
     and perform any tasks specific to your app’s requirements. The following
     illustrates the individual steps of this launch sequence, from the time
     the app launches to when the sequence completes:
     
     1. The user or the system launches your app, or the system prewarms your app.
     2. The system executes the main() function that Xcode provides.
     3. The main() function calls UIApplicationMain(_:_:_:_:), which creates
        an instance of UIApplication and of your app delegate.
     4. UIKit loads the default storyboard you specify in your app’s Info.plist
        file, or in the target’s Custom iOS Target Properties tab of Xcode’s project
        editor; apps that don’t use a default storyboard skip this step.
     5. UIKit calls the application(_:willFinishLaunchingWithOptions:) method in
        your app delegate.
     6. UIKit performs state restoration, which results in the execution of
        additional methods in your app delegate and app’s view controllers.
     7. UIKit calls your app delegate’s application(_:didFinishLaunchingWithOptions:)
        method.
     
     After the launch sequence completes, the system uses your app or scene
     delegates to display your app’s user interface and to manage its life cycle.

     
     == Prepare Your App for Prewarming

     In iOS 15 and later, the system may, depending on device conditions, prewarm
     your app — launch nonrunning application processes to reduce the amount of
     time the user waits before the app is usable. Prewarming executes an app’s
     launch sequence up until, but not including, when main() calls
     UIApplicationMain(_:_:_:_:). This provides the system with an opportunity
     to build and cache any low-level structures it requires in anticipation of
     a full launch.

     After the system prewarms your app, its launch sequence remains in a paused
     state until the app launches and the sequence resumes, or the system removes
     the prewarmed app from memory to reclaim resources. The system can prewarm
     your app after a device reboot, and periodically as system conditions allow.

     If your app executes code before the call to UIApplicationMain(_:_:_:_:),
     such as in static initializers like load(), don’t make assumptions about
     what services and resources are available. For example, keychain items may
     be unavailable because their data protection policies require an unlocked
     device and prewarming happens even when the device is in a locked state.
     If your code is dependent upon access to a specific service or resource,
     migrate that code to a later part of the launch sequence.

     Prewarming an app results in an indeterminate amount of time between
     when the prewarming phase completes and when the user, or system,
     fully launches the app. Because of this, use MetricKit to accurately
     measure user-driven launch and resume times instead of manually
     signposting various points of the launch sequence.
     
     == Performing One-Time Setup for Your App
     
     Ensure proper configuration of your app environment.
     
     When the user launches your app for the first time, you might want
     to prepare your app environment by performing some one-time tasks.
     For example, you might want to:

     ●  Download required data from your server.
     ●  Copy document templates or modifiable data files from your app bundle
        to a writable directory.
     ●  Configure default preferences for the user.
     ●  Set up user accounts or gather other required data.
     
     Perform any one-time tasks in your app delegate’s
     application(_:willFinishLaunchingWithOptions:) or
     application(_:didFinishLaunchingWithOptions:) method.
     Never block the app’s main thread for tasks that do not require user input.
     Instead, start tasks asynchronously using a dispatch queue, and let them
     run in the background while your app finishes launching. For tasks that
     require user input, make all changes to your user interface in the
     application(_:didFinishLaunchingWithOptions:) method.
     
     Install Files in the Proper Locations
     Your app has its own container directory for storing files, and you
     should always place app-specific files in the ~/Library subdirectory.
     Specifically, store your files in the following ~/Library subdirectories:
     
     ●  ~/Library/Application Support/—Store app-specific files that you want
     backed up with the user’s other content. (You can create custom subdirectories
     here as needed.) Use this directory for data files, configuration files,
     document templates, and so on.
     
     ●  ~/Library/Caches/—Store temporary data files that can be easily
     regenerated or downloaded.
     
     To obtain a URL for one of the directories in your app’s container,
     use the urls(for:in:) method of FileManager.
     
     let appSupportURL = FileManager.default.urls(for:
           .applicationSupportDirectory, in: .userDomainMask)

     let cachesURL = FileManager.default.urls(for:
           .cachesDirectory, in: .userDomainMask)
     
     Place any temporary files in your app’s tmp/ directory. Temporary files
     might include compressed files that you intend to delete once their
     contents have been extracted and installed elsewhere. Retrieve the URL
     for your app’s temporary directory using the temporaryDirectory method
     of FileManager.
     
     
     == Preserving Your App's UI Across Launches
     Return your app to its previous state after the system terminates it.

     Preserving your app’s user interface helps maintain the illusion that
     your app is always running. Interruptions can occur frequently on iOS
     devices, and a prolonged interruption might cause the system to terminate
     your app to free up resources. However, users do not know that your app
     has been terminated and will not expect the state of your app to change.
     Instead, they expect your app to be in the same state as when they left
     it. State preservation and restoration ensures that your app returns to
     its previous state when it launches again.
     
     At appropriate times, UIKit preserves the state of your app’s views and
     view controllers to an encrypted file on disk. When your app is terminated
     and relaunched later, UIKit reconstructs your views and view controllers
     from the preserved data. The preservation and restoration processes are
     initiated automatically, but you must also do some specific work to
     support those processes:
     
     ●  Enable support for state preservation and restoration.
     ●  Assign restoration identifiers to the view controllers that you want
        to preserve.
     ●  Recreate view controllers, as needed, at restoration time.
     ●  Encode and decode the custom data that you need to restore your view
        controller to its previous state.
     
     If you define your interface entirely in storyboards, UIKit knows how to
     recreate your view controllers, and does so automatically. If you do not
     use storyboards, or if you want more control over the creation and
     initialization of your view controllers, you can create them yourself.
     
     Enable State Preservation and Restoration for Your App
     You opt-in to state preservation and restoration by implementing your
     app delegate’s application(_:shouldSaveApplicationState:) and
     application(_:shouldRestoreApplicationState:) methods. Both methods return
     a Boolean value indicating whether the associated process should occur,
     and in most cases you simply return true. However, you can return false
     at times when restoring your app’s interface might not be appropriate.
     
     When UIKit calls your application(_:shouldSaveApplicationState:) method,
     you can save data in addition to returning true. You might save data
     that you intend to use during the restoration process. For example,
     Listing 1 shows an example that saves the app’s current version number.
     At restoration time, the application(_:shouldRestoreApplicationState:)
     method checks the version number in the archive and prevents restoration
     from occurring if it does not match the expected version.
     
     func application(_ application: UIApplication,
                 shouldSaveApplicationState coder: NSCoder) -> Bool {
        // Save the current app version to the archive.
        coder.encode(11.0, forKey: "MyAppVersion")
             
        // Always save state information.
        return true
     }
         
     func application(_ application: UIApplication,
                 shouldRestoreApplicationState coder: NSCoder) -> Bool {
        // Restore the state only if the app version matches.
        let version = coder.decodeFloat(forKey: "MyAppVersion")
        if version == 11.0 {
           return true
        }
         
        // Do not restore from old data.
        return false
     }
     
     If you prevent restoration from occurring, you can still configure your
     app’s interface manually in the application(_:didFinishLaunchingWithOptions:)
     method of your app delegate.
     
     Assign Restoration Identifiers to Your View Controllers
     
     You explicitly tell UIKit which view controllers to preserve by assigning
     restoration identifiers to them. A restoration identifier is a unique string
     that you assign to the view controller programmatically or in Interface
     Builder. The name of the view controller class is usually a suitable
     restoration identifier, but you may use any string. Add that string to the
     view controller in your storyboard file or assign it to the view controller’s
     restorationIdentifier property at runtime.
     
     At preservation time, UIKit attempts to preserve the root view controllers
     of your app’s windows. For each root view controller with a restoration
     identifier, UIKit asks that view controller to encode its custom data in an
     archive. A container view controller can encode references to its child view
     controllers as part of its custom data. If it does, and if those view
     controllers also have restoration identifiers, UIKit attempts to preserve
     the child view controllers and their contents. This process continues
     recursively, following the connections from one view controller to the
     next until all of them are saved or ignored.
     
     You are not required to assign a restoration identifier to every view
     controller. In fact, there are times when you might not want to preserve
     all of your view controllers. For example, if your app displays a temporary
     login screen, you might not want that screen preserved. Instead, you would
     want to determine at restoration time whether to display it. In that case,
     you would not assign a restoration identifier to the view controller for
     your login screen.
     
     Encode and Decode Custom Information for Your App
     
     During the preservation process, UIKit calls the encodeRestorableState(with:)
     method of each preserved view and view controller. Use this method to
     preserve the information that you need to return the view or view
     controller to its current state.
     
     ●  Do save details about the visual state of views and controls.
     ●  Do save references to child view controllers that you also want to preserve.
     ●  Do save information that can be discarded without affecting the user's data
     ●  Do not include data that is already in your app's persistent storage.
        Instead, include an identifier that you can use to locate that data later.
     
     State preservation is not a substitute for saving your app's data to disk.
     UIKit can discard state preservation data at its discretion, allowing your
     app to return to its default state. Use the preservation process to store
     information about the state of your app's user interface, such as the
     currently selected row of a table. Do not use it to store the data contained
     in that table.

     override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
             
        // Save the user ID so that we can load that user later.
        coder.encode(userID, forKey: "UserID")

        // Write out any temporary data if editing is in progress.
        if firstNameField!.isFirstResponder {
           coder.encode(firstNameField?.text, forKey: "EditedText")
           coder.encode(Int32(1), forKey: "EditField")
        }
        else if lastNameField!.isFirstResponder {
           coder.encode(lastNameField?.text, forKey: "EditedText")
           coder.encode(Int32(2), forKey: "EditField")
        }
        else {
           // No editing was in progress.
           coder.encode(Int32(0), forKey: "EditField")
        }
     }
     
     Create View Controllers When Asked

     If preserved state information is available when your app is launched,
     the system attempts to restore your app’s interface using the preserved data.
     
     1. UIKit calls your app delegate's application(_:shouldRestoreApplicationState:)
     method to determine if restoration should proceed.
     2. UIKit uses your app's storyboards to recreate your view controllers.
     3. UIKit calls each view controller's decodeRestorableState(with:) method
     to restore its state information.
     
     UIKit loads both the view controller and its views from your storyboard
     initially. After those objects have been loaded and initialized, UIKit
     begins restoring their state information. Use your decodeRestorableState(with:)
     methods to return your view controller to its previous state.
     
     Listing 3 shows the method for decoding the state that was encoded in Listing 2.
     This method restores the view controller’s data from the preserved user ID.
     If a text field was being edited, this method also restores the in-progress
     value and makes the corresponding text field the first responder, which
     displays the keyboard for that text field.
     
     override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        
        // Restore the first name and last name from the user ID
        let identifier = coder.decodeObject(forKey: "UserID") as! String
        setUserID(identifier: identifier)

        // Restore an in-progress values that was not saved
        let activeField = coder.decodeInteger(forKey: "EditField")
        let editedText = coder.decodeObject(forKey: "EditedText") as!
                              String?

        switch activeField {
           case 1:
              firstNameField?.text = editedText
              firstNameField?.becomeFirstResponder()
              break
                 
           case 2:
              lastNameField?.text = editedText
              lastNameField?.becomeFirstResponder()
              break
                 
          default:
              break  // Do nothing.
       }
     }
     
     Defining your view controllers in storyboards is the easiest way to manage
     state restoration, but it is not the only way. For more information about
     other ways to recreate your view controllers, see About the UI Restoration
     Process.
     */
    
    
    /*
     UIApplication
     The centralized point of control and coordination for apps running in iOS.
     */
    
    /*
     UIApplicationDelegate
     A set of methods to manage shared behaviors for your app.
     */
    
    
#pragma mark -- Device Environment
    
    UIDevice *device = [UIDevice currentDevice];
    [device playInputClick];
    
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
