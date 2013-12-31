//
//  SettingsViewController.m
//  HJRSeparableView
//
//  Created by Jiro Nagashima on 12/31/13.
//  Copyright (c) 2013 Jiro Nagashima. All rights reserved.
//

#import "SettingsViewController.h"
#import "HJRSeparableView.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *separateModeSegmentedControl;
@property (weak, nonatomic) IBOutlet UIStepper *lineWidthStepper;
@property (weak, nonatomic) IBOutlet UIStepper *topInsetStepper;
@property (weak, nonatomic) IBOutlet UIStepper *bottomInsetStepper;
@property (weak, nonatomic) IBOutlet UIStepper *leftInsetStepper;
@property (weak, nonatomic) IBOutlet UIStepper *rightInsetStepper;
@property (weak, nonatomic) IBOutlet UILabel *lineWidthLabel;
@property (weak, nonatomic) IBOutlet UILabel *topInsetLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomInsetLabel;
@property (weak, nonatomic) IBOutlet UILabel *leftInsetLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightInsetLabel;

- (IBAction)changeSeparateMode:(UISegmentedControl *)segmentedControl;
- (IBAction)changeLineWidth:(UIStepper *)stepper;
- (IBAction)changeTopInset:(UIStepper *)stepper;
- (IBAction)changeBottomInset:(UIStepper *)stepper;
- (IBAction)changeLeftInset:(UIStepper *)stepper;
- (IBAction)changeRightInset:(UIStepper *)stepper;

@end

@implementation SettingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (self.separableView.separateMode == HJRSeparableViewSeparateModeTop) {
        self.separateModeSegmentedControl.selectedSegmentIndex = 0;
    }
    else if (self.separableView.separateMode == HJRSeparableViewSeparateModeBottom) {
        self.separateModeSegmentedControl.selectedSegmentIndex = 1;
    }
    else if (self.separableView.separateMode == HJRSeparableViewSeparateModeLeft) {
        self.separateModeSegmentedControl.selectedSegmentIndex = 2;
    }
    else if (self.separableView.separateMode == HJRSeparableViewSeparateModeRight) {
        self.separateModeSegmentedControl.selectedSegmentIndex = 3;
    }

    self.lineWidthStepper.maximumValue = CGRectGetHeight(self.separableView.bounds);
    self.topInsetStepper.maximumValue = CGRectGetHeight(self.separableView.bounds);
    self.bottomInsetStepper.maximumValue = CGRectGetHeight(self.separableView.bounds);
    self.leftInsetStepper.maximumValue = CGRectGetWidth(self.separableView.bounds);
    self.rightInsetStepper.maximumValue = CGRectGetWidth(self.separableView.bounds);

    self.lineWidthStepper.value = self.separableView.separatorLineWidth;
    self.topInsetStepper.value = self.separableView.separatorInset.top;
    self.bottomInsetStepper.value = self.separableView.separatorInset.bottom;
    self.leftInsetStepper.value = self.separableView.separatorInset.left;
    self.rightInsetStepper.value = self.separableView.separatorInset.right;

    self.lineWidthLabel.text = [@(self.separableView.separatorLineWidth) stringValue];
    self.topInsetLabel.text = [@(self.separableView.separatorInset.top) stringValue];
    self.bottomInsetLabel.text = [@(self.separableView.separatorInset.bottom) stringValue];
    self.leftInsetLabel.text = [@(self.separableView.separatorInset.left) stringValue];
    self.rightInsetLabel.text = [@(self.separableView.separatorInset.right) stringValue];
}

#pragma mark - Actions

- (IBAction)changeSeparateMode:(UISegmentedControl *)segmentedControl
{
    if (segmentedControl.selectedSegmentIndex == 0) {
        self.separableView.separateMode = HJRSeparableViewSeparateModeTop;
    }
    if (segmentedControl.selectedSegmentIndex == 1) {
        self.separableView.separateMode = HJRSeparableViewSeparateModeBottom;
    }
    if (segmentedControl.selectedSegmentIndex == 2) {
        self.separableView.separateMode = HJRSeparableViewSeparateModeLeft;
    }
    if (segmentedControl.selectedSegmentIndex == 3) {
        self.separableView.separateMode = HJRSeparableViewSeparateModeRight;
    }
}

- (IBAction)changeLineWidth:(UIStepper *)stepper
{
    self.separableView.separatorLineWidth = stepper.value;

    self.lineWidthLabel.text = [@(stepper.value) stringValue];
}

- (IBAction)changeTopInset:(UIStepper *)stepper
{
    UIEdgeInsets separatorInset = self.separableView.separatorInset;
    separatorInset.top = stepper.value;
    self.separableView.separatorInset = separatorInset;

    self.topInsetLabel.text = [@(stepper.value) stringValue];
}

- (IBAction)changeBottomInset:(UIStepper *)stepper
{
    UIEdgeInsets separatorInset = self.separableView.separatorInset;
    separatorInset.bottom = stepper.value;
    self.separableView.separatorInset = separatorInset;

    self.bottomInsetLabel.text = [@(stepper.value) stringValue];
}

- (IBAction)changeLeftInset:(UIStepper *)stepper
{
    UIEdgeInsets separatorInset = self.separableView.separatorInset;
    separatorInset.left = stepper.value;
    self.separableView.separatorInset = separatorInset;

    self.leftInsetLabel.text = [@(stepper.value) stringValue];
}

- (IBAction)changeRightInset:(UIStepper *)stepper
{
    UIEdgeInsets separatorInset = self.separableView.separatorInset;
    separatorInset.right = stepper.value;
    self.separableView.separatorInset = separatorInset;

    self.rightInsetLabel.text = [@(stepper.value) stringValue];
}

@end
