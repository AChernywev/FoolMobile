//
//  Geometry+UIView.m
//  DurakMobile
//
//  Created by Alexandr Chernyshev on 10/18/13.
//  Copyright (c) 2013 AlexChernywev. All rights reserved.
//

#import "UIView+Geometry.h"

@implementation UIView (Geometry)

- (CGPoint) boundsCenter
{
    CGRect  bounds = self.bounds;
    CGPoint center = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
    return [self convertPoint: center toView: self.superview];
}


- (void) setBoundsCenter: (CGPoint) boundsCenter
{
    CGRect  bounds  = self.bounds;
    CGPoint anchor  = self.layer.anchorPoint;
    boundsCenter.x += (anchor.x - 0.5) * CGRectGetWidth(bounds);
    boundsCenter.y += (anchor.y - 0.5) * CGRectGetHeight(bounds);
    
    self.center = boundsCenter;
}
@end
