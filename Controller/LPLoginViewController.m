//
//  LPLoginViewController.m
//  LuxPix
//
//  Created by Mark Edmunds on 24/05/2014.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import "LPLoginViewController.h"
#import "MBProgressHUD.h"

@implementation LPLoginViewController {
	LPSessionController *_sessionController;
	MBProgressHUD *_activityIndicator;
}

- (void)viewDidLoad {
  [super viewDidLoad];

	_sessionController = [LPSessionController sharedInstance];
	[_sessionController setDelegate:self];

  _activityIndicator = [[MBProgressHUD alloc] initWithView:self.view];
  [self.view addSubview:_activityIndicator];
}

- (void)sessionDidLogin {
	[self performSegueWithIdentifier:@"Home" sender:self];
}

- (void)sessionDidError:(NSString *)errorMessage {
	[[[UIAlertView alloc] initWithTitle:@"Error" message:errorMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

- (IBAction)facebookLoginTapped:(id)sender {
	[_sessionController setServiceWithServiceType:LPSessionServiceTypeFacebook];
	[_sessionController login];
  [_activityIndicator show:YES];
}

- (IBAction)twitterLoginTapped:(id)sender {
	[_sessionController setServiceWithServiceType:LPSessionServiceTypeTwitter];
	[_sessionController login];
	[_activityIndicator show:YES];
}

@end
