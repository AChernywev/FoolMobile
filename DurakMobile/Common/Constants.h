//
//  Contstants.h
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constants : NSObject

#pragma mark - Card Views
/// Returns width appropriate for card views to be dragged on screen
+ (CGFloat) defaultCardViewWidth;

/// Returns height appropriate for card views to be dragged on screen
+ (CGFloat) defaultCardViewHeight;

/// Convenience method. Constructs a CGSize with the default card width and height
+ (CGSize) defaultCardViewSize;

/// Convenience method. Constructs a CGRect with (0,0) origin and default card view size
+ (CGRect) defaultCardViewBounds;

#pragma mark - Deck views
+ (UIFont *) deckViewCardCountFont;

#pragma mark - Hand Views
+ (CGFloat) handViewCardsOffsetXForCardsCount:(NSUInteger)cardsCount;
+ (CGFloat) handViewCardsDeltaAngleForCardsCount:(NSUInteger)cardsCount;

#pragma mark - Game
+ (NSUInteger) numberOfCardsToDeal;
@end
