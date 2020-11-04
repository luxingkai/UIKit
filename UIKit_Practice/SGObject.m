//
//  SGObject.m
//  UIKit_Practice
//
//  Created by tigerfly on 2020/11/3.
//  Copyright © 2020 tiger fly. All rights reserved.
//

#import "SGObject.h"

@implementation SGObject

- (void)encodeWithCoder:(NSCoder *)coder {

}

- (id)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {

    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    SGObject *object = self;
    return object;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    SGObject *newOne = [self.class new];
    newOne.value = _value;
    newOne.csd = _csd;
    return newOne;
}


@end
