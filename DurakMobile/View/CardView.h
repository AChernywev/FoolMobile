//
//  CardView.h
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    CardViewStateOpen,
    CardViewStateClosed
}
CardViewState;


@protocol CardViewDataSource <NSObject>

@required
- (UIImage *)imageForState:(CardViewState)state;
@end

@protocol CardViewDelegate <NSObject>

@required

@end

@interface CardView : UIView
{
    UIImageView *   _cardImageView;
}
@property (nonatomic, weak) IBOutlet id<CardViewDataSource>  dataSource;
@property (nonatomic, weak) IBOutlet id<CardViewDelegate>    delegate;
@property (nonatomic, assign)        CardViewState           state;

- (id)initWithDataSource:(id<CardViewDataSource>)dataSource;
@end
