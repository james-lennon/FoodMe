//
//  FMSetupViewController.m
//  FoodMe
//
//  Created by James Lennon on 11/14/15.
//  Copyright © 2015 Jake Saferstein. All rights reserved.
//

#import "FMSetupViewController.h"
#import "FMQuestionViewController.h"

@implementation FMSetupViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _questionIndex = 0;
        _prompts = @[
                     @"We'll need to ask you a few questions to get set up.",
                     @"What's your price range?",
                     @"How far away do you want to eat?",
                     ];
        _options = @[
                     @[@"Ok"],
                     @[@"$5-$10", @"$10-$20", @"$20-$40"],
                     @[@"5 - 10 min", @"10 20 min", @"20 - 40 min"]
                     ];
    }
    return self;
}

-(void) showQuestionVC:(NSInteger) index animated:(BOOL)animated {
    FMQuestionViewController* vc = [[FMQuestionViewController alloc] initWithQuestion:_prompts[index] answers:_options[index]];
    vc.questionDelegate = self;
    if (_currentlyDisplayedVC) {
        [_currentlyDisplayedVC presentViewController:vc animated:animated completion:^{
        }];
    } else {
        [self presentViewController:vc animated:animated completion:nil];
    }
    _currentlyDisplayedVC = vc;
}

-(void)viewDidAppear:(BOOL)animated {
    [self showQuestionVC:0 animated:NO];
}

-(void) answerChosen:(NSString*)answer WithQuestion:(NSString*)question {
    
    // TODO: update user data with response here
    
    _questionIndex++;
    if (_questionIndex >= _prompts.count) {
        [_setupDelegate setupCompleted];
    } else {
        [self showQuestionVC:_questionIndex animated:YES];
    }
}

@end
