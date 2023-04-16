//
//  LPLoginViewController.h
//  LuxPix
//
//  Created by Mark Edmunds on 24/05/2014.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LPSessionController.h"

@interface LPLoginViewController : UIViewController <LPSessionControllerDelegate>

- (IBAction)facebookLoginTapped:(id)sender;
- (IBAction)twitterLoginTapped:(id)sender;

@end
