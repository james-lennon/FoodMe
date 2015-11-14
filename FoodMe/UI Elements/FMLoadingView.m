//
//  FMLoadingView.m
//  FoodMe
//
//  Created by James Lennon on 11/14/15.
//  Copyright © 2015 Jake Saferstein. All rights reserved.
//

#import "FMLoadingView.h"

@implementation FMLoadingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _potView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pot.png"]];
        _steamView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"steam.png"]];
    }
    return self;
}

@end
