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



/*- (void)    addCard: (AMCard *) card
 toSectionWithIndex: (NSUInteger) sectionIndex;

- (void) insertCard: (AMCard *) card
        atIndexPath: (NSIndexPath *) indexPath;

- (void) moveCardFromIndexPath: (NSIndexPath *) oldIndexPath
                   toIndexPath: (NSIndexPath *) newIndexPath;

- (NSArray *) cardsInSectionWithIndex: (NSUInteger) sectionIndex;

/// Returns the card at the given index path
- (AMCard *) cardAtIndexPath: (NSIndexPath *) indexPath;
- (AMCard *) cardAtIndex: (NSUInteger) index;

- (BOOL) removeCardAtIndexPath: (NSIndexPath *) indexPath;
- (BOOL) removeCardAtIndex: (NSUInteger) index;
- (BOOL) removeCard: (AMCard *) card;



- (NSIndexPath *) indexPathForCard: (AMCard *) card;
- (NSUInteger) indexOfCard: (AMCard *) card;


/// Sorting
- (void) sortCardsBySuit;
- (void) sortCardsByValue;*/
@end
