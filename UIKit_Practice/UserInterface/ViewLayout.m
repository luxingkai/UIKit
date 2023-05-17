//
//  ViewLayout.m
//  UIKit_Practice
//
//  Created by tigerfly on 2020/11/5.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "ViewLayout.h"
#import "DrawLineView.h"
@interface ViewLayout ()
@property (strong, nonatomic) UIView *subView;
@end

@implementation ViewLayout

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.view.autoresizesSubviews = YES;
    
//    self.subView = [UIView new];
//    self.subView.backgroundColor = UIColor.redColor;
//    self.subView.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.view addSubview:self.subView];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    DrawLineView *lineView = [[DrawLineView alloc] initWithFrame:CGRectMake(0, 100, width, 200)];
    lineView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:lineView];
    
    float re = powf(10, 2.0);
    printf("%.f",re);
    
//    NSLayoutConstraint *topLayout = [NSLayoutConstraint constraintWithItem:self.subView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:20];
//    NSLayoutConstraint *leftLayout = [NSLayoutConstraint constraintWithItem:self.subView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:100];
//    NSLayoutConstraint *widthContraint = [NSLayoutConstraint constraintWithItem:self.subView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0 constant:60];
//    NSLayoutConstraint *heightContraint = [NSLayoutConstraint constraintWithItem:self.subView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0 constant:60];
//    [NSLayoutConstraint activateConstraints:@[topLayout,leftLayout,widthContraint,heightContraint]];
//    [self.subView addConstraints:@[topLayout,leftLayout,widthContraint,heightContraint]];


//    NSLayoutConstraint *left = [self.subView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:200];
//    NSLayoutConstraint *top = [self.subView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:20];
//    NSLayoutConstraint *width = [self.subView.widthAnchor constraintEqualToConstant:100];
//    NSLayoutConstraint *height = [self.subView.heightAnchor constraintEqualToConstant:100];
//    [NSLayoutConstraint activateConstraints:@[left,top,width,height]];
    
    
    
    /*
     Use stack views to lay out the views of your interface
     automatically. Use Auto Layout when you require precise
     placement of your views.

     When you design your app’s interface, you position views and
     other interface elements in your app’s windows and size them
     appropriately. However, the size and position of those views
     may need to change at runtime for a variety of reasons:
     
     ●  The user can resize the window containing your views.
     ●  Variations in the screen sizes of iOS devices (including
        differences between portrait and landscape orientations)
        require different layouts for each device and orientation.
     ●  Apps on iPad must adapt to cover different amounts of screen
        space, ranging from a third of the screen to the entire screen.
     ●  Language changes might require size changes for labels and
        other text-based views.
     ●  Dynamic Type allows changes to the size of the text, which
        affects the size of the view.
     
     UIStackView objects adjust the position of their contained
     views automatically when interface dimensions change.
     Alternatively, Auto Layout constraints let you specify
     the rules that determine the size and position of the views
     in your interface.
     */
    
    
