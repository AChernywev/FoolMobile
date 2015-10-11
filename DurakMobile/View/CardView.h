//
//  CardView.h
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CardViewState)
{
    CardViewStateOpen,
    CardViewStateClosed
};

@protocol CardViewDataSource <NSObject>

- (UIImage *)imageForState:(CardViewState)state;
@end

@interface CardView : UIView
@property (nonatomic, weak) IBOutlet id<CardViewDataSource> dataSource;
@property (nonatomic, assign) CardViewState                 state;

- (id)initWithDataSource:(id<CardViewDataSource>)dataSource;
@end
