//
//  PBViewController.m
//  ParBuzzer
//
//  Created by Scott Bedard on 6/21/14.
//  Copyright (c) 2014 Webolution, Inc. All rights reserved.
//

#import "PBViewController.h"
#import <Parse/Parse.h>
#import <FacebookSDK/FacebookSDK.h>

@interface PBViewController ()

@end

@implementation PBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void) sendNotification: (NSString *)message{
    // Send a notification to all devices subscribed to the "Giants" channel.
    PFPush *push = [[PFPush alloc] init];
    [push setChannel:@"labaladeplata"];
    [push setMessage:message];
    [push sendPushInBackground];
}

- (IBAction)parButtonPressed:(UIButton *)sender {
    [self sendNotification:[NSString stringWithFormat:@"%@ got a Par!", [[PFUser currentUser] objectForKey:@"fullName"]]];
}

- (IBAction)birdieButtonPressed:(UIButton *)sender {
    [self sendNotification:[NSString stringWithFormat:@"%@ got a Birdie!", [[PFUser currentUser] objectForKey:@"fullName"]]];
}

- (IBAction)coorslightButtonPressed:(UIButton *)sender {
    [self sendNotification:[NSString stringWithFormat:@"%@ is being refreshed by a Coors Light!", [[PFUser currentUser] objectForKey:@"fullName"]]];
}

- (IBAction)fbButtonPressed:(UIButton *)sender {
    
    NSArray *permissions = @[ @"public_profile" ];

    [PFFacebookUtils logInWithPermissions:permissions block:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Facebook login.");
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in through Facebook!");
            // Now add the data to the UI elements
            [self getFBName];
            
        } else {
            NSLog(@"User logged in through Facebook!");
            [self getFBName];
        }
    }];
}

-(void) getFBName{
    FBRequest *request = [FBRequest requestForMe];
    
    // Send request to Facebook
    [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            // result is a dictionary with the user's Facebook data
            NSDictionary *userData = (NSDictionary *)result;
            
            NSString *facebookID = userData[@"id"];
            NSString *name = userData[@"name"];
            NSString *location = userData[@"location"][@"name"];
            NSString *gender = userData[@"gender"];
            NSString *birthday = userData[@"birthday"];
            NSString *relationship = userData[@"relationship_status"];
            
            NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", facebookID]];
            
            PFUser *user = [PFUser currentUser];
            [user setObject:name forKey:@"fullName"];
            [user saveInBackground];
            
            [self.golfersNameLabel setText:name];
        }
    }];

}
@end
