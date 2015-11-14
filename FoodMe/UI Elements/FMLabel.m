//
//  FMLabel.m
//  FoodMe
//
//  Created by James Lennon on 11/14/15.
//  Copyright © 2015 Jake Saferstein. All rights reserved.
//

#import "FMLabel.h"
#import "FMColors.h"

@implementation FMLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textColor = TEXT_COLOR;
        self.textAlignment = NSTextAlignmentCenter;
        
        UIFont* font = [UIFont fontWithName:@"Varela" size:30];
        NSLog(@"%@\n", font);
        [self setFont:font];
    }
    return self;
}

@end
