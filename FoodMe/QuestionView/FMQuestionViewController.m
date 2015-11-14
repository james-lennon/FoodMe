//
//  FMQuestionViewController.m
//  FoodMe
//
//  Created by James Lennon on 11/13/15.
//  Copyright © 2015 Jake Saferstein. All rights reserved.
//

#import "FMQuestionViewController.h"
#import "NSMutableArray_Shuffling.h"
#import "FMColors.h"
#include "FMButton.h"

@interface FMQuestionViewController ()

@end

@implementation FMQuestionViewController

-(id)initWithQuestion:(NSString *)question answers:(NSArray *)answers {
    self = [super init];
    if (self) {
        _question = question;
        _answerButtons = [NSMutableArray array];
        
        if (answers.count <= MAX_QUESTIONS) {
            _answers = answers;
        } else {
            NSMutableArray* newList = [answers mutableCopy];
            [newList shuffle];
            
            _answers = @[newList[0], newList[1], newList[2]];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BACKGROUND_COLOR;
    
    CGFloat width = self.view.frame.size.width, height = self.view.frame.size.height;

    _questionLabel = [[FMLabel alloc] initWithFrame:CGRectMake(10, 50, 200, 40)];
    [_questionLabel setText:_question];
    [self.view addSubview:_questionLabel];
    
    CGFloat padding = 50;
    CGFloat btnWidth = width - 2 * padding;
    CGFloat btnHeight = 50;
    for (int i = 0; i < _answers.count; i++) {
        FMButton* btn = [[FMButton alloc] initWithFrame:CGRectMake(padding, 200 + i * (btnHeight + 10), btnWidth, btnHeight) completion:^{
            NSLog(@"selected: %@\n", _answers[i]);
        }];
        [btn setTitle:_answers[i] forState:UIControlStateNormal];
        
        [self.view addSubview:btn];
        [self.answerButtons addObject:btn];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
