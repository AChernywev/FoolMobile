//
//  DeckView.h
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardView.h"

@class DeckView;

@protocol DeckViewDataSource <NSObject>

- (NSUInteger)numberOfCardsInDeckView:(DeckView *)deckView;
- (CardView *)deckView:(DeckView *)deckView cardViewAtIndex:(NSUInteger)index;
@end

@protocol DeckViewDelegate <NSObject>

- (void)deckViewDidSelectTopCard:(DeckView *)deckView;
@end

@interface DeckView : UIView
@property (weak, nonatomic) IBOutlet id<DeckViewDataSource> dataSource;
@property (weak, nonatomic) IBOutlet id<DeckViewDelegate>   delegate;

@property (assign, nonatomic) CardViewState cardsState;
@property (assign, nonatomic) BOOL          showCount;
@property (assign, nonatomic) BOOL          openBottomCard;

- (void)reloadData;
@end
