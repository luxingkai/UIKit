//
//  TextDisplay_Fonts.h
//  UIKit_Practice
//
//  Created by tigerfly on 2020/11/5.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DisplayView : UIView<NSLayoutManagerDelegate>

@property (nonatomic, readonly) NSLayoutManager *layoutManager;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) UIFont *font;

@end

@interface TextDisplay_Fonts : UIViewController

@end

NS_ASSUME_NONNULL_END