#pragma mark -- UIStackView

    
#pragma mark -- Constraints
    
    /*
     Positioning Content Within Layout Margins

     Position views so that they are not crowded by other content.
     
     Layout margins provide a visual buffer between a view’s content
     and any content outside of the view’s bounds. The layout margins
     consist of inset values for each edge (top, bottom, leading,
     and trailing) of the view. These inset values create a space
     between the edges of the view’s bounds rectangle and the content
     inside the view. Figure 1 shows two views with different sets
     of layout margins. Apart from the empty space they add around
     your content, margins have no visible representation.
     
     To set up constraints that respect the layout margins, enable
     the Constrain to margins option in Xcode, as shown in Figure 2.
     (If you do not enable that option, Xcode creates your constraints
     relative to the view’s bounds rectangle.) If the superview’s
     margins change later, the positions of elements tied to those
     margins are updated accordingly.
     
     Even if you are not using constraints to position your content,
     you can still manually position content relative to a view’s
     layout margins. The directionalLayoutMargins property of each
     view contains the edge inset values to use for the view’s margins.
     Take those margin values into account when computing the position
     of items in your view.
     */

    /*
     Positioning Content Relative to the Safe Area

     Position views so that they are not obstructed by other content.

     Safe areas help you place your views within the visible portion
     of the overall interface. UIKit-defined view controllers may position
     special views on top of your content. For example, a navigation
     controller displays a navigation bar on top of the underlying view
     controller’s content. Even when such views are partially
     transparent, they still occlude the content that is underneath
     them. In tvOS, the safe area also includes the screen’s overscan
     insets, which represent the area covered by the screen’s bezel.
     
     Use safe areas as an aid to laying out your content. Each view
     has its own layout guide (accessible from the safeAreaLayoutGuide
     property) that you can use to create constraints for items inside
     the view. If you are not using Auto Layout to position your views,
     you can obtain the raw inset values from the view’s
     safeAreaInsets property.
     file:///Users/tigerfly/Desktop/UIKit/UIKit_Practice/e5aca39a-f9a2-4ab8-9f45-08fd95fb845c.png

     - Extend the Safe Area to Include Custom Views

     Your container view controller can display its own content views
     over the views of an embedded child view controller. In this
     situation, update the child view controller’s safe area to exclude
     the areas covered by the container view controller's content views.
     UIKit container view controllers already adjust the safe area of
     their child view controllers to account for content views. For
     example, navigation controllers extend the safe area of their
     child view controllers to account for the navigation bar.
     
     To extend the safe area of an embedded child view controller,
     modify its additionalSafeAreaInsets property. Suppose you define
     a container view controller that displays custom views along the
     bottom and right edges of the screen, as shown in Figure 2.
     Because the child view controller’s content is underneath the
     custom views, you must extend the bottom and right insets of
     the child view controller's safe area to account for those views.
     file:///Users/tigerfly/Desktop/UIKit/UIKit_Practice/419597f1-8b60-47bb-a8af-2d2f6809f2dc.png
     
     ===========================================================
     override func viewDidAppear(_ animated: Bool) {
        var newSafeArea = UIEdgeInsets()
        // Adjust the safe area to accommodate
        //  the width of the side view.
        if let sideViewWidth = sideView?.bounds.size.width {
           newSafeArea.right += sideViewWidth
        }
        // Adjust the safe area to accommodate
        //  the height of the bottom view.
        if let bottomViewHeight = bottomView?.bounds.size.height {
           newSafeArea.bottom += bottomViewHeight
        }
        // Adjust the safe area insets of the
        //  embedded child view controller.
        let child = self.childViewControllers[0]
        child.additionalSafeAreaInsets = newSafeArea
     }
     ===========================================================

     */
    

#pragma mark -- NSLayoutConstraint

    /*
     The relationship between two user interface objects that must
     be satisfied by the constraint-based layout system.

     Each constraint is a linear equation with the following format:
     ===========================================================
     item1.attribute1 = multiplier × item2.attribute2 + constant
     ===========================================================

     In this equation, attribute1 and attribute2 are the variables
     that Auto Layout can adjust when solving these constraints.
     The other values are defined when you create the constraint.
     For example, If you’re defining the relative position of two
     buttons, you might say “the leading edge of the second button
     should be 8 points after the trailing edge of the first button.
     ” The linear equation for this relationship is shown below:
     
     // positive values move to the right in left-to-right languages
     // like English.
     ===========================================================
     button2.leading = 1.0 × button1.trailing + 8.0
     ===========================================================

     Auto Layout then modifies the values of the specified leading
     and trailing edges until both sides of the equation are equal.
     Note that Auto Layout does not simply assign the value of the
     right side of this equation to the left side. Instead, the
     system can modify either attribute or both attributes as needed
     to solve for this constraint.
     
     The fact that constraints are equations (and not assignment
     operators) means that you can switch the order of the items
     in the equation as needed to more clearly express the desired
     relationship. However, if you switch the order, you must also
     invert the multiplier and constant. For example, the following
     two equations produce identical constraints:
     ===========================================================
     // These equations produce identical constraints
     button2.leading = 1.0 × button1.trailing + 8.0
     button1.trailing = 1.0 × button2.leading - 8.0
     ===========================================================

     A valid layout is defined as a set constraints with one and only
     one possible solution. Valid layouts are also referred to as a
     nonambiguous, nonconflicting layouts. Constraints with more than
     one solution are ambiguous. Constraints with no valid solutions
     are conflicting. For more information on resolving ambiguous
     and conflicting constraints, see Types of Errors in Auto Layout
     Guide.
     
     Additionally, constraints are not limited to equality relationships.
     They can also use greater than or equal to (>=) or less than or
     equal to (<=) to describe the relationship between the two
     attributes. Constraints also have priorities between 1 and 1,000.
     Constraints with a priority of 1,000 are required. All priorities
     less than 1,000 are optional. By default, all constraints are
     required (priority = 1,000).
     
     After solving for the required constraints, Auto Layout tries to
     solve all the optional constraints in priority order from highest
     to lowest. If it cannot solve for an optional constraint, it
     tries to come as close as possible to the desired result, and
     then moves on to the next constraint.
     */
    
    /**
     Creating Constraints

     + constraintsWithVisualFormat:options:metrics:views:
     Creates constraints described by an ASCII art-like visual format
     string.
     
     + constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:
     Creates a constraint that defines the relationship between the
     specified attributes of the given views.
     */
    
