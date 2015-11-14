//
//  FMYelpHelper.h
//  YelpTester
//
//  Created by Jake Saferstein on 11/14/15.
//  Copyright © 2015 Jake Saferstein. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMYelpHelper : NSObject

/**
 Query the Yelp API with a given term and location and displays the progress in the log
 
 @param term: The term of the search, e.g: dinner
 @param location: The location in which the term should be searched for, e.g: San Francisco, CA
 */
+ (void)queryTopBusinessInfoForTerm:(NSString *)term location:(NSString *)location completionHandler:(void (^)(NSDictionary *jsonResponse, NSError *error))completionHandler;

+ (void) queryRestsWithLocation: (NSString *)location andRadiusInMeters: (double) meters andTerm: (NSString *)term andLimit: (int) limit andPriceDescription: (NSString *)price
              completionHandler:(void (^)(NSArray *results, NSError *error))completionHandler;

@end
