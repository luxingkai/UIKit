//
//  TextStorage.m
//  UIKit_Practice
//
//  Created by tigerfly on 2020/11/5.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "TextStorage.h"

@interface TextStorage ()<NSTextStorageDelegate,UITextFormattingCoordinatorDelegate>

@end

@implementation TextStorage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     Manage text storage and coordinate the layout of text.
     */
    
#pragma mark -- Data
    
    /*
     NSTextStorage
     
     The fundamental storage mechanism of TextKit.
     
     NSTextStorage is a semi concrete subclass of NSMutableAttributedString
     that adds behavior for managing a set of client NSLayoutManager objects.
     A text storage object notifies its layout manages of changes to
     its characters or attributes, which lets the layout managers redisplay
     the text as needed.
     
     A text storage object can be accessed from any thread of your app,
     but your app must guarantee access from only one thread at a time.
     
     Subclassing Notes
     The NSTextStorage class implements change management (via the beginEditing
     and endEditing methods), verification of attributes, delegate handling,
     and layout management notification. The one aspect it does not implement
     is managing the actual attributed string storage, which subclass manage
     by overriding the two NSAttributedString primitives:
     •  string
     •  attributesAtIndex: effectiveRange:
     •  raplaceCharactersInRange:withString:
     •  setAttributes:range:
     
     These primitives should perform the change, then call
     edited:range:changeInLength: to let the parent class know what changes
     were made.
     */
    
    /**
     Processing the Editing Actions
     */
    NSTextStorage *textStorage = [NSTextStorage new];
    textStorage.delegate = self;
    
    /**
     Accessing the layout Managers
     */
    //    textStorage.layoutManagers
    //    textStorage addLayoutManager:<#(nonnull NSLayoutManager *)#>
    //    textStorage removeLayoutManager:<#(nonnull NSLayoutManager *)#>
    
    /**
     Managing Edits
     */
    //    textStorage edited:<#(NSTextStorageEditActions)#> range:<#(NSRange)#> changeInLength:<#(NSInteger)#>
    //    textStorage processEditing
    
    /**
     Fixing the String Attribtues
     */
    //    textStorage invalidateAttributesInRange:<#(NSRange)#>
    //    textStorage ensureAttributesAreFixedInRange:<#(NSRange)#>
    //    textStorage fixesAttributesLazily
    
    /**
     Determining the Nature of Changes
     */
    //    textStorage.editedMask
    //    textStorage.editedRange
    //    textStorage.changeInLength
    
    /**
     Constants
     */
    //    NSTextStorageEditActions
    
    /**
     Notifications
     */
    //    NSTextStorageWillProcessEditingNotification
    //    NSTextStorageDidProcessEditingNotification
    
    
    /*
     NSTextContainer
     
     A region where text layout occurs.
     
     An NSLayoutManager uses NSTextContainer to determine where to break
     lines, lay out portions of text, and so on. An NSTextContainer object
     typically defines rectangular regions, but you can define exclusion
     paths inside the text container to create regions where text does
     not flow. You can also subclass to create text containers with
     nonrectangular regions, such as circular regions, regions with
     holes in them, or regions that flow alongside graphics.
     
     Instances of the NSTextContainer, NSLayoutManager, and NSTextStorage
     classes can be accessed from threads other than the main thread
     as long as the app guarantees access from only one thread at
     a time.
     */
    
    /**
     Creating a Text Container
     */
    //    [NSTextContainer alloc] initWithSize:<#(CGSize)#>
    //    [NSTextContainer alloc] initWithCoder:<#(nonnull NSCoder *)#>
    
    /**
     Managing Text Components
     */
    NSTextContainer *textContainer = nil;
    //    textContainer.layoutManager
    //    textContainer replaceLayoutManager:<#(nonnull NSLayoutManager *)#>
    
    /**
     Defining the Container Shape
     */
    //    textContainer.size
    //    textContainer.exclusionPaths
    //    textContainer.lineBreakMode
    //    textContainer.widthTracksTextView
    //    textContainer.heightTracksTextView
    
    /**
     Constraining text Layout
     */
    //    textContainer.maximumNumberOfLines
    //    textContainer.lineFragmentPadding
    //    textContainer lineFragmentRectForProposedRect:<#(CGRect)#> atIndex:<#(NSUInteger)#> writingDirection:<#(NSWritingDirection)#> remainingRect:<#(nullable CGRect *)#>
    //    textContainer.simpleRectangularTextContainer
    
    
    
