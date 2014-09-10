//
//  ViewController.m
//  My Flappy Bird
//
//  Created by John Vu on 2014-09-05.
//  Copyright (c) 2014 JV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScore"];
    HighScoreNumSaved.text = [NSString stringWithFormat:@"High Score: %li", (long)HighScoreNumber];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
