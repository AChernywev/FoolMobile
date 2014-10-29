//
//  Model.h
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HumanPlayer.h"
#import "AIPlayer.h"
#import "Deck.h"

@interface Model : NSObject
@property (nonatomic, readonly) AIPlayer *      aiPlayer;
@property (nonatomic, readonly) HumanPlayer *   humanPlayer;
@property (nonatomic, readonly) Deck *          deck;

- (void)beginNewGame;
@end
