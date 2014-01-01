//
//  SettingsViewController.m
//  HJRSeparatableView
//
//  Created by Jiro Nagashima on 12/31/13.
//  Copyright (c) 2013 Jiro Nagashima. All rights reserved.
//

#import "SettingsViewController.h"
#import "HJRSeparatableView.h"

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

    if (self.separatableView.separateMode == HJRSeparatableViewSeparateModeTop) {
        self.separateModeSegmentedControl.selectedSegmentIndex = 0;
    }
    else if (self.separatableView.separateMode == HJRSeparatableViewSeparateModeBottom) {
        self.separateModeSegmentedControl.selectedSegmentIndex = 1;
    }
    else if (self.separatableView.separateMode == HJRSeparatableViewSeparateModeLeft) {
        self.separateModeSegmentedControl.selectedSegmentIndex = 2;
    }
    else if (self.separatableView.separateMode == HJRSeparatableViewSeparateModeRight) {
        self.separateModeSegmentedControl.selectedSegmentIndex = 3;
    }

    self.lineWidthStepper.maximumValue = CGRectGetHeight(self.separatableView.bounds);
    self.topInsetStepper.maximumValue = CGRectGetHeight(self.separatableView.bounds);
    self.bottomInsetStepper.maximumValue = CGRectGetHeight(self.separatableView.bounds);
    self.leftInsetStepper.maximumValue = CGRectGetWidth(self.separatableView.bounds);
    self.rightInsetStepper.maximumValue = CGRectGetWidth(self.separatableView.bounds);

    self.lineWidthStepper.value = self.separatableView.separatorLineWidth;
    self.topInsetStepper.value = self.separatableView.separatorInset.top;
    self.bottomInsetStepper.value = self.separatableView.separatorInset.bottom;
    self.leftInsetStepper.value = self.separatableView.separatorInset.left;
    self.rightInsetStepper.value = self.separatableView.separatorInset.right;

    self.lineWidthLabel.text = [@(self.separatableView.separatorLineWidth) stringValue];
    self.topInsetLabel.text = [@(self.separatableView.separatorInset.top) stringValue];
    self.bottomInsetLabel.text = [@(self.separatableView.separatorInset.bottom) stringValue];
    self.leftInsetLabel.text = [@(self.separatableView.separatorInset.left) stringValue];
    self.rightInsetLabel.text = [@(self.separatableView.separatorInset.right) stringValue];
}

#pragma mark - Actions

- (IBAction)changeSeparateMode:(UISegmentedControl *)segmentedControl
{
    if (segmentedControl.selectedSegmentIndex == 0) {
        self.separatableView.separateMode = HJRSeparatableViewSeparateModeTop;
    }
    if (segmentedControl.selectedSegmentIndex == 1) {
        self.separatableView.separateMode = HJRSeparatableViewSeparateModeBottom;
    }
    if (segmentedControl.selectedSegmentIndex == 2) {
        self.separatableView.separateMode = HJRSeparatableViewSeparateModeLeft;
    }
    if (segmentedControl.selectedSegmentIndex == 3) {
        self.separatableView.separateMode = HJRSeparatableViewSeparateModeRight;
    }
}

- (IBAction)changeLineWidth:(UIStepper *)stepper
{
    self.separatableView.separatorLineWidth = stepper.value;

    self.lineWidthLabel.text = [@(stepper.value) stringValue];
}

- (IBAction)changeTopInset:(UIStepper *)stepper
{
    UIEdgeInsets separatorInset = self.separatableView.separatorInset;
    separatorInset.top = stepper.value;
    self.separatableView.separatorInset = separatorInset;

    self.topInsetLabel.text = [@(stepper.value) stringValue];
}

- (IBAction)changeBottomInset:(UIStepper *)stepper
{
    UIEdgeInsets separatorInset = self.separatableView.separatorInset;
    separatorInset.bottom = stepper.value;
    self.separatableView.separatorInset = separatorInset;

    self.bottomInsetLabel.text = [@(stepper.value) stringValue];
}

- (IBAction)changeLeftInset:(UIStepper *)stepper
{
    UIEdgeInsets separatorInset = self.separatableView.separatorInset;
    separatorInset.left = stepper.value;
    self.separatableView.separatorInset = separatorInset;

    self.leftInsetLabel.text = [@(stepper.value) stringValue];
}

- (IBAction)changeRightInset:(UIStepper *)stepper
{
    UIEdgeInsets separatorInset = self.separatableView.separatorInset;
    separatorInset.right = stepper.value;
    self.separatableView.separatorInset = separatorInset;

    self.rightInsetLabel.text = [@(stepper.value) stringValue];
}

@end
