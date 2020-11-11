//
//  TextDisplay_Fonts.m
//  UIKit_Practice
//
//  Created by tigerfly on 2020/11/5.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "TextDisplay_Fonts.h"
#import <CoreText/CoreText.h>

@implementation DisplayView {
    NSLayoutManager *_layoutManager;
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        _layoutManager = [[NSLayoutManager alloc] init];
        _layoutManager.delegate = self;
        
        _layoutManager.allowsNonContiguousLayout = true;
        _layoutManager.showsInvisibleCharacters = YES;
        _layoutManager.showsControlCharacters = YES;
        _layoutManager.usesFontLeading = YES;
        _layoutManager.limitsLayoutForSuspiciousContents = NO;
        _layoutManager.usesDefaultHyphenation = YES;
        
        
    }
    return self;
}





@end



@interface TextDisplay_Fonts ()<NSLayoutManagerDelegate,NSTextLayoutOrientationProvider>

@end

@implementation TextDisplay_Fonts

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     Display text, manage fonts, and check spelling
     */
    
    
#pragma mark -- Layout
    
    /*
     NSLayoutManager
     
     An object that coordinates the layout and display of text
     characters.
     
     NSLayoutManager maps Unicode character codes to glyphs, sets
     the glyphs in a series of NSTextContainer objects, and displays
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
    
    /**
     Configuring the Global Layout Manager Options
     */
    //    layoutManager.allowsNonContiguousLayout
    //    layoutManager.hasNonContiguousLayout
    //    layoutManager.showsInvisibleCharacters
    //    layoutManager.showsControlCharacters
    //    layoutManager.usesFontLeading
    //    layoutManager.limitsLayoutForSuspiciousContents
    //    layoutManager.usesDefaultHyphenation
     
    /**
     Managing the Text Containers
     */
    //    layoutManager.textContainers
    //    layoutManager addTextContainer:(nonnull NSTextContainer *)
    //    layoutManager insertTextContainer:<#(nonnull NSTextContainer *)#> atIndex:<#(NSUInteger)#>
    //    layoutManager removeTextContainerAtIndex:<#(NSUInteger)#>
    //    layoutManager setTextContainer:<#(nonnull NSTextContainer *)#> forGlyphRange:<#(NSRange)#>
    //    layoutManager textContainerChangedGeometry:<#(nonnull NSTextContainer *)#>
    //    layoutManager textContainerForGlyphAtIndex:<#(NSUInteger)#> effectiveRange:<#(nullable NSRangePointer)#>
    //    layoutManager textContainerForGlyphAtIndex:<#(NSUInteger)#> effectiveRange:<#(nullable NSRangePointer)#> withoutAdditionalLayout:<#(BOOL)#>
    //    layoutManager usedRectForTextContainer:<#(nonnull NSTextContainer *)#>
    
    /**
     Invalidating Glyphs and Layout
     */
    //    layoutManager invalidateDisplayForGlyphRange:(NSRange)
    //    layoutManager invalidateDisplayForCharacterRange:<#(NSRange)#>
    //    layoutManager invalidateGlyphsForCharacterRange:<#(NSRange)#> changeInLength:<#(NSInteger)#> actualCharacterRange:<#(nullable NSRangePointer)#>
    //    layoutManager invalidateLayoutForCharacterRange:<#(NSRange)#> actualCharacterRange:<#(nullable NSRangePointer)#>
    //    layoutManager processEditingForTextStorage:<#(nonnull NSTextStorage *)#> edited:<#(NSTextStorageEditActions)#> range:<#(NSRange)#> changeInLength:<#(NSInteger)#> invalidatedRange:<#(NSRange)#>
    
    /**
     Causing Glyph Generation and Layout
     */
    //    layoutManager ensureGlyphsForCharacterRange:<#(NSRange)#>
    //    layoutManager ensureGlyphsForGlyphRange:<#(NSRange)#>
    //    layoutManager ensureLayoutForBoundingRect:<#(CGRect)#> inTextContainer:<#(nonnull NSTextContainer *)#>
    //    layoutManager ensureLayoutForCharacterRange:<#(NSRange)#>
    //    layoutManager ensureLayoutForGlyphRange:<#(NSRange)#>
    //    layoutManager ensureLayoutForTextContainer:<#(nonnull NSTextContainer *)#>
    
    /**
     Accessing Glyphs
     */
    //    layoutManager getGlyphsInRange:<#(NSRange)#> glyphs:<#(nullable CGGlyph *)#> properties:<#(nullable NSGlyphProperty *)#> characterIndexes:<#(nullable NSUInteger *)#> bidiLevels:<#(nullable unsigned char *)#>
    //    layoutManager CGGlyphAtIndex:<#(NSUInteger)#>
    //    layoutManager CGGlyphAtIndex:<#(NSUInteger)#> isValidIndex:<#(nullable BOOL *)#>
    //    layoutManager setGlyphs:<#(nonnull const CGGlyph *)#> properties:<#(nonnull const NSGlyphProperty *)#> characterIndexes:<#(nonnull const NSUInteger *)#> font:<#(nonnull UIFont *)#> forGlyphRange:<#(NSRange)#>
    //    layoutManager characterIndexForGlyphAtIndex:<#(NSUInteger)#>
    //    layoutManager glyphIndexForCharacterAtIndex:<#(NSUInteger)#>
    //    layoutManager isValidGlyphIndex:<#(NSUInteger)#>
    //    layoutManager numberOfGlyphs
    //    layoutManager propertyForGlyphAtIndex:<#(NSUInteger)#>
    
    /**
     Setting Layout Information
     */
    //    layoutManager setAttachmentSize:<#(CGSize)#> forGlyphRange:<#(NSRange)#>
    //    layoutManager setDrawsOutsideLineFragment:<#(BOOL)#> forGlyphAtIndex:<#(NSUInteger)#>
    //    layoutManager setExtraLineFragmentRect:<#(CGRect)#> usedRect:<#(CGRect)#> textContainer:<#(nonnull NSTextContainer *)#>
    //    layoutManager setLineFragmentRect:<#(CGRect)#> forGlyphRange:<#(NSRange)#> usedRect:<#(CGRect)#>
    //    layoutManager setLocation:<#(CGPoint)#> forStartOfGlyphRange:<#(NSRange)#>
    //    layoutManager setNotShownAttribute:<#(BOOL)#> forGlyphAtIndex:<#(NSUInteger)#>
    
    /**
     Getting Layout Information
     */
    //    layoutManager attachmentSizeForGlyphAtIndex:<#(NSUInteger)#>
    //    layoutManager drawsOutsideLineFragmentForGlyphAtIndex:<#(NSUInteger)#>
    //    layoutManager extraLineFragmentRect
    //    layoutManager extraLineFragmentUsedRect
    //    layoutManager extraLineFragmentTextContainer
    //    layoutManager firstUnlaidGlyphIndex
    //    layoutManager firstUnlaidCharacterIndex
    //    layoutManager getFirstUnlaidCharacterIndex:<#(nullable NSUInteger *)#> glyphIndex:<#(nullable NSUInteger *)#>
    //    layoutManager lineFragmentRectForGlyphAtIndex:<#(NSUInteger)#> effectiveRange:<#(nullable NSRangePointer)#>
    //    layoutManager lineFragmentRectForGlyphAtIndex:<#(NSUInteger)#> effectiveRange:<#(nullable NSRangePointer)#> withoutAdditionalLayout:<#(BOOL)#>
    //    layoutManager lineFragmentUsedRectForGlyphAtIndex:<#(NSUInteger)#> effectiveRange:<#(nullable NSRangePointer)#>
    //    layoutManager lineFragmentUsedRectForGlyphAtIndex:<#(NSUInteger)#> effectiveRange:<#(nullable NSRangePointer)#> withoutAdditionalLayout:<#(BOOL)#>
    //    layoutManager locationForGlyphAtIndex:<#(NSUInteger)#>
    //    layoutManager notShownAttributeForGlyphAtIndex:<#(NSUInteger)#>
    //    layoutManager truncatedGlyphRangeInLineFragmentForGlyphAtIndex:<#(NSUInteger)#>
    
    /**
     Performing Advanced Layout Queries
     */
    //    layoutManager boundingRectForGlyphRange:<#(NSRange)#> inTextContainer:<#(nonnull NSTextContainer *)#>
    //    layoutManager characterIndexForPoint:<#(CGPoint)#> inTextContainer:<#(nonnull NSTextContainer *)#> fractionOfDistanceBetweenInsertionPoints:<#(nullable CGFloat *)#>
    //    layoutManager characterRangeForGlyphRange:<#(NSRange)#> actualGlyphRange:<#(nullable NSRangePointer)#>
    //    layoutManager enumerateEnclosingRectsForGlyphRange:<#(NSRange)#> withinSelectedGlyphRange:<#(NSRange)#> inTextContainer:<#(nonnull NSTextContainer *)#> usingBlock:<#^(CGRect rect, BOOL * _Nonnull stop)block#>
    //    layoutManager enumerateLineFragmentsForGlyphRange:<#(NSRange)#> usingBlock:<#^(CGRect rect, CGRect usedRect, NSTextContainer * _Nonnull textContainer, NSRange glyphRange, BOOL * _Nonnull stop)block#>
    //    layoutManager fractionOfDistanceThroughGlyphForPoint:<#(CGPoint)#> inTextContainer:<#(nonnull NSTextContainer *)#>
    //    layoutManager getLineFragmentInsertionPointsForCharacterAtIndex:<#(NSUInteger)#> alternatePositions:<#(BOOL)#> inDisplayOrder:<#(BOOL)#> positions:<#(nullable CGFloat *)#> characterIndexes:<#(nullable NSUInteger *)#>
    //    layoutManager glyphIndexForPoint:<#(CGPoint)#> inTextContainer:<#(nonnull NSTextContainer *)#>
    //    layoutManager glyphIndexForPoint:<#(CGPoint)#> inTextContainer:<#(nonnull NSTextContainer *)#> fractionOfDistanceThroughGlyph:<#(nullable CGFloat *)#>
    //    layoutManager glyphRangeForBoundingRect:<#(CGRect)#> inTextContainer:<#(nonnull NSTextContainer *)#>
    //    layoutManager glyphRangeForBoundingRectWithoutAdditionalLayout:<#(CGRect)#> inTextContainer:<#(nonnull NSTextContainer *)#>
    //    layoutManager glyphRangeForTextContainer:<#(nonnull NSTextContainer *)#>
    //    layoutManager glyphRangeForCharacterRange:<#(NSRange)#> actualCharacterRange:<#(nullable NSRangePointer)#>
    //    layoutManager rangeOfNominallySpacedGlyphsContainingIndex:<#(NSUInteger)#>
    
    
    /**
     Drawing
     */
    //    layoutManager drawBackgroundForGlyphRange:<#(NSRange)#> atPoint:<#(CGPoint)#>
    //    layoutManager drawGlyphsForGlyphRange:(NSRange) atPoint:<#(CGPoint)#>
    //    layoutManager drawStrikethroughForGlyphRange:<#(NSRange)#> strikethroughType:<#(NSUnderlineStyle)#> baselineOffset:<#(CGFloat)#> lineFragmentRect:<#(CGRect)#> lineFragmentGlyphRange:<#(NSRange)#> containerOrigin:<#(CGPoint)#>
    //    layoutManager drawUnderlineForGlyphRange:<#(NSRange)#> underlineType:<#(NSUnderlineStyle)#> baselineOffset:<#(CGFloat)#> lineFragmentRect:<#(CGRect)#> lineFragmentGlyphRange:<#(NSRange)#> containerOrigin:<#(CGPoint)#>
    //    layoutManager fillBackgroundRectArray:<#(nonnull const CGRect *)#> count:<#(NSUInteger)#> forCharacterRange:<#(NSRange)#> color:<#(nonnull UIColor *)#>
    //    layoutManager showCGGlyphs:<#(nonnull const CGGlyph *)#> positions:<#(nonnull const CGPoint *)#> count:<#(NSInteger)#> font:<#(nonnull UIFont *)#> textMatrix:<#(CGAffineTransform)#> attributes:<#(nonnull NSDictionary<NSAttributedStringKey,id> *)#> inContext:<#(nonnull CGContextRef)#>
    //    layoutManager strikethroughGlyphRange:<#(NSRange)#> strikethroughType:<#(NSUnderlineStyle)#> lineFragmentRect:<#(CGRect)#> lineFragmentGlyphRange:<#(NSRange)#> containerOrigin:<#(CGPoint)#>
    //    layoutManager underlineGlyphRange:<#(NSRange)#> underlineType:<#(NSUnderlineStyle)#> lineFragmentRect:<#(CGRect)#> lineFragmentGlyphRange:<#(NSRange)#> containerOrigin:<#(CGPoint)#>
    
    /**
     Supporting Types
     */
    //    NSTextLayoutOrientation
    
    
    /*
     NSTextLayoutOrientationProvider
     
     A set of methods that define the orientation of text for an object.
     
     In iOS, only the NSTextContainer class implements it. An NSTextContainer
     object returns the value from its associated text view when present;
     otherwise, it returns NSTextLayoutOrientationHorizontal by default. If
     you define a custom NSTextContainer object, you can override this
     method and return NSTextLayoutOrientationVertical to support laying out
     text vertically.
     */
    
    
    
