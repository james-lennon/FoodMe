//
//  FMYelpHelper.m
//  YelpTester
//
//  Created by Jake Saferstein on 11/14/15.
//  Copyright © 2015 Jake Saferstein. All rights reserved.
//

#import "FMYelpHelper.h"
#import "NSURLRequest+OAuth.h"
#import "FMLocationHelper.h"

@interface FMYelpHelper ()

@property (nonatomic) NSUserDefaults* dflts;
@property (nonatomic) NSMutableDictionary* yelpData;

@end

@implementation FMYelpHelper

SINGLETON_IMPL(FMYelpHelper);

/**
 Default paths and search terms used in this example
 */
static NSString * const kAPIHost           = @"api.yelp.com";
static NSString * const kSearchPath        = @"/v2/search/";
static NSString * const kBusinessPath      = @"/v2/business/";
static NSString * const kSearchLimit       = @"3";

-(instancetype) init
{
    if(self = [super init]) {
        
        _dflts = [NSUserDefaults standardUserDefaults];
        
        [self loadYelpData];
    }
    return self;
}

#pragma mark - Data Processing


//rating*log(#ratings) + friend recommendations - friend dislikes -distance  + (yelp categories)
-(double) makeRankingForRest: (NSDictionary* )biz andRankInSearch: (int) searchRanking
{
    //Have coefficients stored in _yelpData
    //still need: biz ranking, num rankings, rank in search, distance, categories its in.
    double bizRating = [biz[@"rating"] doubleValue];
    int numRatings = [biz[@"review_count"] intValue];
    double distance = [biz[@"distance"] doubleValue];
#warning make sure distance works
    
    double sumCatCoeffs = 0;
    NSArray* categories = biz[@"categories"];
    for (NSArray* cat in categories) {
        
        sumCatCoeffs += [_yelpData[cat[1]] doubleValue];
    }
    
    double avgCatCoeff = sumCatCoeffs / categories.count;
    
    double adjustedRating = [_yelpData[@"ratingCoeff"] doubleValue] * bizRating * log(numRatings);
    double adjustedDistance = [_yelpData[@"distanceCoeff"] doubleValue] * distance;
    double adjustedSearchRanking = [_yelpData[@"searchRankingCoeff"] doubleValue] *searchRanking;
    
    return adjustedRating + adjustedDistance - adjustedSearchRanking + avgCatCoeff;
}

#pragma mark - Data Storage/Loading

- (void) loadYelpData
{
    NSDictionary* yelpData = [_dflts objectForKey:@"yelpData"];
    
    if(!yelpData) {
        
        NSMutableDictionary* newData = [NSMutableDictionary dictionary];
        
        newData[@"ratingCoeff"] = @(1);
        newData[@"searchRankingCoeff"] = @(1);
        newData[@"distanceCoeff"] = @(1);
        newData[@"categoryCoeffs"] = @{}; //This will be updated every search to autofill categoreis instead of manual input of each category.;
        
        _yelpData = newData;
        
        [self saveYelpData];
    }
    else {
        _yelpData = [NSMutableDictionary dictionaryWithDictionary:yelpData];
    }
}

-(void) createCategoryIfNeeded: (NSString *)catName
{
    if (!_yelpData[@"categoryCoeffs"][catName]) {
        
        NSMutableDictionary* newDict = [NSMutableDictionary dictionaryWithDictionary:_yelpData[@"categoryCoeffs"]];
        [newDict setObject:@(1) forKey:catName];
        _yelpData[@"categoryCoeffs"] = newDict;
    }
}

- (void) updateCategoryInfoWithArray: (NSArray *)bizzes
{
    for (NSDictionary* biz in bizzes) {
        
        for (NSArray* category in biz[@"categories"]) {
            //Category is an array of size 2, with a category name and an alias that is searchable in filters
            //We save the alias name in case we want to search with this later.
            
            [self createCategoryIfNeeded:category[1]];
        }
    }
}

- (void) saveYelpData
{
    [_dflts setObject:_yelpData forKey:@"yelpData"];
}


#pragma mark - Querying Work

- (void) queryRestsWithLocation: (NSString *)location andRadiusInMeters: (double) meters andTerm: (NSString *)term andLimit: (int) limit andPriceDescription: (NSString *)price
              completionHandler:(void (^)(NSArray *results, NSError *error))completionHandler
{
    NSLog(@"Querying the stuff");
    
    NSString* newTerm = [NSString stringWithFormat:@"%@ %@", price, term];
    
    
    double lat = [FMLocationHelper sharedInstance].curLoc.coordinate.latitude;
    double longit = [FMLocationHelper sharedInstance].curLoc.coordinate.longitude;
    
    NSURLRequest *searchRequest = [self createSearchWithLocation:location andRadiusInMeters:meters andTerm:newTerm andLimit:limit andLat:lat andLong:longit];
    NSURLSession *session = [NSURLSession sharedSession];

    [[session dataTaskWithRequest:searchRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        
        if (!error && httpResponse.statusCode == 200) {
            
            NSDictionary *searchResponseJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSArray *businessArray = searchResponseJSON[@"businesses"];
            
            if (businessArray.count > 0) {
                
                NSArray* filteredBiz = [self filterArray:businessArray];
                NSLog(@"Filtered Array %@", filteredBiz);
                
                [self updateCategoryInfoWithArray: filteredBiz];
                
                completionHandler(filteredBiz, error);
            }
            else {
                completionHandler(nil, error); // No business was found
            }
        }
        else {
            completionHandler(nil, error); // An error happened or the HTTP response is not a 200 OK
        }
    }] resume];
}

- (NSMutableArray *) filterArray: (NSArray *)bizzes
{
    NSMutableArray* toRet = [NSMutableArray array];
    
    for (NSDictionary* biz in bizzes) {
        
        int isClosed = [biz[@"is_closed"] intValue];
        
        if (isClosed == 0) {
            [toRet addObject:biz];
        }
    }
    
    return toRet;
}

- (NSURLRequest *) createSearchWithLocation: (NSString *)location andRadiusInMeters: (double) meters andTerm: (NSString *)term andLimit: (int) limit andLat: (double) latitude andLong: (double) longitude
{
    NSDictionary* params = @{
                             @"location": location,
                             @"limit": [NSString stringWithFormat:@"%i",limit],
                             @"term": term,
                             @"radius_filter": [NSString stringWithFormat:@"%f", meters],
                             @"cll": [NSString stringWithFormat:@"%f,%f", latitude,longitude]
                             };
    
    return [NSURLRequest requestWithHost:kAPIHost path:kSearchPath params:params];
}

/**
 Builds a request to hit the search endpoint with the given parameters.
 
 @param term The term of the search, e.g: dinner
 @param location The location request, e.g: San Francisco, CA
 
 @return The NSURLRequest needed to perform the search
 */
- (NSURLRequest *)_searchRequestWithTerm:(NSString *)term location:(NSString *)location {
    NSDictionary *params = @{
                             @"term": term,
                             @"location": location,
                             @"limit": kSearchLimit
                             };
    
    return [NSURLRequest requestWithHost:kAPIHost path:kSearchPath params:params];
}

@end