#pragma mark -- Metrics
    
    /*
     UITextPosition
     
     A position in a text container -- that is, an index into the
     backing string in a text-display view.
     
     Classes that adopt the UITextInput protocol must create custom
     UITextPosition objects for representing specific locations within
     the text managed by the class. The text input system uses both
     these objects and UITextRange objects for communicating text-layout
     information. There are two reasons for using objects for text
     positions rather than primitive types such as NSInteger:
     •  Some documents contain nested elements (for example, HTML tags and
     embadded objects) and you need to track both absolute position
     position in the visible text.
     •  The WebKit framework requires that text indexes and offsets be
     represented by objects.
     
     The simplest of UITextPosition objects -- for example, one use in
     plain text -- might have a single integer property that represents
     an offset into a string. If you adopt the UITextInput protocol,
     you must create a custom UITextRange subclass as well as a custom
     UITextPosition subclasses.
     
     */
    
    
    /*
     UITextRange
     
     A range of characters in a text container with a starting index
     and an ending index in string backing a text-entry object.
     
     Classes that adopt the UITextInput protocol must create custom
     UITextRange objects for representing rangse within the text
     managed by the class. The starting and ending indexes of the
     range are represented by UITextPosition objects. The text
     system uses both UITextRange and UITextPosition objects for
     communicating text-layout information. There are two reasons
     for using objects for next ranges rather than primitive types
     such as NSRange:
     •  Some documents contain nested elements (for example, HTML
     tags and embedded objects) and you need to track both
     absoluate position and position in the visible text.
     •  The WebKit framework requires that text indexes and offsets
     be represented by objects.
     If you adopt the UITextInput protocol, you must create a custom
     UITextRange subclass as well as a custom UITextPosition subclass.
     */
    
    /**
     Defining Ranges of Text
     */
    UITextRange *textRange = nil;
    //    textRange.start
    //    textRange.end
    //    textRange.empty
    
    
    /*
     UITextSelectionRect
     
     An encapsulation of information about a selected range of text
     in a document.
     
     This class is an abstrct class and must be subclassed to be used.
     The system text input views provide their own concrete implementations
     of this class.
     
     If you are implementing a custom text input view, you can subclass
     and use your custom class to return selection-related information.
     When subclassing, you should override and reimplement all
     properties. In your custom implementations, do not call super.
     */
    
    /**
     Accessing the Selection Rectangle
     */
    UITextSelectionRect *selectionRect = nil;
    //    selectionRect.rect
    
    /**
     Accessing Text-Related Attributes
     */
    //    selectionRect.writingDirection
    //    selectionRect.isVertical
    
    /**
     Determining the Selection Status
     */
    //    selectionRect.containsEnd
    //    selectionRect.containsEnd
    
    
#pragma mark -- Paragraphs
    
    /*
     NSParagraphStyle
     
     The paragraph or ruler attributes for an attributed string.
     
     The NSParagraphStyle class and its subclass NSMutableParagraphStyle
     encapsulate the paragraph or ruler attributes used by the
     NSAttributedString classes. Instances of these classes are often
     referred to as paragraph style objects or, when no confusion
     will result, paragraph styles.
     */
    
    /**
     Creating a Paragraph style
     */
    NSParagraphStyle *paragraphStyle = [NSParagraphStyle defaultParagraphStyle];
    
    /**
     Accessing Style Information
     */
    //    paragraphStyle.alignment
    //    paragraphStyle.firstLineHeadIndent
    //    paragraphStyle.headIndent
    //    paragraphStyle.tailIndent
    //    paragraphStyle.lineHeightMultiple
    //    paragraphStyle.maximumLineHeight
    //    paragraphStyle.minimumLineHeight
    //    paragraphStyle.lineSpacing
    //    paragraphStyle.paragraphSpacing
    //    paragraphStyle.paragraphSpacingBefore
    
    /**
     Accessing Tab Information
     */
    //    paragraphStyle.tabStops
    //    paragraphStyle.defaultTabInterval
    
    /**
     Getting Line Break information
     */
    //    paragraphStyle.lineBreakMode
    //    paragraphStyle.hyphenationFactor
    //    paragraphStyle.allowsDefaultTighteningForTruncation
    
    /**
     Determining Writing Direction
     */
    //    NSParagraphStyle defaultWritingDirectionForLanguage:<#(nullable NSString *)#>
    //    paragraphStyle.baseWritingDirection
    
    
    /*
     NSMutableParagraphStyle
     
     An object for changing the values of the subattributes in a paragraph
     style attribute.
     
     The NSMutableParagraphStyle class adds methods to its superclass,
     NSParagraphStyle, for changing the values of the subattributes in
     a paragraph style attribute.
     */
    
    /**
     Setting Style Information
     */
    NSMutableParagraphStyle *mutableParagraphStyle = nil;
    //    mutableParagraphStyle setParagraphStyle:<#(nonnull NSParagraphStyle *)#>
    //    mutableParagraphStyle.alignment
    //    mutableParagraphStyle.firstLineHeadIndent
    //    mutableParagraphStyle.headIndent
    //    mutableParagraphStyle.tailIndent
    //    mutableParagraphStyle.lineHeightMultiple
    //    mutableParagraphStyle.maximumLineHeight
    //    mutableParagraphStyle.minimumLineHeight
    //    mutableParagraphStyle.lineSpacing
    //    mutableParagraphStyle.paragraphSpacingBefore
    //    mutableParagraphStyle.paragraphSpacing
    //    mutableParagraphStyle.baseWritingDirection
    
    /**
     Specifying tab Information
     */
    //    mutableParagraphStyle addTabStop:<#(nonnull NSTextTab *)#>
    //    mutableParagraphStyle removeTabStop:<#(nonnull NSTextTab *)#>
    //    mutableParagraphStyle.tabStops
    //    mutableParagraphStyle.defaultTabInterval
    
    /**
     Setting Text Blocks and Lists
     */
    //    mutableParagraphStyle.lineBreakMode
    //    mutableParagraphStyle.hyphenationFactor
    //    mutableParagraphStyle.allowsDefaultTighteningForTruncation
    
    
    /*
     NSTextTab
     
     A tab in a paragraph.
     
     A text tab represents a tab in an NSParagraphStyle object, storing
     an alignment type and location. NSTextTab objects are most frequently
     used with the TextKit system and with NSRulerView and NSRulerMarker
     objects.
     
     The text system supports four alignment types: left, center, right,
     and decimal (based on the decimal separator character of the locale
     in effect). These alignment types are absolute, not based on the line
     sweep direction of text. For example, tabbed text is always positioned
     to the left of a right-aligned tab, whether the line sweep direction
     is left to right or right to left. A tab’s location, on the other hand,
     is relative to the back margin. A tab set at 1.5”, for example, is at 1.5”
     from the right in right to left text.
     */
    
    /**
     Creating a Text Tab
     */
    NSTextTab *textTab = nil;
