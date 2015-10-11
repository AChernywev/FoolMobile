//
//  Deck.m
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import "Deck.h"

@interface Deck ()
@property (nonatomic, strong) NSMutableArray *cards;

@end

@implementation Deck

#pragma mark - properties
- (NSUInteger)count
{
    return self.cards.count;
}

#pragma mark - class methods
+ (instancetype)emptyDeck
{
    return [self new];
}

+ (instancetype)standardDeck
{
    Deck *deck = [self new];
    
    for (NSUInteger i = kMinCardValue; i <= kMaxCardValue; i++) {
        NSUInteger value = i;
        
        Card *clubCard = [Card cardWithValue: value suit: kCardSuitClubs];
        Card *diamondCard = [Card cardWithValue: value suit: kCardSuitDiamonds];
        Card *heartCard = [Card cardWithValue: value suit: kCardSuitHearts];
        Card *spadeCard = [Card cardWithValue: value suit: kCardSuitSpades];
        
        [deck pushCard: clubCard];
        [deck pushCard: diamondCard];
        [deck pushCard: spadeCard];
        [deck pushCard: heartCard];
    }
    return deck;
}

#pragma mark - initialization
- (id)init
{
    self = [super init];
    
    if (self != nil) {
        _cards = [NSMutableArray new];
    }
    return self;
}

#pragma mark - methods
- (Card *)bottomCard
{
    if (self.cards.count > 0) return [self.cards lastObject];
    else return nil;
}

- (Card *)popTopCard
{
    NSAssert(self.cards.count > 0, @"");
    if (self.cards.count > 0)
    {
        Card *card = [self.cards objectAtIndex:0];
        [self.cards removeObjectAtIndex:0];
        
        return card;
    }
    else return nil;
}

- (void)pushCard:(Card *)card
{
    [self.cards insertObject:card atIndex:0];
}

- (void)pushDeck:(Deck *)other
{
    [self.cards addObjectsFromArray: other.cards];
}

- (void)shuffle
{
    NSUInteger count = self.cards.count;
    for (NSUInteger i = 0; i < count * 1000; i++) {
        unsigned int numOfVariants = (unsigned int)(count - 1);
        NSUInteger index = arc4random_uniform(numOfVariants);
        Card *card = self.cards[index];
        
        [self.cards removeObjectAtIndex: index];
        [self.cards addObject: card];
    }
}

#pragma mark - <DeckViewDataSource>
- (NSUInteger)numberOfCardsInDeckView:(DeckView *)deckView
{
    return self.count;
}

- (CardView *)deckView:(DeckView *)deckView cardViewAtIndex:(NSUInteger)index
{
    Card *card = self.cards[index];
    CardView *cardView = [[CardView alloc] initWithDataSource: card];
    return cardView;
}
@end
