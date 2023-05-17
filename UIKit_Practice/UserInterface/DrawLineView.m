//
//  DrawLineView.m
//  UIKit_Practice
//
//  Created by 陆兴凯 on 2023/4/15.
//  Copyright © 2023 tiger fly. All rights reserved.
//

#import "DrawLineView.h"
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>
#include <math.h>

@interface DrawLineView()

@property (nonatomic, strong) UIImageView *leftSlideView;
@property (nonatomic, strong) UIImageView *rightSlideView;
@property (nonatomic, assign) CGPoint initialCenter;

@end

@implementation DrawLineView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        //        UITapGestureRecognizer
        //        UISwipeGestureRecognizer
        //        UIPanGestureRecognizer
        //        UIScreenEdgePanGestureRecognizer
        //        UILongPressGestureRecognizer
        
        self.leftSlideView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, 20, 20)];
        self.leftSlideView.image = [UIImage imageNamed:@"huakuai-copy"];
        self.leftSlideView.userInteractionEnabled = true;
        [self addSubview:self.leftSlideView];
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [self.leftSlideView addGestureRecognizer:panGesture];
        
        self.rightSlideView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 5, 20, 20)];
        self.rightSlideView.image = [UIImage imageNamed:@"huakuai-copy"];
        [self addSubview:self.rightSlideView];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(context);
    //    CGContextSetBlendMode(context, kCGBlendModeLighten);
    CGMutablePathRef mutablePath = CGPathCreateMutable();
    CGPathMoveToPoint(mutablePath, NULL, 0, 0);
    CGPathAddLineToPoint(mutablePath, NULL, rect.size.width, 0);
    CGPathCloseSubpath(mutablePath);
    CGContextAddPath(context, mutablePath);
    
    CGContextSetFillColorWithColor(context, UIColor.greenColor.CGColor);
    CGContextSetStrokeColorWithColor(context, UIColor.blueColor.CGColor);
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGContextSetFillColorSpace(context, colorSpaceRef);
    CGContextSetLineWidth(context, 4);
    
    CGContextStrokePath(context);
    
}

//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Wundeclared-selector" //取消方法警告
- (void)pan:(UIPanGestureRecognizer *)gesture {
    if (gesture.view == nil) return;
    UIView *piece = gesture.view;
    // Get the changes in the X and Y directions relative to
    // the superview's coordinate space.
    CGPoint translation = [gesture translationInView:piece.superview];
    if (gesture.state == UIGestureRecognizerStateBegan) {
        // Save the view's original position.
        self.initialCenter = piece.center;
    }
    
    // Update the position for the .began, .changed, and .ended states
    if (gesture.state != UIGestureRecognizerStateCancelled) {
        // Add the X and Y translation to the view's original position.
        float pow_c = powf(translation.y, 2.0) + powf(translation.x, 2.0);
        float c = sqrtf(pow_c);
        float arc = asinf(translation.y/c);
        NSLog(@"%f",arc);
        if (arc <= (M_PI / 6)) {
            CGPoint newCenter = CGPointMake(self.initialCenter.x + translation.x, self.initialCenter.y + translation.y);
            piece.center = newCenter;
        }
    } else {
        // On cancellation, return the piece to its original location.
        piece.center = self.initialCenter;
    }
    
    
    
    
}

@end
