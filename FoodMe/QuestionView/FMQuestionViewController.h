//
//  FMQuestionViewController.h
//  FoodMe
//
//  Created by James Lennon on 11/13/15.
//  Copyright © 2015 Jake Saferstein. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMQuestionViewController : UIViewController

@property NSString* question;
@property NSArray* answers;

-(id)initWithQuestion:(NSString*)question answers:(NSArray*)answers;

@end