//    NSTextTab *textTab = [NSTextTab alloc] initWithTextAlignment:<#(NSTextAlignment)#> location:<#(CGFloat)#> options:<#(nonnull NSDictionary<NSTextTabOptionKey,id> *)#>;
    
    /**
     Getting Tab Stop Information
     */
//    textTab.location
    
    /**
     Getting Text Tab Information
     */
//    textTab.alignment
//    textTab.options
//    NSTextTab columnTerminatorsForLocale:<#(nullable NSLocale *)#>
    

    
#pragma mark -- Attachmentes
    
    /*
     NSTextAttachment
     
     The values for the attachment attributes of attributed string
     and related objects.
     
     The NSAttributedString class cluster uses text attachment objects as
     the values for attachment attributes (stored in the attributed string
     under the key named NSAttachmentAttributeName).
     
     A text attachment object contains either an NSData object or an NSFileWrapper
     object, which in turn holds the contents of the attached file. The properties
     of this class configure the appearance of the text attachment in your
     interface. In macOS, the text attachment also uses a cell object conforming
     to the NSTextAttachmentCell protocol to draw and handle mouse events.
     */
    
    /**
     Initializing a Text Attachment
     */
//    NSTextAttachment *textAttachment = [NSTextAttachment alloc] initWithData:<#(nullable NSData *)#> ofType:<#(nullable NSString *)#>;
//    NSTextAttachment textAttachmentWithImage:<#(nonnull UIImage *)#>
    
    /**
     Defining the Contents
     */
    NSTextAttachment *textAttachment = nil;
//    textAttachment.bounds
//    textAttachment.contents
//    textAttachment.fileType
//    textAttachment.image
    
    
#pragma mark -- Text Formatting
    
    /*
     UITextFormattingCoordinator
     
     An object that coordinates text formatting using the standard Mac
     font panel.
     */
    
    /**
     Creating a Text-Formatting Coordinator
     */
    UITextFormattingCoordinator *coordinator = nil;
//    UITextFormattingCoordinator textFormattingCoordinatorForWindowScene:<#(nonnull UIWindowScene *)#>
//    [UITextFormattingCoordinator alloc] initWithWindowScene:<#(nonnull UIWindowScene *)#>
    
    /**
     Showing the Font Panel
     */
//    coordinator.isFontPanelVisible
//    UITextFormattingCoordinator toggleFontPanel:<#(nonnull id)#>
    
    /**
     Configuring the Font Panel
     */
//    coordinator setSelectedAttributes:<#(nonnull NSDictionary<NSAttributedStringKey,id> *)#> isMultiple:<#(BOOL)#>
    
    /**
     Applying Updated Text Attribtues
     */
    coordinator.delegate = self;
    
    
#pragma mark -- Text Manipulations
    
//    NSTextAlignmentToCTTextAlignment(<#NSTextAlignment nsTextAlignment#>)
//    NSTextAlignmentFromCTTextAlignment(<#CTTextAlignment ctTextAlignment#>)
    
    
}


#pragma mark -- NSTextStorageDelegate

- (void)textStorage:(NSTextStorage *)textStorage didProcessEditing:(NSTextStorageEditActions)editedMask range:(NSRange)editedRange changeInLength:(NSInteger)delta {
    
}

- (void)textStorage:(NSTextStorage *)textStorage willProcessEditing:(NSTextStorageEditActions)editedMask range:(NSRange)editedRange changeInLength:(NSInteger)delta {
    
}

#pragma mark -- UITextFormattingCoordinatorDelegate

- (void)updateTextAttributesWithConversionHandler:(UITextAttributesConversionHandler)conversionHandler {
    
    
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
