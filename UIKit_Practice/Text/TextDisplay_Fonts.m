//
//  TextDisplay_Fonts.m
//  UIKit_Practice
//
//  Created by tigerfly on 2020/11/5.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "TextDisplay_Fonts.h"
#import <CoreText/CoreText.h>

@interface TextDisplay_Fonts ()

@end

@implementation TextDisplay_Fonts

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     Display text, manage fonts, and check spelling
     */
    
    /*
     Layout
     */
    
    /**
     NSLayoutManager
     
     An object that coordinates the layout and display of text
     characters.
     
     NSLayoutManager maps Unicode character codes to glyphs, sets
     the glyphs in a series of NSTextContianer objects, and displays
     them in a series of NSTextureView objects. In addition to its
     core function of laying out text, a layout manager object coordinates
     its text view object, provides services to those text views to
     support NSRulerView instances for editing paragraph styles, and
     handles the layout and display of text attributes not inherent in
     glyphs (such as underline or strikethrough). You can create a subclass
     of NSLayoutManager to handle additional text attributes, whether
     inherent or not.
     */
    
    /**
     Text Antialiasing
     
     NSLayoutManager provides the threshold for text antialiasing. It looks
     at the AppleAntialiasingThreshold default value. If the font size is
     smaller than or equal to this threshold size, the text is rendered
     aliased by NSLayoutManager.
     */
    
    /**
     Thread Safety of NSLayoutManager
     
     Generally speaking, a specific layout manager (and associated objects)
     should not be used in more than one block, operation, or thread at a time.
     Most layout managers are used on the main thread, since it is the main
     thread on which their text views are displayed, and since background layout
     occurs on the main thread.
     
     If you want to use a layout manager on a background thread, first make sure
     that text views associated with that layout manager (if any) are not
     displayed while the layout manager is being used on the background thread,
     and, second, turn off background layout for that layout manager while it is
     being used on the background thread. The most effective way to ensure
     that no text view is displayed, without knowing deep implementation, is
     just not to connect a text view to the layout manager.
     */
    
    /**
     Noncontiguous Layout
     
     Noncontiguous layout is an optional layout manager behavior.
     Previously, both glyph generation and layout were always performed,
     in order, from the beginning to the end of the document. When noncontiguous
     layout is turned on, however, the layout manager gains the option of
     performing glyph generation or layout for one portion of the document
     without having done so for previous sections. This can provide significant
     performance improvements for large documents.
     
     Noncontiguous layout is not turned on automatically because direct
     clients of NSLayoutManager typically have relied on the previous
     behavior—for example, by forcing layout for a specific glyph range,
     and then assuming that previous glyphs would therefore be laid out.
     Clients who use NSLayoutManager only indirectly—for example, those who use
     NSTextView without directly calling the underlying layout manager—can
     usually turn on noncontiguous layout without difficulty. Clients using
     NSLayoutManager directly need to examine their usage before turning on
     noncontiguous layout.
     
     Enable noncontiguous layout using the allowsNonContiguousLayout property.
     In addition, see the other methods in Causing Glyph Generation and Layout,
     many of which enable you to ensure that glyph generation and layout are
     performed for specified portions of the text. The behavior of a number of
     other layout manager methods is affected by the state of noncontiguous
     layout, as noted in the discussion sections of those method descriptions.
     */
    
    /**
     Creating a Layout Manager
     */
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    
    /**
     Managing the Layout Process
     */
    layoutManager.delegate = self;
    
    /**
     Accessing the Text Storage
     */
//    layoutManager.textStorage
    
    
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
