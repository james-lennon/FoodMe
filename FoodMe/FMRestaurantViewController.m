//
//  FMRestaurantViewController.m
//  FoodMe
//
//  Created by James Lennon on 11/14/15.
//  Copyright © 2015 Jake Saferstein. All rights reserved.
//

#import "FMRestaurantViewController.h"
#import "FMColors.h"
#import "FMButton.h"
#import "FMLocationHelper.h"

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
    _restaurantView = [[FMRestaurantView alloc] initWithFrame:CGRectMake(20, 50, size.width - 40, size.height / 2 - 100) Dictionary:_data];
    
    FMButton* btn = [[FMButton alloc] initWithFrame:CGRectMake(20, _restaurantView.frame.origin.y + _restaurantView.frame.size.height + 10, size.width - 40, 100) completion:^{
        // TODO open maps
        NSDictionary* coords = _data[@"location"][@"coordinate"];
        NSLog(@"%@\n", coords);
        if (coords) {
            
            CLLocation* loc = [[FMLocationHelper sharedInstance] curLoc];
            
            NSString* url = [NSString stringWithFormat:@"http://maps.google.com/maps?saddr=%f,%f&daddr=%@,%@", loc.coordinate.latitude, loc.coordinate.longitude, coords[@"latitude"], coords[@"longitude"]];
            [[UIApplication sharedApplication] openURL: [NSURL URLWithString: url]];
            
//            NSString* url = [NSString stringWithFormat:@"maps.apple.com/?ll=%@,%@", coords[@"latitude"], coords[@"longitude"]];
        }
    }];
    [btn setTitle:@"Go!" forState:UIControlStateNormal];
    
    [self.view addSubview:_restaurantView];
    [self.view addSubview:btn];
}

@end
