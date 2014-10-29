//
//  Player.m
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import "Player.h"

@implementation Player

#pragma mark - initialization
- (id)init
{
    self = [super init];
    if (self) {
        self.hand = [Hand new];
    }
    return self;
}

@end
