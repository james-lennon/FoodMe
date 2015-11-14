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

-(void)findRankingsWithCompletionHandler:(void (^)(NSArray *results, NSError *error))completionHandler;
-(void) saveYelpData;
-(void) setSearchRadiusBasedOnTime: (NSString *)timeRange;
-(void) setPriceDescBasedOnResponse: (NSString *) response;

@end