#pragma mark -- Text Views
    
//    UILabel
//    UITextField
//    UITextView
    
    
#pragma mark -- Fonts
    
    /*
     Adding a Custom Font to Your App
     https://developer.apple.com/documentation/uikit/text_display_and_fonts/adding_a_custom_font_to_your_app?language=objc
     */
    
    
#pragma mark -- Font Picker
    
//    UIFontPickerViewController
//    UIFontPickerViewControllerConfiguration
    
    
#pragma mark -- Spell Checking
    
    /*
     UITextChecker
     
     An object to check a string (usually the text of a document) for
     misspelled words.
     
     UITextChecker spell-checks using a lexicon for a specific language.
     You can tell it to ignore specific words when spell-checking
     a particular document and you can have it learn words, which
     adds those words to the lexicon. You generally use one instance of
     UITextChecker per document, although you can use a single instance
     to spell-check related pieces of text if you want to share ignored
     words and other state.
     
     You may also use a text checker to obtain completions for partially
     entered words, as well as possible replacements for misspelle words,
     which you then can present to users.
     */
    
    /**
     Initiating a spell check
     */
    UITextChecker *textChecker = nil;
//    textChecker rangeOfMisspelledWordInString:<#(nonnull NSString *)#> range:<#(NSRange)#> startingAt:<#(NSInteger)#> wrap:<#(BOOL)#> language:<#(nonnull NSString *)#>
    
    /**
     Obtaining Word Guesses and Completions
     */
