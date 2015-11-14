//
//  FMTopLevelViewController.m
//  FoodMe
//
//  Created by James Lennon on 11/14/15.
//  Copyright © 2015 Jake Saferstein. All rights reserved.
//

#import "FMTopLevelViewController.h"
#import "FMSetupViewController.h"

@implementation FMTopLevelViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)viewDidLoad {
    _mainVC = [[FMMainViewController alloc] init];
}

-(void)viewDidAppear:(BOOL)animated {
    FMSetupViewController* vc = [[FMSetupViewController alloc] init];
    vc.setupDelegate = self;
    [self presentViewController:vc animated:NO completion:nil];
}


-(void)setupCompleted {
    
    [[self presentedViewController] presentViewController:_mainVC animated:YES completion:nil];
}

@end