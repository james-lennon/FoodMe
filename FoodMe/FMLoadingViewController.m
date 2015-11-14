//
//  FMLoadingViewController.m
//  FoodMe
//
//  Created by James Lennon on 11/14/15.
//  Copyright © 2015 Jake Saferstein. All rights reserved.
//

#import "FMLoadingViewController.h"
#import "FMLoadingView.h"
#import "FMColors.h"

@implementation FMLoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = BACKGROUND_COLOR;
    
    CGSize size = self.view.frame.size;
    FMLoadingView* lv = [[FMLoadingView alloc] initWithFrame:CGRectMake(size.width / 2 - 120, size.height / 2 - 100, 200, 200)];
    [self.view addSubview:lv];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
