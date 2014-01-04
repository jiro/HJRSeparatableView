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

@property (nonatomic, assign) HJRSeparatableViewSeparateMode separateMode UI_APPEARANCE_SELECTOR; // default is HJRSeparableViewSeparateModeTop
@property (nonatomic, assign) UIEdgeInsets separatorInset UI_APPEARANCE_SELECTOR; // allows customization of the frame of separators
@property (nonatomic, assign) CGFloat separatorLineWidth UI_APPEARANCE_SELECTOR; // default = 0.5
@property (nonatomic, strong) UIColor *separatorColor UI_APPEARANCE_SELECTOR; // default is the standard separator gray

@end
