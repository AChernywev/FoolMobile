//
//  Player.h
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Hand.h"

@interface Player : NSObject
@property (nonatomic, strong) NSString *    name;
@property (nonatomic, strong) Hand *        hand;

@end