//    textChecker guessesForWordRange:<#(NSRange)#> inString:<#(nonnull NSString *)#> language:<#(nonnull NSString *)#>
//    textChecker completionsForPartialWordRange:<#(NSRange)#> inString:<#(nonnull NSString *)#> language:<#(nonnull NSString *)#>
    
    /**
     Learing and Ignoring Words
     */
//    textChecker ignoredWords
//    UITextChecker learnWord:<#(nonnull NSString *)#>
//    UITextChecker unlearnWord:<#(nonnull NSString *)#>
//    UITextChecker hasLearnedWord:<#(nonnull NSString *)#>
    
    /**
     Getting the Available Languages
     */
//    textChecke.availableLanguages
    
    
    
}


#pragma mark -- NSLayoutManagerDelegate

/** Invalidating Glyphs and Layout */

- (void)layoutManagerDidInvalidateLayout:(NSLayoutManager *)sender {
    
}

- (NSUInteger)layoutManager:(NSLayoutManager *)layoutManager
       shouldGenerateGlyphs:(const CGGlyph *)glyphs
                 properties:(const NSGlyphProperty *)props
           characterIndexes:(const NSUInteger *)charIndexes
                       font:(UIFont *)aFont
              forGlyphRange:(NSRange)glyphRange {
    return 10;
}

