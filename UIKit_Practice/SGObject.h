//
//  SGObject.h
//  UIKit_Practice
//
//  Created by tigerfly on 2020/11/3.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 部分系统数据结构实现深浅拷贝的实践
 NSArray
 NSMutableArray
 NSDictionary
 NSMutableDicitonary
 NSMapTable
 NSHashTable
 NSString
 */

/**
 NSCoding
 
 A protocol that enables an object to be encoded and decoded for
 archiving and distribution.
 
 The NSCoding protocol declares the two methods that a class must
 implement so that instances of that class can be encoded and decoded.
 This capability provides the basis for archiving (where objects and
 other structures are stored on disk) and distribution
 (where objects are copied to different address spaces).
 
 In keeping with object-oriented design principles, an object being
 encoded or decoded is responsible for encoding and decoding its
 instance variables. A coder instructs the object to do so by invoking
 encodeWithCoder: or initWithCoder:. encodeWithCoder: instructs the object
 to encode its instance variables to the coder provided; an object
 can receive this method any number of times. initWithCoder: instructs
 the object to initialize itself from data in the coder provided;
 as such, it replaces any other initialization method and is sent
 only once per object. Any object class that should be codeable must
 adopt the NSCoding protocol and implement its methods.
 
 It is important to consider the possible types of archiving that
 a coder supports. In macOS 10.2 and later, keyed archiving is preferred.
 You may, however, need to support classic archiving. For details,
 see Archives and Serializations Programming Guide.
 */

/**
 NSCopying
 
 A protocol that objects adopt to provide functional copies of themselves.

 The exact meaning of “copy” can vary from class to class, but a copy must
 be a functionally independent object with values identical to the original
 at the time the copy was made. A copy produced with NSCopying is implicitly
 retained by the sender, who is responsible for releasing it.
 
 NSCopying declares one method, copyWithZone:, but copying is commonly
 invoked with the convenience method copy. The copy method is defined
 for all objects inheriting from NSObject and simply invokes copyWithZone:
 with the default zone.
 
 Your options for implementing this protocol are as follows:
 
 • Implement NSCopying using alloc and init... in classes that don’t
    inherit copyWithZone:.
 • Implement NSCopying by invoking the superclass’s copyWithZone: when
    NSCopying behavior is inherited. If the superclass
 • implementation might use the NSCopyObject function, make explicit
    assignments to pointer instance variables for retained objects.
 • Implement NSCopying by retaining the original instead of creating a new
    copy when the class and its contents are immutable.
 
 If a subclass inherits NSCopying from its superclass and declares additional
 instance variables, the subclass has to override copyWithZone: to properly
 handle its own instance variables, invoking the superclass’s implementation first.
 */

@interface SGObject : NSObject<NSCoding,NSCopying,NSMutableCopying>
@property (nonatomic, strong) NSString *csd;
@property (nonatomic, assign) float value;
@end

NS_ASSUME_NONNULL_END
