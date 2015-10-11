//
//  DeckView.m
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import "DeckView.h"

@implementation DeckView
{
    NSMutableArray *    _cardViews;
    CAShapeLayer   *    _cardFrameLayer;
    
    UILabel *           _countLabel;
}

#pragma mark initialization methods

- (id) initWithCoder: (NSCoder *) aDecoder
{
    self = [super initWithCoder: aDecoder];
    
    if (self != nil)
    {
        self.backgroundColor = [UIColor clearColor];
        _cardViews  = [NSMutableArray new];
        _cardsState = CardViewStateClosed;
        
        _cardFrameLayer                 = [CAShapeLayer new];
        _cardFrameLayer.strokeColor     = [UIColor whiteColor].CGColor;
        _cardFrameLayer.lineWidth       = 1.0;
        _cardFrameLayer.lineDashPattern = @[@4, @4];
        _cardFrameLayer.fillColor       = [UIColor clearColor].CGColor;
        [self.layer addSublayer: _cardFrameLayer];
        
        _countLabel                     = [UILabel new];
        _countLabel.backgroundColor     = [UIColor clearColor];
        _countLabel.textColor           = [UIColor blackColor];
        _countLabel.font                = [Constants deckViewCardCountFont];
        _countLabel.textAlignment       = NSTextAlignmentRight;
        _countLabel.layer.shadowColor   = [UIColor whiteColor].CGColor;
        _countLabel.layer.shadowOffset  = CGSizeZero;
        _countLabel.layer.shadowRadius  = 1.5;
        _countLabel.layer.shadowOpacity = 1.0;
        [self addSubview: _countLabel];
    }
    return self;
}

#pragma mark - properties
- (void) setCardsState: (CardViewState) cardsState
{
    _cardsState = cardsState;
    
    for (CardView *cardView in _cardViews) {
        cardView.state = cardsState;
    }
}

- (void) setShowCount: (BOOL) showCount
{
    _showCount = showCount;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void) setOpenBottomCard: (BOOL) openBottomCard
{
    _openBottomCard = openBottomCard;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

#pragma mark - public methods
- (void) reloadData
{
    [self removeAllCardViews];
    
    NSUInteger count = [self.dataSource numberOfCardsInDeckView: self];
    
    for (NSUInteger i = 0; i < count; ++i)
    {
        CardView *cardView              = [self.dataSource deckView: self cardViewAtIndex: i];
        cardView.state                  = _cardsState;
        cardView.userInteractionEnabled = NO;
        
        [self addSubview: cardView];
        [_cardViews addObject: cardView];
    }
    
    _countLabel.text = [NSString stringWithFormat: @"%@", @(count).stringValue];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

#pragma mark - private
- (void) removeAllCardViews
{
    [_cardViews makeObjectsPerformSelector: @selector(removeFromSuperview)];
    [_cardViews removeAllObjects];
}

#pragma mark - layout
- (void) layoutSubviews
{
    [_cardViews enumerateObjectsUsingBlock:^(CardView *cardView, NSUInteger index, BOOL *stop) {
        [self bringSubviewToFront: cardView];
        
        cardView.frame     = self.bounds;
        cardView.hidden    = YES;
        cardView.state     = _cardsState;
        
        if (_openBottomCard && (index == 0) && (_cardViews.count > 1))
        {
            cardView.hidden    = NO;
            cardView.state     = CardViewStateOpen;
            cardView.transform = CGAffineTransformRotate(cardView.transform, -M_PI / 180.0 * 5.0);
            
            cardView.center = CGPointMake(cardView.center.x - CGRectGetWidth(cardView.bounds) / 6.0, cardView.center.y - 3);
        }
    }];
    
    [_cardViews.lastObject setHidden: NO];
    
    [CATransaction begin];
    [CATransaction setDisableActions: YES];
    _cardFrameLayer.path   = [UIBezierPath bezierPathWithRect: self.bounds].CGPath;
    _cardFrameLayer.hidden = (_cardViews.count > 0);
    [CATransaction commit];
    
    [_countLabel sizeToFit];
    _countLabel.center = CGPointMake(CGRectGetMaxX(self.bounds) - CGRectGetWidth(_countLabel.bounds)/2.0  - 5.0,
                                     CGRectGetMaxY(self.bounds) - CGRectGetHeight(_countLabel.bounds)/2.0 - 3.0);
    _countLabel.hidden = (_cardViews.count == 0) || !_showCount;
    [self bringSubviewToFront: _countLabel];
}


@end
