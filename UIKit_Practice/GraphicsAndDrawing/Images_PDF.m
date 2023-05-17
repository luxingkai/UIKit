//
//  Images_PDF.m
//  UIKit_Practice
//
//  Created by tigerfly on 2020/11/5.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "Images_PDF.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreGraphics/CoreGraphics.h>

@interface Images_PDF ()

@end

@implementation Images_PDF

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     Create and manage images, including those that use bitmap and PDF formats.
     */
    
    
#pragma mark -- Representations
    
    /*
     UIImage
     An object that manages image data in your app.
     
     UIImageSymbolConfiguration
     An object that contains the specific font, size, style, and
     weight attributes to apply to a symbol image.
     
     UIImageConfiguration
     A configuration object that contains the traits that the
     system uses when selecting the current image variant.
     */
    
    
    
#pragma mark -- Image Creation
    
    /*
     UIGraphicsBeginImageContext
     Creates a bitmap-based graphics context and makes it the current
     context.
     
     UIGraphicsGetImageFromCurrentImageContext
     Returns an image from the contents of the current bitmap-based
     graphics context.
     
     UIGraphicsEndImageContext
     Removes the current bitmap-based graphics context from the top
     of the stack.
     
     UIImageJPEGRepresentation
     Returns a data object that contains the specified image in
     JPEG format.
     
     UIImagePNGRepresentation
     Returns a data object that contains the specified image in
     PNG format.
     */

    UIGraphicsBeginImageContext(CGSizeMake(100, 100));
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextDrawImage(contextRef, CGRectMake(0, 0, 100, 100), [UIImage imageNamed:@"f17df5bc-d80b-4e17-81cf-4277b1e0f6e4.png"].CGImage);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
#pragma mark -- Photo Album

    /*
     UIImageWriteToSavedPhotosAlbum
     Adds the specified image to the user’s Camera Roll album.
     
     UISaveVideoAtPathToSavedPhotosAlbum
     Adds the movie from the specified path to the user’s Camera Roll album.
     
     UIVideoAtPathIsCompatibleWithSavedPhotosAlbum
     Returns a Boolean value that indicates whether the specified video
     is compatible to save to the user’s Camera Roll album.
     */
    
    
#pragma mark -- PDF Creation

    /*
     UIGraphicsBeginPDFContextToData
     Creates a PDF graphics context that targets the specified
     mutable data object.
     
     UIGraphicsBeginPDFContextToFile
     Creates a PDF graphics context that targets a file at the
     specified path.
     
     UIGraphicsEndPDFContext
     Closes a PDF graphics context and pops it from the current
     context stack.
     
     UIGraphicsBeginPDFPage
     Marks the beginning of a new page in a PDF context and configures
     it using default values.
     
     UIGraphicsBeginPDFPageWithInfo
     Marks the beginning of a new page in a PDF context and configures
     it using the specified custom values.
     
     UIGraphicsGetPDFContextBounds
     Returns the current page bounds.
     
     UIGraphicsAddPDFContextDestinationAtPoint
     Creates a jump destination in the current page.
     
     UIGraphicsSetPDFContextDestinationForRect
     Links a rectangular area on the current page to the specified
     jump destination.
     
     UIGraphicsSetPDFContextURLForRect
     Links a rectangular area on the current page to the specified URL.
     */
    
//    NSMutableData *data = [NSMutableData data];
//    UIGraphicsBeginPDFContextToData(data, CGRectMake(0, 0, 100, 100), nil);
//    UIGraphicsBeginPDFPage();
//    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 100, 100), nil);
////    UIGraphicsGetPDFContextBounds();
//    UIGraphicsAddPDFContextDestinationAtPoint(@"", CGPointZero);
//    CGContextDrawPDFPage(contextRef, <#CGPDFPageRef  _Nullable page#>)
//    UIGraphicsEndPDFContext();
//
//    CGDataProviderRef dataProviderRef = CGDataProviderCrea-teWithFilename("");
//    CGPDFDocumentCreateWithProvider(<#CGDataProviderRef  _Nullable provider#>)
//    CGPDFDocumentGetPage(<#CGPDFDocumentRef  _Nullable document#>, <#size_t pageNumber#>)
    
    
    
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
