//
//  Contstants.m
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import "Constants.h"

@implementation Constants

#pragma mark - Card Views
+ (CGFloat)defaultCardViewWidth
{
    return 225 * 0.3;
}

+ (CGFloat)defaultCardViewHeight
{
    return 315 * 0.3;
}

+ (CGSize)defaultCardViewSize
{
    return CGSizeMake([self defaultCardViewWidth],
                      [self defaultCardViewHeight]);
}

+ (CGRect)defaultCardViewBounds
{
    CGSize size = [self defaultCardViewSize];
    return CGRectMake(0.0, 0.0, size.width, size.height);
}

#pragma mark - Deck views
+ (UIFont *)deckViewCardCountFont
{
    CGFloat fontSize = 12.0;
    return [UIFont boldSystemFontOfSize: fontSize];
}

#pragma mark - Hand Views
+ (CGFloat)handViewCardsOffsetXForCardsCount:(NSUInteger)cardsCount
{
    if(cardsCount < 10) {
        return 15.0;
    }
    else if(cardsCount < 15) {
        return 10;
    }
    else {
        return 5;
    }
}

+ (CGFloat)handViewCardsDeltaAngleForCardsCount:(NSUInteger)cardsCount
{
    float angle = 0;
    if(cardsCount < 10) {
        angle = 9;
    }
    else if(cardsCount < 15) {
        angle = 6;
    }
    else {
        angle = 3;
    }
    return M_PI / 180.0 * angle;
}

+ (CGFloat)aiPlayerHandViewScale
{
    return 0.35;
}

+ (CGFloat)aiPlayerHandViewOffset
{
    return 30.0;
}

#pragma mark - Game 
+ (NSUInteger)numberOfCardsToDeal
{
    return 6;
}
@end
