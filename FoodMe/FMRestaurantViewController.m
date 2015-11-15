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
//        _data = dict;
        _data = @{@"name": @"Test", @"url": @"google.com", @"image_url": @"http://previews.123rf.com/images/youichi4411/youichi44111104/youichi4411110400057/9364461-Food-square-icons-set-Illustration-vector--Stock-Vector-kitchen-fork-cook.jpg"};
    }
    return self;
}

-(void)viewDidLoad {
    self.view.backgroundColor = BACKGROUND_COLOR;
    
    CGSize size = self.view.frame.size;
    _restaurantView = [[FMRestaurantView alloc] initWithFrame:CGRectMake(20, 200, size.width - 40, size.height / 2 - 100) Dictionary:_data];
    [self.view addSubview:_restaurantView];
}

@end
