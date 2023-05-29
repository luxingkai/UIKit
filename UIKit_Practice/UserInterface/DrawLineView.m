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

#ifndef AXIS_Y
#define AXIS_Y 20.0
#endif

@interface DrawLineView()
/// 左滑块
@property (nonatomic, strong) UIImageView *l_slideView;
/// 右滑块
@property (nonatomic, strong) UIImageView *r_slideView;
/// 初始位置
@property (nonatomic, assign) CGPoint initialCenter;
/// 左滑块指定的刻度节点
@property (nonatomic, strong) UIView *l_node;
/// 右滑块指定的刻度节点
@property (nonatomic, strong) UIView *r_node;


@end

@implementation DrawLineView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        /// 最左边滑块
        self.l_slideView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 30, 18, 22)];
        self.l_slideView.image = [UIImage imageNamed:@"os_slider"];
        self.l_slideView.userInteractionEnabled = true;
        [self addSubview:self.l_slideView];
        /// 最右边滑块
        self.r_slideView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 30, 18, 22)];
        self.r_slideView.image = [UIImage imageNamed:@"os_slider"];
        self.r_slideView.userInteractionEnabled = true;
        [self addSubview:self.r_slideView];
        
        UIPanGestureRecognizer *minPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(minPan:)];
        [self.l_slideView addGestureRecognizer:minPanGesture];
        
        UIPanGestureRecognizer *maxPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(maxPan:)];
        [self.r_slideView addGestureRecognizer:maxPanGesture];
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    /// 刻度宽度
    float scale_line_w = 1;
    /// 刻度高度
    float scale_line_h = 4;
    /// 刻度间距
    float scale_inset_w = (self.bounds.size.width - self.range.count * scale_line_w) / (self.range.count - 1);
    /// 主轴
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGMutablePathRef axisPath = CGPathCreateMutable();
    CGPathMoveToPoint(axisPath, NULL, 0, AXIS_Y);
    CGPathAddLineToPoint(axisPath, NULL, rect.size.width, AXIS_Y);
    CGPathCloseSubpath(axisPath);
    CGContextAddPath(context, axisPath);
    
    CGContextSetFillColorWithColor(context, [self colorHex:0xE8E8E8].CGColor);
    CGContextSetStrokeColorWithColor(context, [self colorHex:0xE8E8E8].CGColor);
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGContextSetFillColorSpace(context, colorSpaceRef);
    CGContextSetLineWidth(context, scale_line_h);
    
    CGContextStrokePath(context);
    
    CGPathRelease(axisPath);
    
    /// 刻度
    for (int i = 0; i <= self.range.count; i ++) {
        
        CGMutablePathRef scalePath = CGPathCreateMutable();
        CGPathMoveToPoint(scalePath, NULL, i * (scale_line_w + scale_inset_w), 14);
        CGPathAddLineToPoint(scalePath, NULL, i * (scale_line_w + scale_inset_w), 18);
        CGPathCloseSubpath(scalePath);
        CGContextAddPath(context, scalePath);
        
        CGContextSetFillColorWithColor(context, [self colorHex:0xE8E8E8].CGColor);
        CGContextSetStrokeColorWithColor(context, [self colorHex:0xE8E8E8].CGColor);
        CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
        CGContextSetFillColorSpace(context, colorSpaceRef);
        CGContextSetLineWidth(context, 1);
        
        CGContextStrokePath(context);
        
        CGPathRelease(scalePath);
        
        /// 每个刻度对应的数值
        if (i == self.range.count) return;
        NSString *singleScala = [NSString stringWithFormat:@"%@",self.range[i]];
        CGFloat scale_text_w = [self widthForScaleValue:singleScala];
        CATextLayer *textLayer = [CATextLayer layer];
        textLayer.frame = CGRectMake(i * (scale_line_w + scale_inset_w), 0, scale_text_w, 14);
        textLayer.string = singleScala;
        textLayer.font = CFBridgingRetain([UIFont systemFontOfSize:10 weight:UIFontWeightMedium]);
        textLayer.fontSize = 10;
        textLayer.foregroundColor = [self colorHex:0x999999].CGColor;
        textLayer.contentsScale = [UIScreen mainScreen].scale;
        [self.layer addSublayer:textLayer];
    }
    
}

- (void)minPan:(UIPanGestureRecognizer *)gesture {
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
        /// 超出视图范围不准滑动
        NSUInteger integer_part = ceil(piece.center.x);
        printf("%lu\n",(unsigned long)integer_part);
//        if (integer_part >= 9 && integer_part <= (self.frame.size.width - 9)) {
            // Add the X and Y translation to the view's original position.
            float pow_c = powf(translation.y, 2.0) + powf(translation.x, 2.0);
            float c = sqrtf(pow_c);
            float arc = asinf(translation.y / c);
            float limit = M_PI / 6;
            ///
            if (-limit <= arc && arc <= limit) {
                CGPoint newCenter = CGPointMake(self.initialCenter.x + translation.x, self.initialCenter.y);
                piece.center = newCenter;
            }
//        }
        
    } else {
        // On cancellation, return the piece to its original location.
        piece.center = self.initialCenter;
    }
    
}

- (void)maxPan:(UIPanGestureRecognizer *)gesture {
    
}

#pragma mark --

- (UIColor *)colorHex:(NSUInteger)hex {
    float r = (0xff0000 & hex) >> 16;
    float g = (0x00ff00 & hex) >> 8;
    float b = 0x0000ff & hex;
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
}

- (CGFloat)widthForScaleValue:(NSString *)scale {
    CGRect rect = [scale boundingRectWithSize:CGSizeMake(MAXFLOAT, 14) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10 weight:UIFontWeightMedium]} context:nil];
    return ceil(rect.size.width);
}

- (void)dealloc {
    
}

@end
