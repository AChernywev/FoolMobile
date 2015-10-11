//
//  CardView.m
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import "CardView.h"

@interface CardView ()
@property (nonatomic, weak) UIImageView *       cardImageView;

@end

@implementation CardView

#pragma mark - initialization
- (id)initWithDataSource:(id<CardViewDataSource>)dataSource
{
    self = [super initWithFrame: [Constants defaultCardViewBounds]];
    if (self != nil)
    {
        _dataSource = dataSource;
        
        UIImageView *imageView = [UIImageView new];
        [self addSubview: imageView];
        _cardImageView = imageView;
        
        _cardImageView.image            = [self.dataSource imageForState:CardViewStateClosed];
        _cardImageView.highlightedImage = [self.dataSource imageForState:CardViewStateOpen];
        
        _state = CardViewStateOpen;
    }
    return self;
}

#pragma mark - properties
- (void)setState:(CardViewState)state
{
    _state = state;
    self.cardImageView.highlighted = (state == CardViewStateOpen);
}

#pragma mark - layout
- (void)layoutSubviews
{
    CGRect bounds = self.bounds;
    self.cardImageView.frame = bounds;
}

@end
