//
//  HandView.h
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CardView.h"

@class HandView;

@protocol HandViewDataSource<NSObject>
@required

- (NSUInteger) numberOfCardsInHandView: (HandView *) handView;
- (CardView *) handView: (HandView *) handView cardViewAtIndex: (NSUInteger) index;
@end

@interface HandView : UIView
@property (weak, nonatomic) IBOutlet id<HandViewDataSource> dataSource;
@property (assign, nonatomic) CGFloat angle;
@property (assign, nonatomic) CGFloat scale;
@property (assign, nonatomic) CardViewState cardsState;

/** Clears the hand view and reloads all its views. This is done without animation.s
 */
- (CardView *) cardViewAtIndex: (NSUInteger) index;
- (void) reloadData;
@end
