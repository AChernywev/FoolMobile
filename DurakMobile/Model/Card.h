//
//  Card.h
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CardView.h"

#pragma mark - typedefs
typedef NS_ENUM(NSInteger, CardSuit)
{
    kCardSuitSpades,
    kCardSuitHearts,
    kCardSuitClubs,
    kCardSuitDiamonds
};

#pragma mark - Constants

static NSInteger const kMinCardValue = 2;
static NSInteger const kMaxCardValue = 14;

@interface Card : NSObject <CardViewDataSource>
@property (nonatomic, readonly) CardSuit cardSuit;
@property (nonatomic, readonly) NSUInteger cardValue;
@property (nonatomic, readonly) UIImage *backImage;
@property (nonatomic, readonly) UIImage *cardImage;

+ (Card *)cardWithValue:(NSUInteger)value suit:(CardSuit)suit;
- (id)initWithValue:(NSUInteger)value suit:(CardSuit)suit;
@end
