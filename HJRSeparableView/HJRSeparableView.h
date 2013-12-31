//
//  HJRSeparableView.h
//
//  Created by Jiro Nagashima on 12/31/13.
//  Copyright (c) 2013 Jiro Nagashima. All rights reserved.
//
//  https://github.com/hedjirog/HJRSeparableView
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HJRSeparableViewSeparateMode) {
    HJRSeparableViewSeparateModeTop,
    HJRSeparableViewSeparateModeBottom,
    HJRSeparableViewSeparateModeLeft,
    HJRSeparableViewSeparateModeRight
};

@interface HJRSeparableView : UIView

- (instancetype)initWithFrame:(CGRect)frame separateMode:(HJRSeparableViewSeparateMode)separateMode;

@property (nonatomic) HJRSeparableViewSeparateMode separateMode;    // default is HJRSeparableViewSeparateModeTop
@property (nonatomic) UIEdgeInsets separatorInset;  // allows customization of the frame of separators
@property (nonatomic) CGFloat separatorLineWidth;   // default = 0.5
@property (nonatomic, strong) UIColor *separatorColor;  // default is the standard separator gray

@end
