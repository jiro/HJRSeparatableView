//
//  HJRSeparatableView.m
//
//  Created by Jiro Nagashima on 12/31/13.
//  Copyright (c) 2013 Jiro Nagashima. All rights reserved.
//
//  https://github.com/hedjirog/HJRSeparatableView
//

#import "HJRSeparatableView.h"

#define HJRStandardSeparatorGrayColor [UIColor colorWithRed:200.f/255.f green:199.f/255.f blue:204.f/255.f alpha:1.f]

@interface HJRSeparatableView ()

@property (nonatomic, strong) UIView *separatorView;

@end

@implementation HJRSeparatableView

- (instancetype)initWithFrame:(CGRect)frame separateMode:(HJRSeparatableViewSeparateMode)separateMode
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];

        _separateMode = separateMode;
    }
    return self;
}

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
    _separateMode = HJRSeparatableViewSeparateModeTop;
    _separatorLineWidth = .5f;
}

#pragma mark - Getters

- (UIView *)separatorView
{
    if (!_separatorView) {
        _separatorView = [[UIView alloc] init];
        _separatorView.backgroundColor = HJRStandardSeparatorGrayColor;
        [self addSubview:_separatorView];
    }
    return _separatorView;
}

#pragma mark - Setters

- (void)setSeparateMode:(HJRSeparatableViewSeparateMode)separateMode
{
    _separateMode = separateMode;

    [self setNeedsLayout];
}

- (void)setSeparatorInset:(UIEdgeInsets)separatorInset
{
    _separatorInset = separatorInset;

    [self setNeedsLayout];
}

- (void)setSeparatorLineWidth:(CGFloat)separatorLineWidth
{
    _separatorLineWidth = separatorLineWidth;

    [self setNeedsLayout];
}

- (void)setSeparatorColor:(UIColor *)separatorColor
{
    _separatorColor = separatorColor;

    self.separatorView.backgroundColor = _separatorColor ?: HJRStandardSeparatorGrayColor;
    [self.separatorView setNeedsDisplay];
}

#pragma mark - Layout

- (void)layoutSubviews
{
    [super layoutSubviews];

    self.separatorView.frame = UIEdgeInsetsInsetRect([self separatorViewFrame], [self adjustedSeparatorInset]);
}

- (void)didAddSubview:(UIView *)subview
{
    [super didAddSubview:subview];

    [self sendSubviewToBack:self.separatorView];
}

#pragma mark - Private

- (CGRect)separatorViewFrame
{
    switch (self.separateMode) {
        case HJRSeparatableViewSeparateModeTop:
            return (CGRect) {
                .origin.x = 0,
                .origin.y = 0,
                .size.width = CGRectGetWidth(self.bounds),
                .size.height = self.separatorLineWidth,
            };

        case HJRSeparatableViewSeparateModeBottom:
            return (CGRect) {
                .origin.x = 0,
                .origin.y = CGRectGetMaxY(self.bounds) - self.separatorLineWidth,
                .size.width = CGRectGetWidth(self.bounds),
                .size.height = self.separatorLineWidth,
            };

        case HJRSeparatableViewSeparateModeLeft:
            return (CGRect) {
                .origin.x = 0,
                .origin.y = 0,
                .size.width = self.separatorLineWidth,
                .size.height = CGRectGetHeight(self.bounds),
            };

        case HJRSeparatableViewSeparateModeRight:
            return (CGRect) {
                .origin.x = CGRectGetMaxX(self.bounds) - self.separatorLineWidth,
                .origin.y = 0,
                .size.width = self.separatorLineWidth,
                .size.height = CGRectGetHeight(self.bounds),
            };
    }
}

- (UIEdgeInsets)adjustedSeparatorInset
{
    switch (self.separateMode) {
        case HJRSeparatableViewSeparateModeTop:
        case HJRSeparatableViewSeparateModeBottom:
            return (UIEdgeInsets) {
                .top = 0,
                .left = self.separatorInset.left,
                .bottom = 0,
                .right = self.separatorInset.right,
            };

        case HJRSeparatableViewSeparateModeLeft:
        case HJRSeparatableViewSeparateModeRight:
            return (UIEdgeInsets) {
                .top = self.separatorInset.top,
                .left = 0,
                .bottom = self.separatorInset.bottom,
                .right = 0,
            };
    }
}

@end
