//
//  PBViewController.m
//  ParBuzzer
//
//  Created by Scott Bedard on 6/21/14.
//  Copyright (c) 2014 Webolution, Inc. All rights reserved.
//

#import "PBViewController.h"

@interface PBViewController ()

@end

@implementation PBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



- (IBAction)parButtonPressed:(UIButton *)sender {
    
    UIAlertView *par = [[UIAlertView alloc] initWithTitle:@"Buzz" message:@"Scott got a Par" delegate:nil cancelButtonTitle:@"High Five" otherButtonTitles:nil, nil];
    [par show];
}
@end