//    NSLayoutConstraint constraintWithItem:<#(nonnull id)#> attribute:<#(NSLayoutAttribute)#> relatedBy:<#(NSLayoutRelation)#> toItem:<#(nullable id)#> attribute:<#(NSLayoutAttribute)#> multiplier:<#(CGFloat)#> constant:<#(CGFloat)#>
    
    
    /**
     Activating and Deactivating Constraints

     active
     The active state of the constraint.
     
     + activateConstraints:
     Activates each constraint in the specified array.
     
     + deactivateConstraints:
     Deactivates each constraint in the specified array.
     */
    
    /**
     Accessing Constraint Data

     firstItem
     The first object participating in the constraint.
     
     firstAttribute
     The attribute of the first object participating in the
     constraint.
     
     relation
     The relation between the two attributes in the constraint.
     
     secondItem
     The second object participating in the constraint.
     
     secondAttribute
     The attribute of the second object participating in the constraint.
     
     multiplier
     The multiplier applied to the second attribute participating in
     the constraint.
     
     constant
     The constant added to the multiplied second attribute
     participating in the constraint.
     
     firstAnchor
     The first anchor that defines the constraint.
     
     secondAnchor
     The second anchor that defines the constraint.
     */
    
    /**
     Getting the Layout Priority

     priority
     The priority of the constraint.
     
     UILayoutPriority
     The layout priority is used to indicate to the constraint-based
     layout system which constraints are more important, allowing
     the system to make appropriate tradeoffs when satisfying the
     constraints of the system as a whole.
     
     UILayoutPriorityRequired
     A required constraint.
     
     UILayoutPriorityDefaultHigh
     The priority level with which a button resists compressing its
     content.
     
     UILayoutPriorityDefaultLow
     The priority level at which a button hugs its contents
     horizontally.
     
     UILayoutPriorityFittingSizeLevel
     The priority level with which the view wants to conform to the
     target size in that computation.
     
     NSLayoutPriority
     Layout priority used to indicate the relative importance of
     constraints, allowing Auto Layout to make appropriate tradeoffs
     when satisfying the constraints of the system as a whole.
     */
    
    /**
     Identifying a Constraint

     identifier
     The name that identifies the constraint.
     */
    
    /**
     Controlling Constraint Archiving

     shouldBeArchived
     A Boolean value that determines whether the constraint should
     be archived by its owning view.
     */
    
    
#pragma mark -- UILayoutSupport

    /*
     A set of methods that provide layout support and access to
     layout anchors.

     This protocol is implemented by the UIViewController properties
     topLayoutGuide and bottomLayoutGuide to support using Auto Layout
     with a view controller’s view. You can use layout guides as layout
     items in the NSLayoutConstraint factory methods.
     */
    
    /**
     Layout Support
     
     length
     Provides the length, in points, of the portion of a view
     controller’s view that is overlaid by translucent or transparent
     UIKit bars.
     Required.
     */
    
    /**
     Creating Constraints Using Layout Anchors

     bottomAnchor
     A layout anchor representing the guide’s bottom edge.
     Required.
     
     heightAnchor
     A layout anchor representing the guide’s height.
     Required.
     
     topAnchor
     A layout anchor representing the guide’s top edge.
     Required.
     */
    
    /**
     NSDictionaryOfVariableBindings
     
     Creates a dictionary wherein the keys are string representations
     of the corresponding values’ variable names.
     */
    
    
