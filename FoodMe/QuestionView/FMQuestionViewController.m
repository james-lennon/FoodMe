//
//  FMQuestionViewController.m
//  FoodMe
//
//  Created by James Lennon on 11/13/15.
//  Copyright © 2015 Jake Saferstein. All rights reserved.
//

#import "FMQuestionViewController.h"

@interface FMQuestionViewController ()

@end

@implementation FMQuestionViewController

-(id)initWithQuestion:(NSString *)question answers:(NSArray *)answers {
    self = [super init];
    if (self) {
        _question = question;
        
        if (answers.count <= MAX_QUESTIONS) {
            _answers = answers;
        } else {
            
        }
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
