//
//  FMYelpHelper.h
//  YelpTester
//
//  Created by Jake Saferstein on 11/14/15.
//  Copyright © 2015 Jake Saferstein. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SingletonHelper.h"

@interface FMYelpHelper : NSObject

SINGLETON_INTR(FMYelpHelper);

- (void) queryRestsWithLocation: (NSString *)location andRadiusInMeters: (double) meters andTerm: (NSString *)term andLimit: (int) limit andPriceDescription: (NSString *)price
              completionHandler:(void (^)(NSArray *results, NSError *error))completionHandler;

- (void) saveYelpData;

@end
