//
//  GameViewController.m
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import "GameViewController.h"

#import "Model.h"

@implementation GameViewController
{
    Model * _model;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        _model = [Model new];
    }
    return self;
}

#pragma mark - lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [_model beginNewGame];
    
    _deckView.dataSource = _model.deck;
    [_deckView reloadData];
    
    _humanHand.dataSource = _model.humanPlayer.hand;
    _humanHand.cardsState = CardViewStateOpen;
    [_humanHand reloadData];
    
    _aiHandView.transform = CGAffineTransformMakeRotation(M_PI);
    _aiHandView.dataSource = _model.aiPlayer.hand;
    _aiHandView.cardsState = CardViewStateClosed;
    [_aiHandView reloadData];
}
@end
