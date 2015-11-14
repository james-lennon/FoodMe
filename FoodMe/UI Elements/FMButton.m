//
//  FMButton.m
//  FoodMe
//
//  Created by James Lennon on 11/14/15.
//  Copyright © 2015 Jake Saferstein. All rights reserved.
//

#import "FMButton.h"
#import "FMColors.h"

@implementation FMButton

-(id)initWithFrame:(CGRect)frame completion:(void (^)())completion; {
    self = [super initWithFrame:frame];
    if (self) {
        _completion = completion;
        
        self.layer.cornerRadius = 10;
        self.layer.borderColor = TEXT_COLOR.CGColor;
        self.layer.borderWidth = 3;
        self.titleLabel.textColor = [UIColor blackColor];
//        [self setTitleColor:TEXT_COLOR forState:UIControlStateNormal];
        
        [self addTarget:self action:@selector(buttonHighlight) forControlEvents:UIControlEventTouchDown];
    }
    return self;
}

-(void) buttonHighlight {
    [UIView animateWithDuration:.15 animations:^{
        [self setBackgroundColor:TEXT_COLOR];
        [self setTitleColor: BACKGROUND_COLOR forState: UIControlStateNormal];
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            _completion();
        });
    }];
}

@end
