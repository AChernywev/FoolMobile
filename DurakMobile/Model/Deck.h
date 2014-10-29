//
//  Deck.h
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Card.h"
#import "DeckView.h"

@interface Deck : NSObject <DeckViewDataSource>

/// Number of cards in the deck
@property (readonly, nonatomic) NSUInteger count;

/// A card which is currently on top of the deck
@property (readonly, nonatomic) Card *bottomCard;

/// Pops (removes) the top card from the deck
- (Card *) popTopCard;

/// Adds a new card to the top of the deck
- (void) pushCard: (Card *) card;

/// Copies all cards from the other deck to the top of the current deck
- (void) pushDeck: (Deck *) other;

/// Shuffle all cards in deck
- (void) shuffle;

/// Creates a new empty Deck object
+ (instancetype) emptyDeck;

/// Creates a new standard Deck with 54 cards.
+ (instancetype) standardDeck;
@end
