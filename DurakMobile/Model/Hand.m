//
//  Hand.m
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import "Hand.h"

@implementation Hand
{
    NSMutableArray *    _cards;
}

#pragma mark - initialization
- (id)init
{
    self = [super init];
    if(self) {
        _cards = [NSMutableArray array];
    }
    return self;
}

#pragma mark - properties methods
- (NSUInteger)cardsCount
{
    return _cards.count;
}

#pragma mark - public working methods
- (void) removeAllCards
{
    [_cards removeAllObjects];
}

- (void)    addCard: (Card *) card
{
    [_cards addObject:card];
}

- (Card *) cardAtIndex: (NSUInteger) index;
{
    if(index < _cards.count) {
        return [_cards objectAtIndex:index];
    }
    else {
        return nil;
    }
}

- (void)sortBySuitAndValue
{
    NSSortDescriptor *suitDescriptor = [[NSSortDescriptor alloc]initWithKey:@"cardSuit" ascending:YES];
    NSSortDescriptor *valueDescriptor = [[NSSortDescriptor alloc]initWithKey:@"cardValue" ascending:YES];
    [_cards sortUsingDescriptors:@[suitDescriptor, valueDescriptor]];
}

#pragma mark - <HandViewDataSource>

- (NSUInteger) numberOfCardsInHandView:(HandView *)handView
{
    return self.cardsCount;
}

- (CardView *) handView: (HandView *) handView cardViewAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex: index];
    CardView *cardView = [[CardView alloc] initWithDataSource:card];
    return cardView;
}
@end
