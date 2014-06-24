//
//  PBViewController.h
//  ParBuzzer
//
//  Created by Scott Bedard on 6/21/14.
//  Copyright (c) 2014 Webolution, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PBViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *golfersNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *fbProfileImage;

- (IBAction)parButtonPressed:(UIButton *)sender;
- (IBAction)fbButtonPressed:(UIButton *)sender;
- (IBAction)birdieButtonPressed:(UIButton *)sender;
- (IBAction)coorslightButtonPressed:(UIButton *)sender;
- (IBAction)havingfunButtonPressed:(UIButton *)sender;
@end
