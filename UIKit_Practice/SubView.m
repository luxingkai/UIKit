//
//  SubView.m
//  UIKit_Practice
//
//  Created by tigerfly on 2020/11/10.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "SubView.h"

@implementation SubView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(frame.size.width-20, frame.size.height-20, 100, 100)];
        view.backgroundColor = UIColor.blueColor;
        [self addSubview:view];
    }
    return self;
}

/**
 UIEvent
 UITouch
 */
- (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil) {
        for (UIView *subView in self.subviews) {
            CGPoint newPoint = [self convertPoint:point toView:subView];
            BOOL result = [subView pointInside:newPoint withEvent:event];
            if (result == YES) {
                return subView;
            }
        }
    }
    return view;
}

@end
