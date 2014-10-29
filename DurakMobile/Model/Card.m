//
//  Card.m
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import "Card.h"

@implementation Card

#pragma class methods
+ (Card *)cardWithValue:(NSUInteger)value suit:(CardSuit)suit
{
    return [[[self class] alloc]initWithValue:value suit:suit];
}

#pragma mark - initialization
- (id)initWithValue:(NSUInteger)value suit:(CardSuit)suit
{
    self = [super init];
    if(self) {
        _cardValue = value;
        _cardSuit = suit;
    }
    return self;
}

#pragma mark - properties methods
- (UIImage *)backImage
{
    return [UIImage imageNamed:@"red_back"];
}

- (UIImage *)cardImage
{
    return [UIImage imageNamed:[self cardImageName]];
}
#pragma mark - Private

- (NSString *) cardImageName
{
    static NSDictionary *cardValueTitles = nil;
    static NSDictionary *cardSuitTitles  = nil;
    
    if (cardValueTitles == nil)
    {
        cardValueTitles = @{@(2)  : @"2",
                            @(3)  : @"3",
                            @(4)  : @"4",
                            @(5)  : @"5",
                            @(6)  : @"6",
                            @(7)  : @"7",
                            @(8)  : @"8",
                            @(9)  : @"9",
                            @(10) : @"10",
                            @(11) : @"J",
                            @(12) : @"Q",
                            @(13) : @"K",
                            @(14) : @"A"};
    }
    
    if (cardSuitTitles == nil)
    {
        cardSuitTitles = @{@(kCardSuitClubs)    : @"C",
                           @(kCardSuitDiamonds) : @"D",
                           @(kCardSuitHearts)   : @"H",
                           @(kCardSuitSpades)   : @"S"};
    }
    return [NSString stringWithFormat: @"%@%@", cardValueTitles[@(_cardValue)], cardSuitTitles[@(_cardSuit)]];
}

#pragma mark - <CardViewDataSource>
- (UIImage *)imageForState:(CardViewState)state
{
    switch (state) {
        case CardViewStateOpen: {
            return [self cardImage];
        }
            break;
        case CardViewStateClosed: {
            return [self backImage];
        }
            break;
            
        default: {
            NSAssert(NO, @"Unknown Card View State");
        }
            break;
    }
    return nil;
}

@end
