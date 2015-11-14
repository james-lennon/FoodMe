//
//  FMButton.m
//  FoodMe
//
//  Created by James Lennon on 11/14/15.
//  Copyright © 2015 Jake Saferstein. All rights reserved.
//

#import "FMButton.h"

@implementation FMButton

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 10;
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.borderWidth = 3;
    }
    return self;
}

@end
