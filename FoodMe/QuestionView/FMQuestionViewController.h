//
//  FMQuestionViewController.h
//  FoodMe
//
//  Created by James Lennon on 11/13/15.
//  Copyright © 2015 Jake Saferstein. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MAX_QUESTIONS 3

@interface FMQuestionViewController : UIViewController

@property NSString* question;
@property NSArray* answers;
@property UILabel* questionLabel;
@property NSMutableArray* answerButtons;

-(id)initWithQuestion:(NSString*)question answers:(NSArray*)answers;

@end
