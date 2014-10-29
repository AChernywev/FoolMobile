//
//  GameViewController.h
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import "BaseViewController.h"

#import "DeckView.h"
#import "HandView.h"

@interface GameViewController : BaseViewController
{
    __weak IBOutlet DeckView *  _deckView;
    __weak IBOutlet HandView *  _humanHand;
    __weak IBOutlet HandView *  _aiHandView;
}
@end
