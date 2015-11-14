//
//  FMMainViewController.m
//  FoodMe
//
//  Created by James Lennon on 11/14/15.
//  Copyright © 2015 Jake Saferstein. All rights reserved.
//

#import "FMMainViewController.h"
#import "FMColors.h"
#import "FMQuestionViewController.h"

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
            
            // TODO search yelp + print result

        }];
    });
}

@end
