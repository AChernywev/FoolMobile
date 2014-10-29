//
//  CardView.m
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import "CardView.h"

@implementation CardView

#pragma mark - initialization
- (id)initWithDataSource:(id<CardViewDataSource>)dataSource
{
    self = [super initWithFrame: [Constants defaultCardViewBounds]];
    if (self != nil)
    {
        self.dataSource = dataSource;
        
        _cardImageView = [UIImageView new];
        [self addSubview: _cardImageView];
        
        _cardImageView.image            = [self.dataSource imageForState:CardViewStateClosed];
        _cardImageView.highlightedImage = [self.dataSource imageForState:CardViewStateOpen];
        
        self.state = CardViewStateOpen;
    }
    return self;
}

#pragma mark - properties
- (void) setState: (CardViewState) state
{
    _state                     = state;
    _cardImageView.highlighted = (state == CardViewStateOpen);
}

#pragma mark - layout
- (void) layoutSubviews
{
    CGRect bounds        = self.bounds;
    _cardImageView.frame = bounds;
}

@end
