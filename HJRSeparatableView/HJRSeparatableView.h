//
//  HJRSeparatableView.h
//
//  Created by Jiro Nagashima on 12/31/13.
//  Copyright (c) 2013 Jiro Nagashima. All rights reserved.
//
//  https://github.com/hedjirog/HJRSeparatableView
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HJRSeparatableViewSeparateMode) {
    HJRSeparatableViewSeparateModeTop,
    HJRSeparatableViewSeparateModeBottom,
    HJRSeparatableViewSeparateModeLeft,
    HJRSeparatableViewSeparateModeRight
};

@interface HJRSeparatableView : UIView

- (instancetype)initWithFrame:(CGRect)frame separateMode:(HJRSeparatableViewSeparateMode)separateMode;

@property (nonatomic) HJRSeparatableViewSeparateMode separateMode;    // default is HJRSeparableViewSeparateModeTop
@property (nonatomic) UIEdgeInsets separatorInset;  // allows customization of the frame of separators
@property (nonatomic) CGFloat separatorLineWidth;   // default = 0.5
@property (nonatomic, strong) UIColor *separatorColor;  // default is the standard separator gray

@end
