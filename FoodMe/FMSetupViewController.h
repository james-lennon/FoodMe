//
//  FMSetupViewController.h
//  FoodMe
//
//  Created by James Lennon on 11/14/15.
//  Copyright © 2015 Jake Saferstein. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMSetupViewController : UIViewController<FMQuestionDelegate>

@property (nonatomic) NSInteger questionIndex;
@property (nonatomic) NSArray* prompts;
@property (nonatomic) NSArray* options;

-(void) answerChosen:(NSString*)answer WithQuestion:(NSString*)question;

@end