#pragma mark -- UILayoutGuide
    
    /*
     A rectangular area that can interact with Auto Layout.

     Use layout guides to replace the placeholder views you may have
     created to represent inter-view spaces or encapsulation in your
     user interface. Traditionally, there were a number of Auto
     Layout techniques that required placeholder views. A placeholder
     view is an empty view that does not have any visual elements of
     its own and serves only to define a rectangular region in the
     view hierarchy. For example, if you wanted to use constraints
     to define the size or location of an empty space between views,
     you needed to use a placeholder view to represent that space.
     If you wanted to center a group of objects, you needed a
     placeholder view to contain those objects. Similarly, placeholder
     views could be used to contain and encapsulate part of your
     user interface. Placeholder views let you break up a large,
     complex user interface into self-contained, modular chunks.
     When used properly, they could greatly simplify your Auto
     Layout constraint logic.
     
     There are a number of costs associated with adding placeholder
     views to your view hierarchy. First, there is the cost of
     creating and maintaining the view itself. Second, the
     placeholder view is a full member of the view hierarchy,
     which means that it adds overhead to every task the hierarchy
     performs. Worst of all, the invisible placeholder view can
     intercept messages that are intended for other views, causing
     problems that are very difficult to find.
     
     The UILayoutGuide class is designed to perform all the tasks
     previously performed by placeholder views, but to do it in a
     safer, more efficient manner. Layout guides do not define a
     new view. They do not participate in the view hierarchy.
     Instead, they simply define a rectangular region in their
     owning view’s coordinate system that can interact with Auto Layout.
     */
    
    /**
     Creating Layout Guides

     To create a layout guide, you must perform the following steps:
     
     1. Instantiate a new layout guide.
     2. Add the layout guide to a view by calling the view’s
        addLayoutGuide: method.
     3. Define the position and size of the layout guide using
        Auto Layout.
     You can use these guides to define the space between elements
     in your layout. The following example shows layout guides used
     to define an equal spacing between a series of views.
     =============================================================
     UILayoutGuide *space1 = [[UILayoutGuide alloc] init];
     [self.view addLayoutGuide:space1];
      
     UILayoutGuide *space2 = [[UILayoutGuide alloc] init];
     [self.view addLayoutGuide:space2];
      
     [space1.widthAnchor constraintEqualToAnchor:space2.widthAnchor].active = YES;
     [self.saveButton.trailingAnchor constraintEqualToAnchor:space1.leadingAnchor].active = YES;
     [self.cancelButton.leadingAnchor constraintEqualToAnchor:space1.trailingAnchor].active = YES;
     [self.cancelButton.trailingAnchor constraintEqualToAnchor:space2.leadingAnchor].active = YES;
     [self.clearButton.leadingAnchor constraintEqualToAnchor:space2.trailingAnchor].active = YES;
     =============================================================

     A layout guide can also act as an opaque box that contains
     other views and controls, letting you encapsulate parts of
     your view and break up your layout into modular chunks.
     =============================================================
     UILayoutGuide *container = [[UILayoutGuide alloc] init];
     [self.view addLayoutGuide:container];
      
     // Layout the contents of the container
     [self.label.lastBaselineAnchor constraintEqualToAnchor:self.textField.lastBaselineAnchor].active = YES;
     [self.label.leadingAnchor constraintEqualToAnchor:container.leadingAnchor].active = YES;
     [self.textField.leadingAnchor constraintEqualToAnchor:self.label.trailingAnchor constant:8.0].active = YES;
     [self.textField.trailingAnchor constraintEqualToAnchor:container.trailingAnchor].active = YES;
     [self.textField.topAnchor constraintEqualToAnchor:container.topAnchor].active = YES;
     [self.textField.bottomAnchor constraintEqualToAnchor:container.bottomAnchor].active = YES;
      
     // Set exterior constraints.
     UILayoutGuide *margins = self.view.layoutMarginsGuide;
      
     [container.leadingAnchor constraintEqualToAnchor:margins.leadingAnchor].active = YES;
     [container.trailingAnchor constraintEqualToAnchor:margins.trailingAnchor].active = YES;
     [container.topAnchor constraintEqualToAnchor:self.topLayoutGuide.bottomAnchor constant:20.0].active = YES;
     =============================================================

     Layout guides provides a lightweight method for encapsulating
     part of your layout. Note that this technique only affects
     how Auto Layout interacts with the encapsulated views. It
     does not change the view hierarchy in any way. However, this
     is not the only way to create modular user interfaces.
     Container views and container view controllers provide an
     even greater degree of encapsulation, letting you separate
     the layout, the view hierarchy and even the related view
     controller code.
     
     Additionally, layout constraints do not fully encapsulate
     their contents. The system still compares the priority of
     optional constraints inside the layout guide with the priority
     of optional constraints outside the guide.
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
