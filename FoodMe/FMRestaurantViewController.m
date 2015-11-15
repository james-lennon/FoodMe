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
        _data = dict;
    }
    return self;
}

-(void)viewDidLoad {
    self.view.backgroundColor = BACKGROUND_COLOR;
    
    CGSize size = self.view.frame.size;
    _restaurantView = [[FMRestaurantView alloc] initWithFrame:CGRectMake(20, 200, size.width - 40, 300) Dictionary:_data];
    [self.view addSubview:_restaurantView];
}

@end
