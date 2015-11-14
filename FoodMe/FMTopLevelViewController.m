//
//  FMTopLevelViewController.m
//  FoodMe
//
//  Created by James Lennon on 11/14/15.
//  Copyright © 2015 Jake Saferstein. All rights reserved.
//

#import "FMTopLevelViewController.h"
#import "FMQuestionViewController.h"

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
    [self presentViewController:_mainVC animated:NO completion:nil];
}


-(void) answerChosen:(NSString*)answer WithQuestion:(NSString*)question {
    
}

@end
