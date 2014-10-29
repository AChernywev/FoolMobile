//
//  Model.m
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import "Model.h"

@implementation Model

#pragma mark - initialization
- (id)init
{
    self = [super init];
    if(self) {
    }
    return self;
}

#pragma mark - public methods
- (void)beginNewGame
{
    _aiPlayer = [AIPlayer new];
    _humanPlayer = [HumanPlayer new];
    [self resetDeck];
    [self dealCards];
}

#pragma mark - private methods
- (void) resetDeck
{
    _deck     = [Deck standardDeck];
    [_deck shuffle];
}

- (void) dealCards
{
    [_aiPlayer.hand     removeAllCards];
    [_humanPlayer.hand  removeAllCards];
    
    NSUInteger numberOfCardsToDeal = [Constants numberOfCardsToDeal];
    
    for (NSUInteger cardIndex = 0; cardIndex < numberOfCardsToDeal; ++cardIndex)
    {
        [_aiPlayer.hand addCard:    [self.deck popTopCard]];
        [_humanPlayer.hand addCard: [self.deck popTopCard]];
    }
    
    [_humanPlayer.hand sortBySuitAndValue];
}

@end
