//
//  GameViewController.m
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import "GameViewController.h"

#import "Model.h"
#import "DeckView.h"
#import "HandView.h"

@interface GameViewController()
@property (nonatomic, strong) Model *model;
@property (nonatomic, weak) IBOutlet DeckView * deckView;
@property (nonatomic, weak) IBOutlet HandView * humanHand;
@property (nonatomic, weak) IBOutlet HandView * aiHandView;

@end

@implementation GameViewController

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
    [self.model beginNewGame];
    
    self.deckView.dataSource = self.model.deck;
    [self.deckView reloadData];
    
    self.humanHand.dataSource = self.model.humanPlayer.hand;
    self.humanHand.cardsState = CardViewStateOpen;
    [self.humanHand reloadData];
    
    self.aiHandView.transform = CGAffineTransformMakeRotation(M_PI);
    self.aiHandView.dataSource = self.model.aiPlayer.hand;
    self.aiHandView.cardsState = CardViewStateClosed;
    [self.aiHandView reloadData];
}
@end
