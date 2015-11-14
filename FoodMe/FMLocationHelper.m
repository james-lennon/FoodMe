//
//  FMLocationHelper.m
//  FoodMe
//
//  Created by Jake Saferstein on 11/14/15.
//  Copyright © 2015 Jake Saferstein. All rights reserved.
//

#import "FMLocationHelper.h"

@interface FMLocationHelper ()

@property CLLocationManager* mgr;

@end

@implementation FMLocationHelper

SINGLETON_IMPL(FMLocationHelper);

-(instancetype) init
{
    if(self = [super init]) {
        
        _mgr = [[CLLocationManager alloc] init];
        _mgr.delegate = self;
        _mgr.distanceFilter = kCLDistanceFilterNone;
        _mgr.desiredAccuracy = kCLLocationAccuracyBest;
        
        [_mgr requestWhenInUseAuthorization];
    }
    return self;
}

-(void) startTrackingLocation
{
    [_mgr startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
//    NSLog(@"OldLocation %f %f", oldLocation.coordinate.latitude, oldLocation.coordinate.longitude);
//    NSLog(@"NewLocation %f %f", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
    _curLoc = newLocation;
}

@end
