//
//  FMTopLevelViewController.m
//  FoodMe
//
//  Created by James Lennon on 11/14/15.
//  Copyright © 2015 Jake Saferstein. All rights reserved.
//

#import "FMTopLevelViewController.h"
#import "FMSetupViewController.h"
#import "FMColors.h"

@implementation FMTopLevelViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _shouldSetup = YES;
    }
    return self;
}

-(void)viewDidLoad {
    self.view.backgroundColor = BACKGROUND_COLOR;
    
    _mainVC = [[FMMainViewController alloc] init];
}

-(void)viewDidAppear:(BOOL)animated {
    if (_shouldSetup) {
        _shouldSetup = NO;
        FMSetupViewController* vc = [[FMSetupViewController alloc] init];
        vc.setupDelegate = self;
        [self presentViewController:vc animated:NO completion:nil];
    }
}

+ (UIViewController*) topMostController
{
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    
    return topController;
}

-(void)setupCompleted {
    [self presentViewController:_mainVC animated:NO completion:nil];
}

@end