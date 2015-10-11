//
//  Hand.h
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "HandView.h"

@interface Hand : NSObject <HandViewDataSource>
@property (readonly, nonatomic) NSUInteger cardsCount;

/// Removes all cards from the hand
- (void)   removeAllCards;
- (void)   addCard: (Card *) card;
- (Card *) cardAtIndex: (NSUInteger) index;
- (void)sortBySuitAndValue;
@end
