//
//  City.m
//  CodeChallenge2
//
//  Created by GLBMXM0002 on 10/10/14.
//  Copyright (c) 2014 asda. All rights reserved.
//

#import "City.h"

@implementation City

- (instancetype)initWithName: (NSString *) name {
    self = [super init];
    if (name.length == 0) {
        [NSException raise:NSInvalidArgumentException format:@"City must have a name"];
    }
    self.name = name;
    return self;
}

@end
