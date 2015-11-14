//
//  FMTopLevelViewController.h
//  FoodMe
//
//  Created by James Lennon on 11/14/15.
//  Copyright © 2015 Jake Saferstein. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMMainViewController.h"
#import "FMQuestionViewController.h"

@interface FMTopLevelViewController : UIViewController<FMQuestionDelegate>

@property (nonatomic) FMMainViewController* mainVC;

-(void) answerChosen:(NSString*)answer WithQuestion:(NSString*)question;

@end