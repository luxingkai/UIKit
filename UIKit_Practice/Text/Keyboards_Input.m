//
//  Keyboards_Input.m
//  UIKit_Practice
//
//  Created by tigerfly on 2020/11/5.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "Keyboards_Input.h"

@interface Keyboards_Input ()

@end

@implementation Keyboards_Input

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     Configure the system keyboard, create your own keyboards to handle
     input, or detect key presses on a physical keyboard.
     */
    
#pragma mark -- Configuration
    
    /*
     UITextInputTraits
     
     A set of methods that defines features for keyboard input to a
     text object.
     
     For a custom text object to support keyboard input, it must adopt
     this protocol to interact properly with the text-input management
     system. The UITextField and UITextView classes automatically support
     this protocol.
     */
    
    
#pragma mark -- Text Interactions
    
    /*
     UITextInteraction
     
     An interaction that provides text selection gestures and UI to
     custom text views.
     
     Use UITextIneraction to provide your custom text views that
     same text selection gestures and UI available in native text
     views like UITextView and UITextField. When creating a text
     interaction, choose a mode that matches the state of the text,
     UITextInteractionModeEditable or UITextInterationModeNonEditable.
     Then set the textInput property to an object that conforms to
     UITextInput, and add the interaction to a view.
     
     If your custom text view supports editable and non-editable text,
     create two interactions -- one for each mode - and add the
     interaction that matches the state of text to the view while
     removing the other interaction.
     
     If you app provides other gesture in the same view hierarchy, you
     can use the requireGestureRecognizerToFail: method to set up
     failure requirements between your app's gestures and the text
     interaction gestures listed in the gesturesForFailureRequirements
     property.
     */
    
    /**
     Creating Text Interactions
     */
    UITextInteraction *textInteraction = [UITextInteraction textInteractionForMode:UITextInteractionModeEditable];
    
    /**
     Handling Text Input and Interaction Events
     */
//    textInteraction.textInput
//    textInteraction.delegate = self;
    
    /**
     Getting Interaction Information
     */
//    textInteraction.gesturesForFailureRequirementsz
//    textInteraction.textInteractionMode
    
    
    
