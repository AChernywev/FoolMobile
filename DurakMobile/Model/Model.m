//
//  Model.m
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import "Model.h"

@interface Model ()
@property (nonatomic, readwrite) AIPlayer *      aiPlayer;
@property (nonatomic, readwrite) HumanPlayer *   humanPlayer;
@property (nonatomic, readwrite) Deck *          deck;

@end

@implementation Model

#pragma mark - public methods
- (void)beginNewGame
{
    self.aiPlayer = [AIPlayer new];
    self.humanPlayer = [HumanPlayer new];
    [self resetDeck];
    [self dealCards];
}

#pragma mark - private methods
- (void) resetDeck
{
    self.deck = [Deck standardDeck];
    [self.deck shuffle];
}

- (void) dealCards
{
    [self.aiPlayer.hand removeAllCards];
    [self.humanPlayer.hand removeAllCards];
    
    NSUInteger numberOfCardsToDeal = [Constants numberOfCardsToDeal];
    
    for (NSUInteger cardIndex = 0; cardIndex < numberOfCardsToDeal; ++cardIndex) {
        [self.aiPlayer.hand addCard: [self.deck popTopCard]];
        [self.humanPlayer.hand addCard: [self.deck popTopCard]];
    }
    
    [self.humanPlayer.hand sortBySuitAndValue];
}

@end
