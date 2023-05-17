//
//  SGObject.m
//  UIKit_Practice
//
//  Created by tigerfly on 2020/11/3.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "SGObject.h"


@implementation SGObject

//+ (BOOL)supportsSecureCoding {
//    return YES;
//}
//
//- (void)encodeWithCoder:(NSCoder *)coder {
//    [coder encodeObject:self.csd forKey:@"csd"];
//    [coder encodeFloat:self.value forKey:@"value"];
//}
//
//- (id)initWithCoder:(NSCoder *)coder {
//    if (self = [super init]) {
//        self.csd = [coder decodeObjectOfClass:[NSString class] forKey:@"csd"];
//        self.value = [coder decodeFloatForKey:@"value"];
//    }
//    return self;
//}
//
//- (id)copyWithZone:(NSZone *)zone {
//    SGObject *object = [[[self class] allocWithZone:zone] init];
//    return object;
//}
//
//- (id)mutableCopyWithZone:(NSZone *)zone {
//    SGObject *newOne = [[self.class allocWithZone:zone] init];
//    newOne.value = _value;
//    newOne.csd = _csd;
//    return newOne;
//}
//
//- (void)eat {
//    NSLog(@"吃橘子");
//}


@end