#pragma mark --  Input
    
    /*
     UITextInput -- delegate
     
     A set of methods for interacting with the text input
     system and enabling features, such as autocorrect and
     multistage text input, in documents.
     
     Objects that adopt the UITextInput protocol maintain
     information about text input and provide that information
     to the text input system on demand. A UITextInput object
     interacts with the text input system by:
     
     •  Reporting text positions and text ranges
     •  Responding to queries layout and writing direction
     •  Performing hit-testing -- returning text positions and ranges
        for a specific point
     •  Providing teh sytem with rectangles for highlighting ranges
        of text and drawing the caret, a glyph that represents the
        insertion point during text entry.
     
     In addition, a UITextInput object maintains ranges for selected
     text and marked text. Marked text, a part of multistage text
     input, represents provisionally inserted text that the user
     has yet to confirm. The range of marked text always contains
     a range of selected text, which might be a range of character or
     the caret. Multistage text input is a requirement when the
     language is ideographic and the keyboard is phonetic.
     
     The UITextInput protocol works with other classes and protocols to
     integrate text-processing apps with the text input system:
     
     •  UITextPosition and UITextRange classes — All UITextInput-conforming
        document classes must create custom subclasses of these classes.
        A UITextPosition object represents a position in a text container.
        A UITextRange object, which encapsulates beginning and ending UITextPosition
        objects, represents a range of characters in the text container.
     
     •  UITextInputTokenizer protocol and UITextInputStringTokenizer class
        — The UITextInputTokenizer protocol defines an interface for tokenizing
        input text. The UITextInputStringTokenizer class is a default
        implementation of this protocol.
     
     •  UITextInputDelegate protocol — The text input system automatically
        assigns its own text input delegate (which conforms to this protocol)
        to the UITextInput-conforming document object. This text input delegate
        allows document objects to inform the input system of changes in text
        and selection.
     
     •  UIKeyInput protocol — Implement this protocol to allow text entry
        and deletion at an insertion point.
     
     The UITextInput protocol also inherits the UITextInputTraints protocol
     which provides customization of the keyboard and its behaviors.
     
     When the user chooses dictation input on a supported device, the system
     automatically inserts recognized phrases into the current text view.
     Methods in the UITextInput protocol allow your app to respond to the
     completion of dictation. You can use an object of the UIDictationPhrase
     class to obtain a string that represents a phrase the user dictates.
     In the case of ambiguous dictation results, a dictation phrase object
     provides an array that contains alternative strings.
     */
    
    
    /*
     UITextInputDelegate -- delegate
     
     An intermediary between a document and the text input system.
     
     A UITextInputDelegate converys notifications of pending or
     transpired changes in text and selection in the document.
     UIKit provides a private text input delegate, which it assigns
     at runtime to the inputDelegate property of the object whose
     class adopts the UITextInput protocol.
     */
    
    
    /*
     UITextInputTokenizer -- delegate
     
     A tokenizer, which is an object that allows the text input
     system to evaluate text units of different granularities.
     
     Granularities of text units are always evaluated with reference
     to a storage or reference direction.
     
     Text-processing objects that conform to the UITextInput
     protocol must hold a reference to a tokenizer(via the tokenizer
     property). The UITextInputStringTokenizer class provides a
     default base implementation of the UITextInputTokenizer
     protocol. Tokenizers of this class are suitable for most
     western-language keyboards. Apps with different requirements
     may adopt the UITextInputTokenizer protocol and create
     their own tokenizers.
     */
    
     
    /*
     UIKeyInput
     
     A set of method a responder uses to implement simple text entry.
     
     Adopt this protocol in a subclass of UIResponder to support text
     entry. When instances of this subclass are the first responder, the
     system keyboard displays. Only a small subset of the available
     keyboards and languages are available to classes the adopt this
     protocol.
     */
    
    
    /*
     UITextInputStringTokenizer
     
     A base implementation of the text-input tokenizer protocol.
     
     If you want to take advantage of this base implementation of
     the UITextInputTokenizer protocol, you should subclass this
     class and handle application-specific directions and granularities
     affected by layout. When you instantiate a class you must supply
     the document class that is adopting the UITextInput protocol
     for your application.
     
     When you subclass UITextInputStringTokenizer, override all
     UITextInputTokenizer methods, calling the superclass implementation
     (super) when method parameters are not affected by layout. For example,
     the subclass needs a custom implementation of all methods for line
     granularity. For the left direction, it needs to decide whether left
     corresponds at a given position to forward or backward, and then call
     super passing in the storage direction (UITextStorageDirection).
     */
    
    
    /*
     UIDictationPhrase
     
     An object that represents the textual interpretation of a spoken
     phrase that the user dictates.
     
     When the user chooses dictation input on a supported device, the
     system automatically inserts recognized phrases into the current
     text view. You can use an object of the UIDictationPhrase class
     to obtain a string representing a phrase a user has dictated.
     In the case of ambiguous dictation results. a dictation phrase
     object provides an array containing alternative strings. Methods
     in the UITextInput protocol allow your app to respond to the
     completion of dictation.
     */
    
    UIDictationPhrase *dictationPhrase = nil;
//    dictationPhrase.alternativeInterpretations
//    dictationPhrase.text
    
    
    /*
     UIInputView
     
     An object that displays and manages custom input for a view
     when that view becomes the first responder.
     
     The UIInputView class is designed to match the appearance of the
     standard system keyboard when used as an input view with a responder.
     When defining your own custom input views or input accessory views,
     you can use a UIInputView object as the root view and add any subviews
     you want to create your input view. The input view and its subviews
     receive tinting and blur effects based on the options you specify at
     initialization time.
     
     ⚠️ The effects offered by this class are applied only when the
     view is attached to a responder as either an input view or input
     accessory view. For subviews to receive style effects, they must
     conform to the UIAppearance protocol.
     */
    
    /**
     Initializing an Input View
     */
//    [UIInputView alloc] initWithFrame: inputViewStyle:<#(UIInputViewStyle)#>
    UIInputView *inputView = nil;
    
    /**
     Getting the Input Style
     */
//    inputView.inputViewStyle
    
    /**
     Sizing the Input View
     */
//    inputView.allowsSelfSizing
    
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
