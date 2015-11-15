//
//  FMMainViewController.m
//  FoodMe
//
//  Created by James Lennon on 11/14/15.
//  Copyright © 2015 Jake Saferstein. All rights reserved.
//

#import "FMMainViewController.h"
#import "FMColors.h"
#import "FMLoadingViewController.h"
#import "FMYelpHelper.h"

@implementation FMMainViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

-(void)viewDidLoad {
    self.view.backgroundColor = BACKGROUND_COLOR;
    
    _titleLabel = [[FMLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [_titleLabel sizeToFit];
    
    CGSize size = self.view.frame.size;
    
    CGFloat sidePadding = 30, btnHeight = 100;
    
    _startButton = [[FMButton alloc] initWithFrame:CGRectMake(sidePadding, size.height / 2 - btnHeight / 2, size.width - 2 * sidePadding, btnHeight) completion:^{
        [self transition];
    }];
    [_startButton setTitle:@"food me" forState:UIControlStateNormal];
    [self.view addSubview:_startButton];
}

-(void) transition {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:.5f animations:^{
            
            [_startButton setAlpha:0.0f];
            
        } completion:^(BOOL finished) {
            
            FMLoadingViewController* lvc = [[FMLoadingViewController alloc] init];
            [self presentViewController:lvc animated:YES completion:^{
                [[FMYelpHelper sharedInstance] findTopBiz:^(NSDictionary *biz, NSError *error) {
                    
                    NSLog(@"Top business: %@", biz);
                    
                    NSString* categoryName = biz[@"categories"][0][0];
                    
                    NSLog(@"Category Name: %@", categoryName);
                    
                    NSString* questionStr = [NSString stringWithFormat:@"How does %@ sound?", categoryName];
                    FMQuestionViewController* confirmVC = [[FMQuestionViewController alloc] initWithQuestion:questionStr answers:@[@"Great, let's go!", @"No thanks"]];
                    [self dismissViewControllerAnimated:YES completion:^{
                        [self presentViewController:confirmVC animated:NO completion:nil];
                    }];
                    
                }];
            }];
        }];
    });
}

-(void)answerChosen:(NSString *)answer WithQuestion:(NSString *)question {
    if ([answer  isEqual: @"Great, let's go!"]) {
        // Show restaurant / directions
    } else {
        // re-choose
    }
}

@end
