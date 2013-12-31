//
//  DemoViewController.m
//  HJRSeparableView
//
//  Created by Jiro Nagashima on 12/31/13.
//  Copyright (c) 2013 Jiro Nagashima. All rights reserved.
//

#import "DemoViewController.h"
#import "SettingsViewController.h"
#import "HJRSeparableView.h"

@interface DemoViewController ()

@property (weak, nonatomic) IBOutlet HJRSeparableView *separableView;

@end

@implementation DemoViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PushSettings"]) {
        SettingsViewController *viewController = segue.destinationViewController;
        viewController.separableView = self.separableView;
    }
}

@end