- (NSControlCharacterAction)layoutManager:(NSLayoutManager *)layoutManager
                          shouldUseAction:(NSControlCharacterAction)action
               forControlCharacterAtIndex:(NSUInteger)charIndex {
    return NSControlCharacterActionLineBreak;
}

/** Responding to Text Container Layout */

- (void)layoutManager:(NSLayoutManager *)layoutManager didCompleteLayoutForTextContainer:(NSTextContainer *)textContainer atEnd:(BOOL)layoutFinishedFlag {
    
}

- (void)layoutManager:(NSLayoutManager *)layoutManager
        textContainer:(NSTextContainer *)textContainer
didChangeGeometryFromSize:(CGSize)oldSize {
    
}

/** Handling Line Fragments */

- (BOOL)layoutManager:(NSLayoutManager *)layoutManager
shouldBreakLineByHyphenatingBeforeCharacterAtIndex:(NSUInteger)charIndex {
    return true;
}
- (BOOL)layoutManager:(NSLayoutManager *)layoutManager
shouldBreakLineByWordBeforeCharacterAtIndex:(NSUInteger)charIndex {
    return true;
}
- (CGFloat)layoutManager:(NSLayoutManager *)layoutManager
lineSpacingAfterGlyphAtIndex:(NSUInteger)glyphIndex
withProposedLineFragmentRect:(CGRect)rect {
    return 10.0;
}
- (CGFloat)layoutManager:(NSLayoutManager *)layoutManager
paragraphSpacingAfterGlyphAtIndex:(NSUInteger)glyphIndex
withProposedLineFragmentRect:(CGRect)rect {
    return 0.0;
}
- (CGFloat)layoutManager:(NSLayoutManager *)layoutManager
paragraphSpacingBeforeGlyphAtIndex:(NSUInteger)glyphIndex
withProposedLineFragmentRect:(CGRect)rect {
    return 0.0;
}
- (CGRect)layoutManager:(NSLayoutManager *)layoutManager
boundingBoxForControlGlyphAtIndex:(NSUInteger)glyphIndex
       forTextContainer:(NSTextContainer *)textContainer
   proposedLineFragment:(CGRect)proposedRect
          glyphPosition:(CGPoint)glyphPositio
         characterIndex:(NSUInteger)charIndex {
    return CGRectZero;
}
- (BOOL)layoutManager:(NSLayoutManager *)layoutManager
shouldSetLineFragmentRect:(inout CGRect *)lineFragmentRect
 lineFragmentUsedRect:(inout CGRect *)lineFragmentUsedRect
       baselineOffset:(inout CGFloat *)baselineOffset
      inTextContainer:(NSTextContainer *)textContainer
        forGlyphRange:(NSRange)glyphRange {
    return true;
}

/** Managing Temporary Attribute Support */

- (NSDictionary<NSAttributedStringKey, id> *)layoutManager:(NSLayoutManager *)layoutManager
                              shouldUseTemporaryAttributes:(NSDictionary<NSAttributedStringKey, id> *)attrs
                                        forDrawingToScreen:(BOOL)toScreen
                                          atCharacterIndex:(NSUInteger)charIndex
                                            effectiveRange:(NSRangePointer)effectiveCharRange {
    return @{NSFontAttributeName:[UIFont boldSystemFontOfSize:12]};
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
