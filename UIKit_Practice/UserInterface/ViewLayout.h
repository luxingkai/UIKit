//
//  ViewLayout.h
//  UIKit_Practice
//
//  Created by tigerfly on 2020/11/5.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewLayout : UIViewController

- (NSString *)constraintWithTargetViews:(UIView *)Views __attribute__((warn_unused_result));
@end

NS_ASSUME_NONNULL_END
