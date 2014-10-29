//
//  Deck.m
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import "Deck.h"

@implementation Deck
{
    NSMutableArray *    _cards;
}

#pragma mark -
#pragma mark properties

- (NSUInteger) count
{
    return _cards.count;
}

#pragma mark - class methods

+ (instancetype) emptyDeck
{
    return [self new];
}

+ (instancetype) standardDeck
{
    Deck *deck = [self new];
    
    for (NSUInteger i = kMinCardValue; i <= kMaxCardValue; i++)
    {
        NSUInteger value = i;
        
        Card *clubCard =    [Card cardWithValue: value suit: kCardSuitClubs];
        Card *diamondCard = [Card cardWithValue: value suit: kCardSuitDiamonds];
        Card *heartCard =   [Card cardWithValue: value suit: kCardSuitHearts];
        Card *spadeCard =   [Card cardWithValue: value suit: kCardSuitSpades];
        
        [deck pushCard:    clubCard];
        [deck pushCard: diamondCard];
        [deck pushCard:   spadeCard];
        [deck pushCard:   heartCard];
    }
    return deck;
}

#pragma mark - initialization
- (id) init
{
    self = [super init];
    
    if (self != nil)
    {
        _cards = [NSMutableArray new];
    }
    return self;
}

#pragma mark -
#pragma mark methods
- (Card *) bottomCard
{
    if (_cards.count > 0) return [_cards lastObject];
    else return nil;
}

- (Card *) popTopCard
{
    NSAssert(_cards.count > 0, @"");
    if (_cards.count > 0)
    {
        Card *card = [_cards objectAtIndex:0];
        [_cards removeObjectAtIndex:0];
        
        return card;
    }
    else return nil;
}

- (void) pushCard: (Card *) card
{
    [_cards insertObject:card atIndex:0];
}

- (void) pushDeck: (Deck *) other
{
    [_cards addObjectsFromArray: other->_cards];
}

- (void) shuffle
{
    NSUInteger count = _cards.count;
    
    for (NSUInteger i = 0; i < count * 1000; i++)
    {
        NSUInteger index = arc4random_uniform(count - 1);
        Card *card = _cards[index];
        
        [_cards removeObjectAtIndex: index];
        [_cards addObject: card];
    }
}

#pragma mark -
#pragma mark <DeckViewDataSource>

- (NSUInteger) numberOfCardsInDeckView: (DeckView *) deckView
{
    return self.count;
}


- (CardView *) deckView: (DeckView *) deckView cardViewAtIndex: (NSUInteger) index
{
    Card *card = _cards[index];
    CardView *cardView = [[CardView alloc] initWithDataSource: card];
    return cardView;
}
@end
