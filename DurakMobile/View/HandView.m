//
//  HandView.m
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import "HandView.h"

@interface HandView()
@property (nonatomic, assign) CGFloat angle;
@property (nonatomic, assign) CGFloat scale;

@property (nonatomic, strong) NSMutableArray *  cardViews;
@property (nonatomic, strong) NSIndexPath *     emptyIndexPath;
@property (nonatomic, strong) NSMutableSet *    selectedCardViews;

@end

@implementation HandView

#pragma mark - initialization methods
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self != nil)  {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.cardViews = [NSMutableArray array];
    self.selectedCardViews = [NSMutableSet set];
    self.scale = 1.0;
    self.angle = 0.0;
}

#pragma mark - properties
- (void)setAngle:(CGFloat)angle
{
    _angle = angle;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setCardsState:(CardViewState)cardsState
{
    _cardsState = cardsState;
    
    for (CardView *cardView in self.cardViews) {
        cardView.state = cardsState;
    }
}

#pragma mark - public methods
- (CardView *)cardViewAtIndex:(NSUInteger)index
{
    if(index < self.cardViews.count) {
        return self.cardViews[index];
    }
    else {
        return nil;
    }
}

- (void)reloadData
{
    [self removeAllCardViews];
    
    // No need to do anything if data source is not set
    if (self.dataSource == nil) return;
    
    NSUInteger count = [self.dataSource numberOfCardsInHandView:self];
    
    for (NSUInteger i = 0; i < count; ++i) {
        CardView *cardView = [self.dataSource handView:self cardViewAtIndex:i];
        [cardView layoutIfNeeded];
        
        // Data source must return a non-nil card view.
        NSParameterAssert(cardView);
        
        cardView.layer.anchorPoint = CGPointMake(0.5, 1.5);
        cardView.state             = self.cardsState;
        
        [self.cardViews addObject:cardView];
        [self addSubview: cardView];
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

#pragma mark - private methods
- (void)removeAllCardViews
{
    [self.cardViews makeObjectsPerformSelector: @selector(removeFromSuperview)];
    [self.cardViews removeAllObjects];
}

#pragma mark - a
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    // Hand view itself is used only as a container for card views so it should
    // not handle any touches other than touches affecting the card views.
    //
    // Note that we don't check that the point is within hand view's bounds.
    // This is deliberate since we expect to drag cards outside of the hand view.
    
    for (UIView *cardView in self.cardViews) {
        CGPoint localPoint = [self convertPoint: point toView: cardView];
        if ([cardView pointInside: localPoint withEvent: event]) return YES;
    }
    return NO;
}

#pragma mark - layout
- (void)layoutSubviews
{
    CGRect bounds = self.bounds;
    NSInteger  cardViewIndex = 0;
    
    CGFloat offsetY = 0;
    CGPoint anchorPoint = CGPointMake(0.5, 1.5);
    CGPoint origin = CGPointMake(CGRectGetMidX(bounds), CGRectGetMaxY(bounds));
    
    NSUInteger count = [self.dataSource numberOfCardsInHandView:self];
    CGFloat deltaAngle = [Constants handViewCardsDeltaAngleForCardsCount:count];
    CGFloat offsetX = [Constants handViewCardsOffsetXForCardsCount:count];
    
    for (NSUInteger i = 0; i < count; ++i)
    {
        CardView *cardView = [self cardViewAtIndex: i];
        
        if (![self.selectedCardViews containsObject:cardView]) {
            float num = i - (count-1) / 2.0;
            
            cardView.layer.anchorPoint = anchorPoint;
            cardView.center =
            CGPointMake(origin.x + (num * offsetX * cos(self.angle) + offsetY * sin(self.angle)) * self.scale,
                        origin.y + (num * offsetX * sin(self.angle) + offsetY * cos(self.angle)) * self.scale);
            
            CGAffineTransform transform = CGAffineTransformIdentity;
            
            transform = CGAffineTransformScale(transform, self.scale, self.scale);
            transform = CGAffineTransformRotate(transform, num * deltaAngle + self.angle);
            
            cardView.transform = transform;
        }
        
        if ((int)(self.angle/M_PI_2) % 2 == 0)
            [self bringSubviewToFront: cardView];
        else
            [self sendSubviewToBack: cardView];
        
        cardViewIndex++;
    }
    
    for (CardView *cv in self.selectedCardViews){
        [self bringSubviewToFront: cv];
    }
}

@end
