//
//  GameView.h
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/19/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GameViewDataSource <NSObject>


@end

@interface GameView : UIView
@property (nonatomic, weak) id<GameViewDataSource>dataSource;

@end
