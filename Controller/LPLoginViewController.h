//
//  LPLoginViewController.h
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import "LPSessionController.h"
#import <UIKit/UIKit.h>

@interface LPLoginViewController
    : UIViewController <LPSessionControllerDelegate>

- (IBAction)facebookLoginTapped:(id)sender;
- (IBAction)twitterLoginTapped:(id)sender;

@end
