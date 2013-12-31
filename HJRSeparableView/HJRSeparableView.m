//
//  HJRSeparableView.m
//
//  Created by Jiro Nagashima on 12/31/13.
//  Copyright (c) 2013 Jiro Nagashima. All rights reserved.
//
//  https://github.com/hedjirog/HJRSeparableView
//

#import "HJRSeparableView.h"

@interface HJRSeparableView ()

@end

@implementation HJRSeparableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{

}

@end
