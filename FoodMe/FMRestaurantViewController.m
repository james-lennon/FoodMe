//
//  FMRestaurantViewController.m
//  FoodMe
//
//  Created by James Lennon on 11/14/15.
//  Copyright © 2015 Jake Saferstein. All rights reserved.
//

#import "FMRestaurantViewController.h"
#import "FMColors.h"

@implementation FMRestaurantViewController

-(id)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _restaurantView = [[FMRestaurantView alloc] initWithFrame:CGRectMake(0, 0, 500, 500) Dictionary:dict];
    }
    return self;
}

-(void)viewDidLoad {
    self.view.backgroundColor = BACKGROUND_COLOR;
    
    [self.view addSubview:_restaurantView];
}

@end
